<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Driver Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #f0f0f0; }
        .accept-button { background-color: green; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .reject-button { background-color: red; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .complete-button { background-color: blue; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .completed-text { color: gray; font-weight: bold; }
    </style>
</head>
<body>

<h1>Welcome, <%= session.getAttribute("username") %></h1>

<!-- Pending Bookings -->
<h2>Pending Bookings</h2>
<c:choose>
    <c:when test="${not empty pendingBookings}">
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Car Model</th>
                <th>Customer</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Booking Date</th>
                <th>Action</th>
            </tr>
            <c:forEach var="booking" items="${pendingBookings}">
                <tr>
                    <td>${booking.bookingNumber}</td>
                    <td>${booking.carModel}</td>
                    <td>${booking.customerName}</td>
                    <td>${booking.pickupLocation}</td>
                    <td>${booking.dropoffLocation}</td>
                    <td>${booking.bookingDate}</td>
                    <td>
                        <form action="driverBooking" method="POST">
                            <input type="hidden" name="bookingNumber" value="${booking.bookingNumber}">
                            <button type="submit" name="action" value="accept" class="accept-button">Accept</button>
                            <button type="submit" name="action" value="reject" class="reject-button">Reject</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p style="text-align: center; color: red;">No pending bookings.</p>
    </c:otherwise>
</c:choose>

<!-- Active Bookings -->
<h2>Active Bookings</h2>
<c:choose>
    <c:when test="${not empty activeBookings}">
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Car Model</th>
                <th>Customer</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Booking Date</th>
                <th>Action</th>
            </tr>
            <c:forEach var="booking" items="${activeBookings}">
                <tr>
                    <td>${booking.bookingNumber}</td>
                    <td>${booking.carModel}</td>
                    <td>${booking.customerName}</td>
                    <td>${booking.pickupLocation}</td>
                    <td>${booking.dropoffLocation}</td>
                    <td>${booking.bookingDate}</td>
                    <td>
                        <form action="completeBooking" method="POST">
                            <input type="hidden" name="bookingNumber" value="${booking.bookingNumber}">
                            <button type="submit" class="complete-button">Mark as Completed</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p style="text-align: center; color: red;">No active bookings.</p>
    </c:otherwise>
</c:choose>

<!-- Completed Rides -->
<h2>Completed Rides</h2>
<c:choose>
    <c:when test="${not empty completedBookings}">
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Car Model</th>
                <th>Customer</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Booking Date</th>
                <th>Status</th>
            </tr>
            <c:forEach var="booking" items="${completedBookings}">
                <tr>
                    <td>${booking.bookingNumber}</td>
                    <td>${booking.carModel}</td>
                    <td>${booking.customerName}</td>
                    <td>${booking.pickupLocation}</td>
                    <td>${booking.dropoffLocation}</td>
                    <td>${booking.bookingDate}</td>
                    <td class="completed-text">✔ Completed</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
</c:choose>

</body>
</html>
