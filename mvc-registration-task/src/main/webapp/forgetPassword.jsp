<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .form-container {
               max-width: 350px;
               width: 100%;
               background: #f8f9fac7;
               padding: 30px;
               border-radius: 15px;
               box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
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
        .form-container label {
            font-weight: 600;
            color: #495057;
        }
        .form-container input {
            border-radius: 8px;
        }
        .form-container .text-center a {
            color: #007bff;
            text-decoration: none;
        }
        .form-container .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Update Password</h2>
    <form action="resetPasswordForm" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your registered email" required>
        </div>
        <div class="mb-3">
            <label for="newPassword" class="form-label">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="password" placeholder="Enter new password" required>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </div>
    </form>
    <div class="text-center mt-3">
       <a href="index"> <button class="btn btn-link" onclick="goBack()">Back to Home page</button></a>
    </div>
    <div>
   <h2> ${message} </h2>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("resetPasswordForm").addEventListener("submit", function(event) {
        event.preventDefault();
        const email = document.getElementById("email").value;
        const newPassword = document.getElementById("newPassword").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        if (!email.trim()) {
            alert("Email is required.");
        } else if (!newPassword.trim() || !confirmPassword.trim()) {
            alert("Password fields cannot be empty.");
        } else if (newPassword !== confirmPassword) {
            alert("Passwords do not match.");
        } else {
            alert(`Password reset successfully for ${email}`);
            // Add your password reset logic here.
        }
    });

    function goBack() {
        window.location.href = "signin.html"; // Replace with the correct path to the sign-in page.
    }
</script>

</body>
</html>
