<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Mega City Cab Service</title>
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
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            width: 400px;
            text-align: center;
        }
        .login-container h2 {
            color: #007BFF;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            color: white;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
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
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0px 5px 15px rgba(0, 123, 255, 0.4);
            transition: all 0.3s ease-in-out;
        }
        .form-group button:hover {
            background: #0056b3;
            transform: translateY(-3px);
        }
        .register-link {
            margin-top: 20px;
            padding: 12px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            backdrop-filter: blur(5px);
            text-align: center;
        }
        .register-link p {
            margin: 0;
            font-size: 14px;
            color: white;
        }
        .register-link a {
            color: #00aaff;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            padding: 5px;
        }
        .register-link a:hover {
            text-decoration: underline;
            color: #007BFF;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="">Select Role</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
                <option value="driver">Driver</option>
            </select>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
    </form>
    <div class="register-link">
        <p>Don't have an account? <a href="registerCustomer.jsp">Register as Customer</a>
    </div>
</div>
</body>
</html>
