package com.megacitycabservice.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");


        String hashedPassword = hashPassword(password);

        String tableName = getTableName(role);
        String usernameColumn = getUsernameColumn(role);

        if (tableName == null) {
            request.setAttribute("errorMessage", "Invalid role selected!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = com.megacitycabservice.service.DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM " + tableName + " WHERE " + usernameColumn + " = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if ("admin".equals(role)) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if ("customer".equals(role)) {
                    response.sendRedirect("customerDashboard");
                } else if ("driver".equals(role)) {
                    response.sendRedirect("driverDashboard");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection error: " + e.getMessage());
        }
    }


    private String getTableName(String role) {
        switch (role.toLowerCase()) {
            case "admin": return "user";
            case "customer": return "customer";
            case "driver": return "driver";
            default: return null;
        }
    }


    private String getUsernameColumn(String role) {
        switch (role.toLowerCase()) {
            case "admin": return "username";
            case "customer": return "Username";
            case "driver": return "Username";
            default: return "username";
        }
    }


    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
