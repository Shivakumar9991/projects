<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
       body {
           font-family: Arial, sans-serif;
           background-color: #f9f9f9;
           background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
           background-size: cover;
           background-position: center;
           background-repeat: no-repeat;
           margin: 0;
           padding: 0;
           display: flex;
           flex-direction: column;
           align-items: center;
           justify-content: center;  /* Centers content vertically */
           min-height: 100vh;
           padding-top: 80px;  /* Prevent overlap with fixed header */
       }

       main {
           text-align: center;
           max-width: 900px;
           width: 100%;
           margin: auto; /* Centers horizontally */
           background-color: rgba(241, 241, 241, 0.8);
           padding: 40px;
           border: 2px solid #ddd;
           border-radius: 10px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
       }


        h2 {
            color: #333;
            font-size: 24px;
            text-align: center;
            background-color: rgba(241, 241, 241, 0.8);
            border: 2px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            max-width: 90%;
            width: 600px;
        }

        header {
            background: linear-gradient(to right, #0c0101, #cc7300);
            color: white;
            padding: 15px 0px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        header img {
            height: 50px;
        }

        header nav {
            display: flex;
            gap: 20px;
        }

        header nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        header nav a:hover {
            text-decoration: underline;
            padding
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


        footer {
            background: linear-gradient(to right, #080807, #c77216);
            color: white;
            text-align: center;
            padding: 15px 0;
            width: 100%;
            position: relative;
                margin-top: 380px;
            bottom: 0;
        }

        footer .social-icons {
            margin-bottom: 10px;
        }

        footer .social-icons img {
            height: 30px;
            margin: 0 10px;
        }

        footer a {
            color: lightblue;
            text-decoration: none;
        }
        h2{
        color: #0000ff;
        text-align :center;
        }

        footer a:hover {
            text-decoration: underline;
        }
        .btn:hover {
                    background-color: #005bb5;
                }
                 .btn-group {
                            margin-top: 30px;
                        }
                        .btn {
                            background-color: #0066cc;
                            color: white;
                            border: none;
                            padding: 10px 20px;
                            border-radius: 5px;
                            cursor: pointer;
                            font-size: 14px;
                            text-decoration: none;
                            margin-right: 20px;
                            display: inline-block;
                        }
    </style>
</head>
<body>

<header>
    <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
    <nav>
        <button class="home-btn" onclick="location.href='index';">Home</button>
        <button class="home-btn" onclick="location.href='logIn';">Login</button>
        <button class="home-btn" onclick="location.href='registration';">Registration</button>

    </nav>
</header>
    <h2 >Thank You ${name} For Registering!!</h2>

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
            java.util.Date date = new java.util.Date();
            out.println(date.toString());
        %>
    </p>
</footer>

</body>
</html>
