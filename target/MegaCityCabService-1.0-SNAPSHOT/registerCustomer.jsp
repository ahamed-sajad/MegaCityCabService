<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            width: 350px;
            text-align: center;
        }
        .register-container h2 {
            color: #FFD700;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: white;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            outline: none;
        }
        .form-group input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        .form-group button {
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0px 5px 15px rgba(40, 167, 69, 0.4);
            transition: all 0.3s ease-in-out;
        }
        .form-group button:hover {
            background: #218838;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Customer Registration</h2>
    <form action="registerCustomer" method="post">
        <div class="form-group">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" required>
        </div>
        <div class="form-group">
            <label for="contactNumber">Contact Number:</label>
            <input type="text" id="contactNumber" name="contactNumber" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">Register</button>
        </div>
    </form>
</div>
</body>
</html>
