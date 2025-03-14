<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #141E30, #243B55); /* Gradient background */
            color: white;
        }

        /* Navbar Styling */
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 15px;
            text-align: center;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            margin: 0 10px;
            transition: 0.3s;
        }
        .navbar a:hover {
            background-color: #007BFF;
            border-radius: 5px;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 100px 20px;
            background-color: #1e2a3a; /* Solid background color */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            margin: 50px auto;
            border-radius: 10px;
            width: 80%;
        }
        .hero h1 {
            font-size: 42px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }
        .hero p {
            font-size: 20px;
            color: #ddd;
            margin-bottom: 20px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 15px 30px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            font-size: 20px;
            border-radius: 5px;
            transition: 0.3s ease-in-out;
        }
        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <a href="index.jsp">Home</a>
    <a href="AboutUs.jsp">About Us</a>
    <a href="HelpandSupport.jsp">Help & Support</a>
    <a href="Contact.jsp">Contact</a>
</div>

<!-- Hero Section -->
<div class="hero">
    <h1>Welcome to Mega City Cab Service</h1>
    <p>Experience the Difference in Every Ride</p>
    <a href="login.jsp" class="btn">Get Started</a>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
