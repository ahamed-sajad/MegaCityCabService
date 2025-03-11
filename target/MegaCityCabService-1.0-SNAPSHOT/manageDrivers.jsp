<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Driver" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Manage Drivers</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            margin: 0;
            padding: 20px;
            text-align: center;
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
        .status-journey {
            color: #DC3545;
            font-weight: bold;
        }
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
