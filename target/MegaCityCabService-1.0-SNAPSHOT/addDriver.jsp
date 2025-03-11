<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Add New Driver</title>
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

<h1 style="text-align: center;">Add New Driver</h1>

<form action="${pageContext.request.contextPath}/addDriver" method="POST">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required>

  <label for="age">Age:</label>
  <input type="number" id="age" name="age" min="18" required>

  <label for="nationality">Nationality:</label>
  <input type="text" id="nationality" name="nationality" required>

  <label for="drivingExperience">Driving Experience (Years):</label>
  <input type="number" id="drivingExperience" name="drivingExperience" min="0" required>

  <label for="nic">NIC:</label>
  <input type="text" id="nic" name="nic" required>

  <label for="contactNumber">Contact Number:</label>
  <input type="text" id="contactNumber" name="contactNumber" required>

  <label for="username">Username:</label>
  <input type="text" id="username" name="username" required>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" required>

  <label for="status">Status:</label>
  <select id="status" name="status" required>
    <option value="Available">Available</option>
    <option value="On a Journey">On a Journey</option>
  </select>

  <button type="submit">Add Driver</button>
</form>

</body>
</html>
