package com.megacitycabservice.controller;

import com.megacitycabservice.model.Car;
import com.megacitycabservice.service.DatabaseConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CarServlet", urlPatterns = {"/manageCars", "/editCar", "/updateCar", "/deleteCar", "/addCar"})
public class CarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/editCar":
                showEditForm(request, response);
                break;
            case "/deleteCar":
                deleteCar(request, response);
                break;
            default:
                listCars(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/updateCar":
                updateCar(request, response);
                break;
            case "/addCar":
                addCar(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
                break;
        }
    }


    private void listCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Car> carList = new ArrayList<>();
        String query = "SELECT * FROM car";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String status = rs.getString("Status");

                if (status == null || status.trim().isEmpty()) {
                    status = "Unavailable"; // Default value if null
                }

                Car car = new Car(
                        rs.getInt("CarID"),
                        rs.getString("Model"),
                        rs.getString("LicensePlate"),
                        rs.getInt("Capacity"),
                        rs.getString("FuelType"),
                        rs.getDouble("RentalPricePerKm"),
                        status
                );
                carList.add(car);
            }

        } catch (SQLException e) {
            getServletContext().log("Database error in CarServlet", e);
        }

        request.setAttribute("carList", carList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageCars.jsp");
        dispatcher.forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carID = Integer.parseInt(request.getParameter("carId"));
        Car car = null;
        String query = "SELECT * FROM car WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, carID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String status = rs.getString("Status");

                if (status == null || status.isEmpty()) {
                    status = "Unavailable";
                }

                car = new Car(
                        rs.getInt("CarID"),
                        rs.getString("Model"),
                        rs.getString("LicensePlate"),
                        rs.getInt("Capacity"),
                        rs.getString("FuelType"),
                        rs.getDouble("RentalPricePerKm"),
                        status
                );
            }
        } catch (SQLException e) {
            getServletContext().log("Database error while fetching car details", e);
        }

        request.setAttribute("car", car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCar.jsp");
        dispatcher.forward(request, response);
    }


    private void addCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String model = request.getParameter("model");
        String licensePlate = request.getParameter("licensePlate");
        String fuelType = request.getParameter("fuelType");
        String status = request.getParameter("status");

        int capacity = parseInt(request.getParameter("capacity"), 0);
        double rentalPricePerKm = parseDouble(request.getParameter("rentalPricePerKm"), 0.0);

        if (model == null || model.isEmpty() || licensePlate == null || licensePlate.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Model and License Plate are required.");
            return;
        }

        if (status == null || status.isEmpty()) {
            status = "Unavailable";
        }

        String insertQuery = "INSERT INTO car (Model, LicensePlate, Capacity, FuelType, RentalPricePerKm, Status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(insertQuery)) {

            stmt.setString(1, model);
            stmt.setString(2, licensePlate);
            stmt.setInt(3, capacity);
            stmt.setString(4, fuelType);
            stmt.setDouble(5, rentalPricePerKm);
            stmt.setString(6, status);

            stmt.executeUpdate();

            response.sendRedirect("manageCars");
        } catch (SQLException e) {
            getServletContext().log("Database insert error in CarServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }


    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int carID = Integer.parseInt(request.getParameter("carID"));
        String model = request.getParameter("model");
        String licensePlate = request.getParameter("licensePlate");
        String fuelType = request.getParameter("fuelType");
        String status = request.getParameter("status");

        int capacity = parseInt(request.getParameter("capacity"), 0);
        double rentalPricePerKm = parseDouble(request.getParameter("rentalPricePerKm"), 0.0);

        if (status == null || status.isEmpty()) {
            status = "Unavailable";
        }

        String updateQuery = "UPDATE car SET Model = ?, LicensePlate = ?, Capacity = ?, FuelType = ?, RentalPricePerKm = ?, Status = ? WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(updateQuery)) {

            stmt.setString(1, model);
            stmt.setString(2, licensePlate);
            stmt.setInt(3, capacity);
            stmt.setString(4, fuelType);
            stmt.setDouble(5, rentalPricePerKm);
            stmt.setString(6, status);
            stmt.setInt(7, carID);

            stmt.executeUpdate();

            response.sendRedirect("manageCars");
        } catch (SQLException e) {
            getServletContext().log("Database update error in CarServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }


    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int carID = Integer.parseInt(request.getParameter("carId"));
        String deleteQuery = "DELETE FROM car WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(deleteQuery)) {

            stmt.setInt(1, carID);
            stmt.executeUpdate();

            response.sendRedirect("manageCars");
        } catch (SQLException e) {
            getServletContext().log("Database delete error in CarServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }

    private int parseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private double parseDouble(String value, double defaultValue) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
