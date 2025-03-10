<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-around;
            align-items: center;
            background: linear-gradient(to right, #001F3F, #007BFF);
            padding: 15px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            transition: 0.3s;
        }
        .navbar a:hover {
            background: #007BFF;
            border-radius: 5px;
        }

        /* Hero Section */
        .hero {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            flex: 1;
            padding: 100px 20px;
        }
        .hero h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 10px;
            text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.7);
        }
        .hero p {
            font-size: 20px;
            color: #ccc;
            margin-bottom: 30px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 15px 40px;
            background: #007BFF;
            color: white;
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
            border-radius: 50px;
            box-shadow: 0px 5px 15px rgba(0, 123, 255, 0.4);
            transition: all 0.3s ease-in-out;
        }
        .btn:hover {
            background: #0056b3;
            transform: translateY(-5px);
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 2px;
            background: rgba(0, 0, 0, 0.9);
            color: white;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <a href="#">Home</a>
    <a href="#">About Us</a>
    <a href="help.jsp">Help & Support</a>
    <a href="#">Contact</a>
</div>

<!-- Hero Section -->
<div class="hero">
    <h1>Your Trusted Ride, Anytime</h1>
    <p>Seamless, Safe, and Reliable Cab Services</p>
    <a href="login.jsp" class="btn">Let's Ride</a>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
