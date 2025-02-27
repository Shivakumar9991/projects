<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #6c757d, #f8f9fa);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://wallpaperaccess.com/full/359978.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .form-container {
            max-width: 400px;
            width: 100%;
            background: #ffffffe0;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            margin: auto;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #343a40;
        }
        .form-container .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }
        .form-container .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-container .text-center a {
            color: #007bff;
            text-decoration: none;
        }
        .form-container .text-center a:hover {
            text-decoration: underline;
        }
        .form-container label {
            font-weight: 600;
            color: #495057;
        }
        .form-container input {
            border-radius: 8px;
        }
        .form-container .divider {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }
        .form-container .divider:before, .form-container .divider:after {
            content: "";
            position: absolute;
            top: 50%;
            width: 40%;
            height: 1px;
            background: #dee2e6;
        }
        .form-container .divider:before {
            left: 0;
        }
        .form-container .divider:after {
            right: 0;
        }
        .form-container .divider span {
            background: white;
            padding: 0 10px;
            color: #6c757d;
        }
        .header, .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px 0;
        }
        .footer a {
            color: #007bff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
          header {
                    background-color: #6c757d;
                    color: white;
                    padding: 4px 20px;
                }
                header .logo img {
                    height: 60px;
                }
                header nav a {
                    color: white;
                    text-decoration: none;
                    margin: 0 10px;
                }
    </style>
</head>
<body>

<header class="d-flex justify-content-between align-items-center">
          <div class="logo">
              <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="Xworkz ODC Logo">
          </div>
</header>

<div class="form-container">
    <h2>Sign In</h2>
    <form action="signin" method="post">
        <span>${EmailNotFound}</span>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Sign In</button>
        </div>
        <div class="divider"><span>or</span></div>
        <div class="d-grid">
            <button type="button" class="btn btn-outline-secondary">Sign In with Google</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="index"><button class="btn btn-link" onclick="goBack()">Back</button></a>
        <a href="sendOtp.jsp"><button class="btn btn-link" onclick="forgotPassword()">Forgot Password?</button></a>

        <p>Don't have an account? <a href="register.html">Register here</a></p>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2025 X-Workz ODC. All Rights Reserved. <a href="privacy.html">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("signInForm").addEventListener("submit", function(event) {
        event.preventDefault();
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;

        if (email.trim() === "" || password.trim() === "") {
            alert("Both fields are required.");
        } else {
            alert(`Sign In successful! \nEmail: ${email}`);
            // Add your form submission logic here.
        }
    });

    function goBack() {
        window.history.back();
    }

</script>


</body>
</html>
