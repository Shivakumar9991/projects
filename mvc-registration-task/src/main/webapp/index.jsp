<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - New Year Celebration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            background-image: url('https://images.rawpixel.com/image_social_landscape/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTEyL3Jhd3BpeGVsX29mZmljZV8zOV9waG90b19vZl9uZXdfeWVhcl9jYXJkX3RlbXBsYXRlXzgzOWY2MzE5LTQ1ZGMtNGU0My1iYWVkLWUxNTVmM2ZhNTMxY18xLmpwZw.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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
        .celebration-message {
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 65%);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 0px;
            text-align: center;
            margin-top: auto; /* Ensures footer stays at the bottom */
        }
        footer .social-media img {
            width: 24px;
            margin: 0 8px;
        }
        footer a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<header class="d-flex justify-content-between align-items-center">
    <div class="logo">
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="Xworkz ODC Logo">
    </div>
    <nav>
        <a href="registration">Sign Up</a>
        <a href="signIn">Sign In</a>
    </nav>
</header>

<div class="celebration-message">
      <h2>Welcome ${name} </h2>
    <h2 class="text-center mb-4">Happy New Year 2025</h2>
    <p class="lead">Wishing you all the joy, success, and prosperity in the year ahead...</p>
    <p class="mt-4">Stay safe and enjoy the celebrations!</p>
</div>

<footer>
    <p>Contact us: <a href="mailto:info@xworkzodc.com">info@xworkzodc.com</a></p>
    <div class="social-media">
        <a href="https://www.facebook.com/xworkzdevelopmentcenter/"><img src="https://cdn-icons-png.flaticon.com/512/124/124010.png" alt="Facebook"></a>
        <a href="https://www.instagram.com/xworkzraj/"><img src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png" alt="Instagram"></a>
        <a href="https://www.ambitionbox.com/reviews/x-workz-reviews/software-trainee"><img src="https://cdn-icons-png.flaticon.com/512/733/733635.png" alt="Twitter"></a>
    </div>
    <p id="current-date"></p>
</footer>

<script>
    const currentDate = new Date().toLocaleDateString();
    document.getElementById("current-date").textContent = `Today's Date: ${currentDate}`;
</script>

</body>
</html>
