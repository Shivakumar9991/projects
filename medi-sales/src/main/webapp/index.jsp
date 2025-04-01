<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediSales - Home</title>
    <style>
        body {
            font-family: math;
            margin: 0;
            padding: 0;
            background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        header {
            background: linear-gradient(to right,  #0c0101,#cc7300);
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header img {
            height: 50px;
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
        nav {
            display: flex;
            align-items: center;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .btn-group {
            margin-top: 30px;
        }


        main {
            text-align: left;
            padding: 50px 20px;
        }
        footer {
            background: linear-gradient(to right, #080807, #c77216);
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 340px;
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
        <div style="display: flex; align-items: center; gap: 20px;">
        <button class="home-btn" onclick="location.href='logIn';">Login</button>
        <button class="home-btn" onclick="location.href='registration';">Registration</a>
        </div>

        </nav>
    </header>

    <main>
        <h1>Welcome to Trusty Meds</h1>
        <p>Your trusted partner for top-quality medical supplies and equipment.</p>
        <p>Explore our extensive product catalog and sign up now to unlock exclusive deals!</p>

    </main>


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
