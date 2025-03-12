package com.megacitycabservice.controller;

import com.megacitycabservice.service.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // ✅ Parse Booking ID and Total Amount
            int bookingID = Integer.parseInt(request.getParameter("bookingID"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            // 🔍 Debugging Print Statements
            System.out.println("🔹 Debug: Booking ID = " + bookingID);
            System.out.println("🔹 Debug: Total Amount = " + totalAmount);

            // ✅ Process Payment and Update DB
            boolean paymentSuccess = processPayment(bookingID, totalAmount);

            if (paymentSuccess) {
                // ✅ Redirect to bill.jsp to generate receipt
                response.sendRedirect("bill.jsp?bookingID=" + bookingID);
            } else {
                response.getWriter().println("❌ Error: Payment failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error: " + e.getMessage());
        }
    }

    private boolean processPayment(int bookingNumber, double totalAmount) {
        String insertPaymentQuery = "INSERT INTO payments (booking_number, total_amount, payment_date) VALUES (?, ?, NOW())";
        String updateBookingQuery = "UPDATE booking SET PaymentStatus = 'Paid' WHERE booking_number = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement paymentStmt = conn.prepareStatement(insertPaymentQuery);
             PreparedStatement updateStmt = conn.prepareStatement(updateBookingQuery)) {

            conn.setAutoCommit(false);

            System.out.println("🔹 Debug: Booking Number = " + bookingNumber);
            System.out.println("🔹 Debug: Total Amount = " + totalAmount);

            // ✅ Insert into payments table
            paymentStmt.setInt(1, bookingNumber);
            paymentStmt.setDouble(2, totalAmount);  // ✅ Ensure it's properly set

            int paymentInserted = paymentStmt.executeUpdate();
            System.out.println("🔹 Debug: Payment Inserted = " + paymentInserted);

            // ✅ Update booking table
            updateStmt.setInt(1, bookingNumber);
            int bookingUpdated = updateStmt.executeUpdate();
            System.out.println("🔹 Debug: Booking Updated = " + bookingUpdated);

            if (paymentInserted > 0 && bookingUpdated > 0) {
                conn.commit();
                return true;
            } else {
                conn.rollback();
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

