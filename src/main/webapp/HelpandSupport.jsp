<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service | Help & Support</title>
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

        /* FAQ Section */
        .faq-section {
            margin-top: 30px;
            text-align: left;
            margin-bottom: 20px;
            animation: fadeIn 2s ease-in-out;
        }

        .faq-question {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-bottom: 5px;
            transition: 0.3s;
        }

        .faq-question:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }

        .faq-answer {
            display: none;
            padding: 10px;
            border-left: 4px solid #FFD700;
            margin-bottom: 10px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            transition: 0.3s;
        }

        /* Contact Form */
        .contact-form {
            margin-top: 30px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            text-align: left;
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
        }

        .contact-form input::placeholder, .contact-form textarea::placeholder {
            color: rgba(255, 255, 255, 0.7);
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
            transition: 0.3s;
        }

        .contact-form button:hover {
            background: #039645;
            transform: scale(1.05);
        }

        /* Live Chat */
        .chat-box {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 300px;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px;
            border-radius: 10px;
            display: none;
            max-height: 400px;
            overflow-y: auto;
        }

        .chat-box textarea {
            width: 100%;
            height: 50px;
            border-radius: 5px;
            border: none;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            outline: none;
        }

        .chat-box button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .chat-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 15px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .chat-button:hover {
            transform: scale(1.1);
        }

        /* Mobile & Desktop Responsiveness */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            .faq-section {
                text-align: center;
            }

            .contact-form {
                text-align: center;
            }

            .chat-box {
                bottom: 10px;
                right: 10px;
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
    <h2>Help & Support</h2>

    <!-- FAQ Section -->
    <div class="faq-section">
        <h3>Frequently Asked Questions</h3>
        <div class="faq-question" onclick="toggleAnswer(1)">📌 How do I book a ride?</div>
        <div class="faq-answer" id="answer1">Go to your dashboard, select a car, and click "Book Now".</div>

        <div class="faq-question" onclick="toggleAnswer(2)">📌 How can I cancel my booking?</div>
        <div class="faq-answer" id="answer2">Navigate to 'My Bookings' and click 'Cancel' next to your booking.</div>

        <div class="faq-question" onclick="toggleAnswer(3)">📌 What payment methods do you accept?</div>
        <div class="faq-answer" id="answer3">We accept credit/debit cards, PayPal, and cash.</div>

        <!-- New FAQ Questions -->
        <div class="faq-question" onclick="toggleAnswer(4)">📌 How can I change my driver?</div>
        <div class="faq-answer" id="answer4">You can change your driver by contacting customer support or selecting a different driver while booking.</div>

        <div class="faq-question" onclick="toggleAnswer(5)">📌 What should I do if I leave something in the car?</div>
        <div class="faq-answer" id="answer5">If you've left something in the car, please contact our customer support immediately, and we will assist you in retrieving it.</div>

        <div class="faq-question" onclick="toggleAnswer(6)">📌 How do I track my ride?</div>
        <div class="faq-answer" id="answer6">You can track your ride in real-time on the app or by logging into your account on the website.</div>

        <div class="faq-question" onclick="toggleAnswer(7)">📌 Is there a cancellation fee?</div>
        <div class="faq-answer" id="answer7">There may be a small cancellation fee depending on how close the cancellation is to your scheduled pickup time. Refer to our cancellation policy for more details.</div>

        <div class="faq-question" onclick="toggleAnswer(8)">📌 Can I schedule a ride for a future date?</div>
        <div class="faq-answer" id="answer8">Yes, you can schedule a ride for a future date by selecting the 'Schedule a Ride' option in the booking process.</div>

        <div class="faq-question" onclick="toggleAnswer(9)">📌 How do I contact customer support?</div>
        <div class="faq-answer" id="answer9">You can contact customer support via our website's contact page or by calling our helpline at 123-456-7890.</div>
    </div>

    <!-- Contact Form -->
    <div class="contact-form">
        <h3>Contact Us</h3>
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
</div>

<!-- Live Chat -->
<button class="chat-button" onclick="toggleChat()">💬 Live Chat</button>
<div class="chat-box" id="chatBox">
    <div id="chatHistory"></div>
    <textarea id="chatInput" placeholder="Type your message..."></textarea>
    <button onclick="sendMessage()">Send</button>
</div>

<!-- JavaScript -->
<script>
    // Toggle FAQ answers
    function toggleAnswer(id) {
        let answer = document.getElementById("answer" + id);
        answer.style.display = answer.style.display === "block" ? "none" : "block";
    }

    // Validate form before submission
    function validateForm() {
        let name = document.getElementById('name').value;
        let email = document.getElementById('email').value;
        if (name == "" || email == "") {
            alert("Please fill in all fields.");
            return false;
        }

        // Check if email format is valid
        let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        if (!email.match(emailPattern)) {
            alert("Please enter a valid email address.");
            return false;
        }

        return true;
    }

    // Toggle Live Chat
    function toggleChat() {
        let chatBox = document.getElementById("chatBox");
        chatBox.style.display = chatBox.style.display === "block" ? "none" : "block";
    }

    // Simulate sending a message
    function sendMessage() {
        let chatInput = document.getElementById('chatInput');
        let chatHistory = document.getElementById('chatHistory');
        if (chatInput.value.trim()) {
            let message = document.createElement('p');
            message.textContent = "You: " + chatInput.value;
            chatHistory.appendChild(message);
            chatInput.value = ""; // Clear input after sending
            chatHistory.scrollTop = chatHistory.scrollHeight; // Scroll to bottom
        }
    }
</script>

</body>
</html>
