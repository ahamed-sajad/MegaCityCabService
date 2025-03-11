<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Mega City Cab Service</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #141E30, #243B55);
            color: white;
            overflow-x: hidden;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 50px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            color: #FFD700;
            text-shadow: 0px 0px 10px rgba(255, 215, 0, 0.8);
            font-size: 3rem;
            margin-bottom: 20px;
        }

        /* Contact Form */
        .contact-form {
            margin-top: 30px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            text-align: left;
            max-width: 700px;
            margin: auto;
            animation: fadeIn 2s ease-in-out;
        }

        .contact-form label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 15px;
            margin-top: 5px;
            border-radius: 5px;
            border: none;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            font-size: 16px;
            transition: background 0.3s;
        }

        .contact-form input::placeholder, .contact-form textarea::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .contact-form input:hover, .contact-form textarea:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .contact-form button {
            width: 100%;
            padding: 12px;
            background: #04C45C;
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .contact-form button:hover {
            background: #039645;
            transform: scale(1.05);
        }

        /* Google Map Link */
        .map-link {
            margin-top: 40px;
            font-size: 18px;
            animation: fadeIn 2s ease-in-out;
        }

        footer {
            background: #1a1a1a;
            color: white;
            padding: 15px 0;
            text-align: center;
            animation: fadeIn 2s ease-in-out;
        }

        footer p {
            font-size: 14px;
        }

        footer a {
            color: #FFD700;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Contact Us</h2>

    <!-- Contact Form Section -->
    <div class="contact-form">
        <h3>Send Us a Message</h3>
        <form action="mailto:support@megacitycab.com" method="post" enctype="text/plain" onsubmit="return validateForm()">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>

            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="message">Your Message:</label>
            <textarea id="message" name="message" rows="5" placeholder="Type your message here" required></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>

    <!-- Google Maps Link -->
    <div class="map-link">
        <p>Click the link below to open Google Maps:</p>
        <a href="https://www.google.com/maps" target="_blank" style="color: #FFD700; text-decoration: none; font-size: 18px;">
            Open Google Maps
        </a>
    </div>
</div>

<!-- Footer Section -->
<footer>
    <p>&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
    <p><a href="privacy-policy.jsp">Privacy Policy</a> | <a href="terms-conditions.jsp">Terms & Conditions</a></p>
</footer>

<!-- JavaScript for Form Validation -->
<script>
    function validateForm() {
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var message = document.getElementById("message").value;

        // Check if all fields are filled out
        if (name == "" || email == "" || message == "") {
            alert("Please fill in all fields.");
            return false;
        }

        // Validate email format
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!email.match(emailPattern)) {
            alert("Please enter a valid email address.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
