<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Marg ERP Cloud</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        /* Header Styling */

        .header h1 {
            font-size: 20px;
            margin: 0;
        }
         .home-btn {
                 background-color: white;
                 color: #006b5d;
                 border: none;
                 padding: 6px 12px;
                 font-size: 14px;
                 font-weight: bold;
                 border-radius: 5px;
                 cursor: pointer;
         }
          .home-btn:hover {
                  background-color: #e6f7f4;
          }
        header img {
                    height: 50px;
        }
                header {
                    background: linear-gradient(to right, #0c0101, #cc7300);
                    color: white;
                    padding: 15px 20px;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

        /* Footer Styling */
        footer {
            background: linear-gradient(to right, #080807, #c77216);
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 220 px;
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
        .btn-group {
            margin-top: 30px;
        }

        /* Container Styling */
        .container {
            max-width: 900px;
            margin: 50px auto;
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Form Section */
        .form-section {
            flex: 2;
            padding: 40px 30px;
        }
        .form-section h2 {
            font-size: 26px;
            color: #000000;
            margin-bottom: 10px;
        }
        .form-section p {
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .password-toggle {
            position: relative;
        }
        .password-toggle input {
            padding-right: 40px;
        }
        .password-toggle .toggle-btn {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 16px;
            color: #aaa;
        }
        .password-toggle .toggle-btn:hover {
            color: #333;
        }
        .btn {
            width: 100%;
            background-color:#cc7300;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0a0a0ae6;
        }
        .form-section a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
        }

        /* Info Section */
        .info-section {
            flex: 1;
            background: linear-gradient(176deg, #f3f7e6, #f5f9fa00);
            padding: 40px 20px;
            text-align: center;
        }
        .info-section img {
            width: 165px;
            margin-bottom: 20px;
        }
        .info-section h3 {
            font-size: 20px;
            color: #006b5d;
            margin-bottom: 10px;
        }
        .info-section p {
            color: #555;
            font-size: 14px;
            line-height: 1.6;
        }
        header img {
            height: 50px;
        }
        header {
            background: linear-gradient(to right, #0c0101, #cc7300);
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
    </style>
    <script>
        // Toggle password visibility
        function togglePassword(id, toggleId) {
            const input = document.getElementById(id);
            const toggleBtn = document.getElementById(toggleId);
            if (input.type === "password") {
                input.type = "text";
                toggleBtn.textContent = "🙈";
            } else {
                input.type = "password";
                toggleBtn.textContent = "👁";
            }
        }
    </script>
</head>
<body>
    <!-- Header -->
   <header>
       <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
       <div style="display: flex; align-items: center; gap: 20px;">
       <button class="home-btn" onclick="location.href='index';">Home</button>
       <button class="home-btn" onclick="location.href='registration';">Registration</a>
       </div>
   </header>

    <!-- Container -->
    <div class="container">
        <!-- Form Section -->
        <div class="form-section">
            <h2>Login</h2>
            <p>Access Your Account on Marg ERP Cloud</p>
            <form action="logIn" method="post">
                <div class="form-group">
                    <label for="email">Registered Email *</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password *</label>
                    <div class="password-toggle">
                        <input type="password" id="password" name="password" required>
                        <span class="toggle-btn" id="togglePassword" onclick="togglePassword('password', 'togglePassword')">👁</span>
                    </div>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>

             <div>
                  <p>Dont have an account?<a href="registration"> Registration</a></p>
             </div>
             <div>
                <a href="sendOtp.jsp"><button class="btn btn-link" onclick="forgotPassword()">Forgot Password?</button></a>
             </div>

        </div>

        <!-- Info Section -->
        <div class="info-section">
            <img src="https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg" alt="Marg ERP On Cloud">
            <h3>Secure Access</h3>
            <p>Log in to Marg Cloud to access all your business data, monitor transactions, expenses, and more from anywhere in the world with complete security and ease of use.</p>
        </div>
    </div>

    <!-- Footer -->
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
