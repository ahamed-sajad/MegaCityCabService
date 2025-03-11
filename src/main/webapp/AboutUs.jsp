<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Mega City Cab Service</title>
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
        }

        h2 {
            color: #FFD700;
            text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
            font-size: 3rem;
            margin-bottom: 20px;
        }

        /* Section Styles */
        .section {
            margin-top: 40px;
            text-align: left;
            animation: fadeIn 2s ease-in-out;
        }

        .section h3 {
            font-size: 2rem;
            color: #FFD700;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .section p {
            font-size: 1.2rem;
            line-height: 1.8;
            color: #ccc;
            text-align: justify;
        }

        /* Mission and Vision Section */
        .mission-vision {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }

        .mission-vision div {
            width: 45%;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .mission-vision div:hover {
            background: rgba(255, 215, 0, 0.1);
            transform: scale(1.05);
        }

        .mission-vision h4 {
            color: #FFD700;
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .mission-vision p {
            font-size: 1.1rem;
            color: #ccc;
        }

        /* Team Section */
        .team-section {
            margin-top: 60px;
        }

        .team-members {
            display: flex;
            justify-content: space-between;
            overflow-x: auto;
            padding-bottom: 20px;
            gap: 20px;
        }

        .team-member {
            width: 25%;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .team-member:hover {
            transform: scale(1.1);
        }

        .team-member img {
            width: 100%;
            height: 250px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #FFD700;
        }

        .team-member h4 {
            font-size: 1.2rem;
            margin-top: 10px;
            color: #FFD700;
        }

        /* Call to Action Section */
        .cta {
            margin-top: 80px;
            background-color: #04C45C;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .cta h3 {
            font-size: 2rem;
            color: white;
            font-weight: bold;
        }

        .cta p {
            font-size: 1.2rem;
            color: white;
            margin-top: 20px;
        }

        .cta a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #FFD700;
            color: black;
            text-decoration: none;
            font-weight: bold;
            margin-top: 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }

        .cta a:hover {
            background-color: #FFC107;
        }

        /* Footer Section */
        footer {
            background: #1a1a1a;
            color: white;
            padding: 15px 0;
            text-align: center;
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

        /* Animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .mission-vision div {
                width: 100%;
                margin-bottom: 20px;
            }

            .team-members {
                flex-direction: column;
                align-items: center;
            }

            .team-member {
                width: 70%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>About Us</h2>

    <!-- Our Mission and Vision -->
    <div class="section mission-vision">
        <div>
            <h4>Our Mission</h4>
            <p>At Mega City Cab Service, our mission is to provide safe, reliable, and affordable transportation to our customers. We strive to ensure that every ride is a seamless and enjoyable experience, setting new standards in urban transportation.</p>
        </div>
        <div>
            <h4>Our Vision</h4>
            <p>Our vision is to be the most trusted and preferred transportation service in the city. We aim to continually improve our services by embracing technology, maintaining high standards of safety, and offering unmatched customer support.</p>
        </div>
    </div>

    <!-- Meet Our Team -->
    <div class="section team-section">
        <h3>Meet Our Team</h3>
        <p>Our team is composed of experienced and dedicated professionals who are committed to providing exceptional service. Get to know some of our key members below:</p>

        <div class="team-members">
            <div class="team-member">
                <img src="https://via.placeholder.com/200" alt="John Doe">
                <h4>John Doe</h4>
                <p>CEO</p>
            </div>
            <div class="team-member">
                <img src="https://via.placeholder.com/200" alt="Jane Smith">
                <h4>Jane Smith</h4>
                <p>Operations Manager</p>
            </div>
            <div class="team-member">
                <img src="https://via.placeholder.com/200" alt="Michael Brown">
                <h4>Michael Brown</h4>
                <p>Lead Driver</p>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="cta">
        <h3>Join Mega City Cab Service Today!</h3>
        <p>Ready for a reliable ride? Join us for a seamless, safe, and comfortable journey wherever you go. We’re here to provide the best transportation experience.</p>
        <a href="registerCustomer.jsp">Book Your Ride Now</a>
    </div>

</div>

<!-- Footer Section -->
<footer>
    <p>&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
    <p><a href="privacy-policy.jsp">Privacy Policy</a> | <a href="terms-conditions.jsp">Terms & Conditions</a></p>
</footer>

</body>
</html>
