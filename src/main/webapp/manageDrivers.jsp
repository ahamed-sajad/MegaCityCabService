<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Driver" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Manage Drivers</title>
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
        .status-journey { color: red; font-weight: bold; }
    </style>
</head>
<body>

<h1>Manage Drivers</h1>

<%
    List<Driver> driverList = (List<Driver>) request.getAttribute("driverList");
    if (driverList == null) {
        driverList = new ArrayList<>();
    }
%>

<% if (!driverList.isEmpty()) { %>
<table>
    <thead>
    <tr>
        <th>Driver ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Nationality</th>
        <th>Driving Experience</th>
        <th>NIC</th>
        <th>Contact Number</th>
        <th>Username</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Driver driver : driverList) { %>
    <tr>
        <td><%= driver.getDriverID() %></td>
        <td><%= driver.getName() %></td>
        <td><%= driver.getAge() %></td>
        <td><%= driver.getNationality() %></td>
        <td><%= driver.getDrivingExperience() %> years</td>
        <td><%= driver.getNic() %></td>
        <td><%= driver.getContactNumber() %></td>
        <td><%= driver.getUsername() %></td>
        <td>
            <% if ("Available".equals(driver.getStatus())) { %>
            <span class="status-available">Available</span>
            <% } else { %>
            <span class="status-journey">On a Journey</span>
            <% } %>
        </td>
        <td>
            <a href="editDriver?driverId=<%= driver.getDriverID() %>">Edit</a> |
            <a href="deleteDriver?driverId=<%= driver.getDriverID() %>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } else { %>
<p>No drivers found in the database.</p>
<% } %>

<br>
<a href="addDriver.jsp" class="add-button">Add New Driver</a>

</body>
</html>
