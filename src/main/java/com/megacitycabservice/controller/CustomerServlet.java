package com.megacitycabservice.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registerCustomer")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String contactNumber = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String hashedPassword = hashPassword(password);

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/megacitycabdb";
        String dbUser = "root";
        String dbPassword = "admin123";

        Connection connection = null;
        PreparedStatement userStmt = null;
        PreparedStatement customerStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            connection.setAutoCommit(false);


            String userSQL = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";
            userStmt = connection.prepareStatement(userSQL);
            userStmt.setString(1, username);
            userStmt.setString(2, hashedPassword);
            userStmt.setString(3, "customer");
            int userInserted = userStmt.executeUpdate();

            if (userInserted > 0) {

                String customerSQL = "INSERT INTO customer (Name, Address, NIC, ContactNumber, Email, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?)";
                customerStmt = connection.prepareStatement(customerSQL);
                customerStmt.setString(1, name);
                customerStmt.setString(2, address);
                customerStmt.setString(3, nic);
                customerStmt.setString(4, contactNumber);
                customerStmt.setString(5, email);
                customerStmt.setString(6, username);
                customerStmt.setString(7, hashedPassword);

                int customerInserted = customerStmt.executeUpdate();

                if (customerInserted > 0) {
                    connection.commit();
                    response.sendRedirect("login.jsp");
                    return;
                }
            }

            connection.rollback();
            response.getWriter().println("❌ Registration failed. Please try again.");

        } catch (Exception e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            response.getWriter().println("❌ Error: " + e.getMessage());

        } finally {
            try {
                if (userStmt != null) userStmt.close();
                if (customerStmt != null) customerStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
