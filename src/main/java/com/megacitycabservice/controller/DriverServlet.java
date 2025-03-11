package com.megacitycabservice.controller;

import com.megacitycabservice.model.Driver;
import com.megacitycabservice.service.DatabaseConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DriverServlet", urlPatterns = {"/manageDrivers", "/editDriver", "/updateDriver", "/deleteDriver", "/addDriver"})
public class DriverServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/editDriver":
                showEditForm(request, response);
                break;
            case "/deleteDriver":
                deleteDriver(request, response);
                break;
            default:
                listDrivers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/updateDriver":
                updateDriver(request, response);
                break;
            case "/addDriver":
                addDriver(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
                break;
        }
    }

    
    private void listDrivers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Driver> driverList = new ArrayList<>();
        String query = "SELECT * FROM driver";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Driver driver = new Driver(
                        rs.getInt("DriverID"),
                        rs.getString("Name"),
                        rs.getInt("Age"),
                        rs.getString("Nationality"),
                        rs.getInt("DrivingExperience"),
                        rs.getString("NIC"),
                        rs.getString("ContactNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Status")
                );
                driverList.add(driver);
            }

        } catch (SQLException e) {
            getServletContext().log("Database error in DriverServlet", e);
        }

        request.setAttribute("driverList", driverList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageDrivers.jsp");
        dispatcher.forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int driverID = Integer.parseInt(request.getParameter("driverId"));
        Driver driver = null;
        String query = "SELECT * FROM driver WHERE DriverID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, driverID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                driver = new Driver(
                        rs.getInt("DriverID"),
                        rs.getString("Name"),
                        rs.getInt("Age"),
                        rs.getString("Nationality"),
                        rs.getInt("DrivingExperience"),
                        rs.getString("NIC"),
                        rs.getString("ContactNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Status")
                );
            }
        } catch (SQLException e) {
            getServletContext().log("Database error while fetching driver details", e);
        }

        request.setAttribute("driver", driver);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editDriver.jsp");
        dispatcher.forward(request, response);
    }


    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String nationality = request.getParameter("nationality");
        int drivingExperience = Integer.parseInt(request.getParameter("drivingExperience"));
        String nic = request.getParameter("nic");
        String contactNumber = request.getParameter("contactNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String status = request.getParameter("status");


        String hashedPassword = hashPassword(password);

        String insertDriverQuery = "INSERT INTO driver (Name, Age, Nationality, DrivingExperience, NIC, ContactNumber, Username, Password, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertUserQuery = "INSERT INTO user (Username, Password, Role) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false);


            try (PreparedStatement stmtDriver = conn.prepareStatement(insertDriverQuery)) {
                stmtDriver.setString(1, name);
                stmtDriver.setInt(2, age);
                stmtDriver.setString(3, nationality);
                stmtDriver.setInt(4, drivingExperience);
                stmtDriver.setString(5, nic);
                stmtDriver.setString(6, contactNumber);
                stmtDriver.setString(7, username);
                stmtDriver.setString(8, hashedPassword);
                stmtDriver.setString(9, status);
                stmtDriver.executeUpdate();
            }


            try (PreparedStatement stmtUser = conn.prepareStatement(insertUserQuery)) {
                stmtUser.setString(1, username);
                stmtUser.setString(2, hashedPassword);
                stmtUser.setString(3, "driver");
                stmtUser.executeUpdate();
            }

            conn.commit();
            response.sendRedirect("manageDrivers");
        } catch (SQLException e) {
            getServletContext().log("Database insert error in DriverServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }



    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String nationality = request.getParameter("nationality");
        int drivingExperience = Integer.parseInt(request.getParameter("drivingExperience"));
        String nic = request.getParameter("nic");
        String contactNumber = request.getParameter("contactNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String status = request.getParameter("status");

        String updateQuery;

        if (password != null && !password.isEmpty()) {

            updateQuery = "UPDATE driver SET Name = ?, Age = ?, Nationality = ?, DrivingExperience = ?, NIC = ?, ContactNumber = ?, Username = ?, Password = ?, Status = ? WHERE DriverID = ?";
        } else {

            updateQuery = "UPDATE driver SET Name = ?, Age = ?, Nationality = ?, DrivingExperience = ?, NIC = ?, ContactNumber = ?, Username = ?, Status = ? WHERE DriverID = ?";
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(updateQuery)) {

            stmt.setString(1, name);
            stmt.setInt(2, age);
            stmt.setString(3, nationality);
            stmt.setInt(4, drivingExperience);
            stmt.setString(5, nic);
            stmt.setString(6, contactNumber);
            stmt.setString(7, username);

            if (password != null && !password.isEmpty()) {
                stmt.setString(8, password);
                stmt.setString(9, status);
                stmt.setInt(10, driverID);
            } else {
                stmt.setString(8, status);
                stmt.setInt(9, driverID);
            }

            stmt.executeUpdate();
            response.sendRedirect("manageDrivers");

        } catch (SQLException e) {
            getServletContext().log("Database update error in DriverServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }


    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverID = Integer.parseInt(request.getParameter("driverId"));

        String deleteQuery = "DELETE FROM driver WHERE DriverID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(deleteQuery)) {

            stmt.setInt(1, driverID);
            stmt.executeUpdate();

            response.sendRedirect("manageDrivers");
        } catch (SQLException e) {
            getServletContext().log("Database delete error in DriverServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : hashedBytes) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}

