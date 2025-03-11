<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Booking Details</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    form { width: 400px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; }
    label { font-weight: bold; margin-top: 10px; display: block; }
    input, select { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
    button { margin-top: 15px; padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
    button:hover { background-color: #45a049; }
  </style>
</head>
<body>

<h1 style="text-align: center;">Enter Booking Details</h1>

<%
  int carID = Integer.parseInt(request.getParameter("carID"));
  int driverID = Integer.parseInt(request.getParameter("driverID"));
  String username = (String) session.getAttribute("username"); // Customer username from session
%>

<form action="processBooking" method="POST">
  <input type="hidden" name="carID" value="<%= carID %>">
  <input type="hidden" name="driverID" value="<%= driverID %>">
  <input type="hidden" name="username" value="<%= username %>">

  <label for="pickupLocation">Pickup Location:</label>
  <input type="text" id="pickupLocation" name="pickupLocation" required>

  <label for="dropoffLocation">Drop-off Location:</label>
  <input type="text" id="dropoffLocation" name="dropoffLocation" required>

  <label for="distance">Distance (km):</label>
  <input type="number" id="distance" name="distance" required placeholder="Enter distance in km">

  <label for="bookingDate">Booking Date & Time:</label>
  <input type="datetime-local" id="bookingDate" name="bookingDate" required>

  <label for="paymentMethod">Payment Method:</label>
  <select id="paymentMethod" name="paymentMethod" required>
    <option value="Cash">Cash</option>
    <option value="Card">Card</option>
  </select>

  <button type="submit">Confirm Booking</button>
</form>

</body>
</html>
