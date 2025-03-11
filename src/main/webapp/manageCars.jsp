<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Car" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Manage Cars</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #f0f0f0; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        a { text-decoration: none; color: #007BFF; }
        a:hover { text-decoration: underline; }
        .add-button { margin-top: 20px; display: inline-block; padding: 10px 20px; background-color: #28a745; color: white; border-radius: 5px; }
        .add-button:hover { background-color: #218838; }
        .status-available { color: green; font-weight: bold; }
        .status-unavailable { color: red; font-weight: bold; }
        .status-unknown { color: orange; font-weight: bold; }
    </style>
</head>
<body>

<h1>Manage Cars</h1>

<%
    List<Car> carList = (List<Car>) request.getAttribute("carList");
    if (carList == null) {
        carList = new ArrayList<>();
    }
%>

<% if (!carList.isEmpty()) { %>
<table>
    <thead>
    <tr>
        <th>Car ID</th>
        <th>Model</th>
        <th>License Plate</th>
        <th>Capacity</th>
        <th>Fuel Type</th>
        <th>Rental Price per Km (LKR)</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Car car : carList) { %>
    <tr>
        <td><%= car.getCarID() %></td>
        <td><%= car.getModel() != null ? car.getModel() : "N/A" %></td>
        <td><%= car.getLicensePlate() != null ? car.getLicensePlate() : "N/A" %></td>
        <td><%= car.getCapacity() %></td>
        <td><%= car.getFuelType() != null ? car.getFuelType() : "N/A" %></td>
        <td><%= car.getRentalPricePerKm() %></td>
        <td>
            <% if (car.getStatus() != null && !car.getStatus().isEmpty()) { %>
            <% if (car.getStatus().equalsIgnoreCase("Available")) { %>
            <span class="status-available">Available</span>
            <% } else if (car.getStatus().equalsIgnoreCase("Unavailable")) { %>
            <span class="status-unavailable">Unavailable</span>
            <% } else { %>
            <span class="status-unknown"><%= car.getStatus() %></span>
            <% } %>
            <% } else { %>
            <span class="status-unknown">Not Specified</span>
            <% } %>
        </td>
        <td>
            <a href="editCar?carId=<%= car.getCarID() %>">Edit</a> |
            <a href="deleteCar?carId=<%= car.getCarID() %>" onclick="return confirm('Are you sure you want to delete this car?')">Delete</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } else { %>
<p>No cars found in the database.</p>
<% } %>

<br>
<a href="addCar.jsp" class="add-button">Add New Car</a>

</body>
</html>
