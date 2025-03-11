<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Car" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Manage Cars</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #FFD700;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        th, td {
            padding: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
            color: white;
        }
        th {
            background: rgba(255, 255, 255, 0.2);
        }
        tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.1);
        }
        a {
            text-decoration: none;
            color: #00BFFF;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
            color: #FFD700;
        }
        .add-button {
            margin-top: 20px;
            display: inline-block;
            padding: 12px 24px;
            background: #28a745;
            color: white;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0px 5px 15px rgba(40, 167, 69, 0.4);
            transition: all 0.3s ease-in-out;
        }
        .add-button:hover {
            background: #218838;
            transform: scale(1.05);
        }
        .status-available {
            color: #28a745;
            font-weight: bold;
        }
        .status-unavailable {
            color: #DC3545;
            font-weight: bold;
        }
        .status-unknown {
            color: orange;
            font-weight: bold;
        }
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
