<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Payment Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            text-align: center;
            margin: 20px;
        }
        .container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
            background-color: rgba(0, 0, 0, 0.7);
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
        }
        h2 {
            color: #f8f9fa;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #333;
            color: white;
        }
        td {
            background-color: rgba(255, 255, 255, 0.1);
        }
        .pay-button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }
        .pay-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Payment Details</h2>

    <%
        // ✅ Safely Parse Values with Default Fallback
        int bookingID = request.getParameter("bookingID") != null ? Integer.parseInt(request.getParameter("bookingID")) : 0;

        String customerName = request.getParameter("customerName") != null ? request.getParameter("customerName") : "N/A";
        String driverName = request.getParameter("driverName") != null ? request.getParameter("driverName") : "N/A";
        String carModel = request.getParameter("carModel") != null ? request.getParameter("carModel") : "N/A";
        String pickupLocation = request.getParameter("pickupLocation") != null ? request.getParameter("pickupLocation") : "N/A";
        String dropoffLocation = request.getParameter("dropoffLocation") != null ? request.getParameter("dropoffLocation") : "N/A";
        String bookingDate = request.getParameter("bookingDate") != null ? request.getParameter("bookingDate") : "N/A";

        // ✅ Handle Null and Empty Numeric Fields
        double rentalPricePerKm = request.getParameter("rentalPricePerKm") != null && !request.getParameter("rentalPricePerKm").isEmpty() ?
                Double.parseDouble(request.getParameter("rentalPricePerKm")) : 0.0;
        double distance = request.getParameter("distance") != null && !request.getParameter("distance").isEmpty() ?
                Double.parseDouble(request.getParameter("distance")) : 0.0;
        double totalAmount = rentalPricePerKm * distance;

        // ✅ Apply 10% VAT
        double tax = totalAmount * 0.10;
        totalAmount += tax;

        // ✅ Apply Discount for Frequent Customers (5% after 3 rides)
        int rideCount = request.getParameter("rideCount") != null ? Integer.parseInt(request.getParameter("rideCount")) : 0;
        double discount = 0.0;
        if (rideCount >= 3) {
            discount = totalAmount * 0.05;
            totalAmount -= discount;
        }
    %>

    <table>
        <tr><th>Booking ID</th><td><%= bookingID %></td></tr>
        <tr><th>Customer Name</th><td><%= customerName %></td></tr>
        <tr><th>Driver Name</th><td><%= driverName %></td></tr>
        <tr><th>Car Model</th><td><%= carModel %></td></tr>
        <tr><th>Pickup Location</th><td><%= pickupLocation %></td></tr>
        <tr><th>Dropoff Location</th><td><%= dropoffLocation %></td></tr>
        <tr><th>Booking Date</th><td><%= bookingDate %></td></tr>
        <tr><th>Rental Price Per Km</th><td><%= rentalPricePerKm %> LKR</td></tr>
        <tr><th>Distance (Km)</th><td><%= distance %> Km</td></tr>
        <tr><th>VAT (10%)</th><td><%= tax %> LKR</td></tr>
        <% if (discount > 0) { %>
        <tr><th>Frequent Customer Discount (5%)</th><td>-<%= discount %> LKR</td></tr>
        <% } %>
        <tr><th>Total Amount</th><td><b><%= totalAmount %> LKR</b></td></tr>
    </table>

    <form action="processPayment" method="POST">
        <input type="hidden" name="bookingID" value="<%= bookingID %>">
        <input type="hidden" name="totalAmount" value="<%= totalAmount %>">
        <button type="submit" class="pay-button">Confirm Payment</button>
    </form>

</div>

</body>
</html>
