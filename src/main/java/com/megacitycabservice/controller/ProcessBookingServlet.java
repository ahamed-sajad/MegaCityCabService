package com.megacitycabservice.controller;

import com.megacitycabservice.service.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/processBooking")
public class ProcessBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.getWriter().println("❌ Error: User is not logged in!");
            return;
        }


        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        String bookingDate = request.getParameter("bookingDate");
        String paymentMethod = request.getParameter("paymentMethod");
        double distance = Double.parseDouble(request.getParameter("distance"));

        int carID = Integer.parseInt(request.getParameter("carID"));
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        int customerID = getCustomerID(username);

        if (customerID == -1) {
            response.getWriter().println("❌ Error: Customer not found!");
            return;
        }


        String insertBookingQuery = "INSERT INTO booking (CustomerID, CarID, DriverID, PickupLocation, DropoffLocation, BookingDate, PaymentMethod, Distance) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String updateCarStatusQuery = "UPDATE car SET Status = 'Unavailable' WHERE CarID = ?";
        String updateDriverStatusQuery = "UPDATE driver SET Status = 'On a Journey' WHERE DriverID = ?";

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement bookingStmt = conn.prepareStatement(insertBookingQuery);
                 PreparedStatement carStmt = conn.prepareStatement(updateCarStatusQuery);
                 PreparedStatement driverStmt = conn.prepareStatement(updateDriverStatusQuery)) {


                bookingStmt.setInt(1, customerID);
                bookingStmt.setInt(2, carID);
                bookingStmt.setInt(3, driverID);
                bookingStmt.setString(4, pickupLocation);
                bookingStmt.setString(5, dropoffLocation);
                bookingStmt.setString(6, bookingDate);
                bookingStmt.setString(7, paymentMethod);
                bookingStmt.setDouble(8, distance);
                bookingStmt.executeUpdate();


                carStmt.setInt(1, carID);
                carStmt.executeUpdate();

                driverStmt.setInt(1, driverID);
                driverStmt.executeUpdate();

                conn.commit();
                response.sendRedirect("customerDashboard");

            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
                response.getWriter().println("❌ Error processing booking: " + e.getMessage());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("❌ Database error: " + e.getMessage());
        }
    }

    private int getCustomerID(String username) {
        int customerID = -1;
        String query = "SELECT CustomerID FROM customer WHERE Username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customerID = rs.getInt("CustomerID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerID;
    }
}
