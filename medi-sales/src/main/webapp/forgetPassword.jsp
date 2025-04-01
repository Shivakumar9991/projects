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
            background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            flex-direction: column;
        }
        header {
            background: linear-gradient(to right, #0c0101, #cc7300);
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }
        header img {
            height: 50px;
        }
        header nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-right: 20px;
        }
        header nav a:hover {
            text-decoration: underline;
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
        footer {
            background: linear-gradient(to right, #080807, #c77216);
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 20px;
            width: 100%;
        }
        footer .social-icons img {
            height: 30px;
            margin: 0 10px;
        }
        footer a {
            color: lightblue;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>
    <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
    <nav>
        <a href="index">Home</a>
    </nav>
</header>

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
        <a href="index"><button class="btn btn-link">Back to Home page</button></a>
    </div>
    <div>
        <h2>${message}</h2>
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
</script>

<footer>
    <div class="social-icons">
        <a href="https://www.facebook.com/xworkzdevelopmentcenter/" target="_blank">
            <img src="https://th.bing.com/th/id/OIP.gFOR2OAsMMpS610KsqTkiQHaHa?w=198&h=198&c=7&r=0&o=5&pid=1.7" alt="Facebook">
        </a>
        <a href="https://www.linkedin.com/company/x-workz-odc/?originalSubdomain=in" target="_blank">
            <img src="https://1000marcas.net/wp-content/uploads/2020/01/Logo-Linkedin.png" alt="Linkedin">
        </a>
        <a href="https://www.instagram.com/xworkzraj/" target="_blank">
            <img src="https://th.bing.com/th?q=Instagram+Logo+Black+Background&w=120&h=120&c=1&rs=1&qlt=90&cb=1&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247" alt="Instagram">
        </a>
    </div>
    <p>Contact us: <a href="mailto:medisales@gmail.com">trustymeds@gmail.com</a></p>
    <p>
        Current Date and Time:
        <%
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date date = new java.util.Date();
            out.println(sdf.format(date));
        %>
    </p>
</footer>

</body>
</html>
