<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Add New Car</title>
    <style>
        body { font-family: Arial, sans-serif; }
        form { width: 400px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; }
        label { font-weight: bold; margin-top: 10px; display: block; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
        button { margin-top: 15px; padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #45a049; }
    </style>
</head>
<body>

<h1 style="text-align: center;">Add New Car</h1>
<form action="${pageContext.request.contextPath}/addCar" method="POST">
    <label for="model">Model:</label>
    <input type="text" id="model" name="model" required>

    <label for="licensePlate">License Plate:</label>
    <input type="text" id="licensePlate" name="licensePlate" required>

    <label for="capacity">Capacity:</label>
    <input type="number" id="capacity" name="capacity" min="1" required>

    <label for="fuelType">Fuel Type:</label>
    <select id="fuelType" name="fuelType" required>
        <option value="Petrol">Petrol</option>
        <option value="Diesel">Diesel</option>
        <option value="Electric">Electric</option>
        <option value="Hybrid">Hybrid</option>
    </select>

    <label for="rentalPricePerKm">Rental Price per Km (LKR):</label>
    <input type="number" id="rentalPricePerKm" name="rentalPricePerKm" step="0.01" min="0" required>

    <label for="status">Status:</label>
    <select id="status" name="status" required>
        <option value="Available">Available</option>
        <option value="Unavailable">Unavailable</option>
    </select>

    <button type="submit">Add Car</button>
</form>

</body>
</html>
