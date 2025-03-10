<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #000428, #004e92);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            font-size: 32px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }
        ul {
            list-style: none;
            padding: 0;
            width: 300px;
            text-align: center;
        }
        ul li {
            margin: 15px 0;
        }
        ul li a {
            display: block;
            padding: 12px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
        }
        ul li a:hover {
            background: #007BFF;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<h1>Admin Dashboard</h1>
<ul>
    <li><a href="manageCars">Manage Cars</a></li>
    <li><a href="manageDrivers">Manage Drivers</a></li>

</ul>
</body>
</html>
