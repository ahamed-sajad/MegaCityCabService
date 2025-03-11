<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Driver" %>

<html>
<head>
    <title>Select a Driver</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: white;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }
        h2 {
            text-align: center;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: rgba(0, 0, 0, 0.7); /* Darker background for better visibility */
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #333; /* Darker background for headers */
            color: white; /* White text for headers */
        }
        td {
            background-color: rgba(255, 255, 255, 0.1); /* Slightly transparent background for rows */
        }
        .book-button {
            padding: 8px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .book-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h1>Select a Driver</h1>
<h2>Car Model: ${carModel}</h2> <!-- ✅ Show Car Model -->

<%
    List<Driver> availableDrivers = (List<Driver>) request.getAttribute("availableDrivers");
    Integer carID = (Integer) request.getAttribute("carID");

    if (availableDrivers == null || availableDrivers.isEmpty()) {
        out.println("<p style='color:red;'>❌ No available drivers found.</p>");
    }
%>

<% if (availableDrivers != null && !availableDrivers.isEmpty()) { %>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Age</th>
        <th>Nationality</th>
        <th>Experience</th>
        <th>NIC</th>
        <th>Contact</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (Driver driver : availableDrivers) { %>
    <tr>
        <td><%= driver.getName() %></td>
        <td><%= driver.getAge() %></td>
        <td><%= driver.getNationality() %></td>
        <td><%= driver.getDrivingExperience() %> years</td>
        <td><%= driver.getNic() %></td>
        <td><%= driver.getContactNumber() %></td>
        <td>
            <form action="bookingForm.jsp" method="GET">
                <input type="hidden" name="carID" value="<%= carID %>">
                <input type="hidden" name="driverID" value="<%= driver.getDriverID() %>">
                <button type="submit" class="book-button">Confirm Booking</button>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } %>

</body>
</html>
