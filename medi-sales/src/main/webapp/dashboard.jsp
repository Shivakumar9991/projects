<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Select Plan - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
             background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
                        background-size: cover;
                        background-position: center;
                        background-repeat: no-repeat;
        }

        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: -250px;
            width: 250px;
            height: 100vh;
            background-color: #4f2b00;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 60px;
            transition: left 0.1s to 0.3s ease-in-out;
        }
        .sidebar a {
            padding: 12px;
            color: white;
            text-decoration: none;
            display: block;
            transition: background 0.1s;
        }
        .sidebar a:hover {
            background-color: #080808;
        }
        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 24px;
            cursor: pointer;
            background: none;
            border: none;
            color: white;
        }
        .content {
            padding: 80px 20px;
        }
        /* Header */
        .header {
                    background-color: #006b5d;
                    padding: 15px 30px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    color: white;
                }
                .header h1 {
                    font-size: 20px;
                    margin: 0;
                }
                .header .home-btn {
                    background-color: #fff;
                    color: white;
                    border: none;
                    padding: 8px 15px;
                    font-size: 14px;
                    font-weight: bold;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }
                .header .home-btn:hover {
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
                         .toggle-btn {
                                    background: none;
                                    border: none;
                                    color: white;
                                    font-size: 20px;
                                    margin-right: 15px;
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
          /* Footer Styling */
                footer {
                           background: linear-gradient(to right, #080807, #c77216);
                           color: white;
                           text-align: center;
                           padding: 15px 0;
                          margin-top: 94px;
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

                        .stock-container {
                            margin-top: 20px;
                        }
                        .stock-card {
                            border: 1px solid #ddd;
                            border-radius: 8px;
                            padding: 15px;
                            background: white;
                            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
                        }
                        .stock-card h5 {
                            margin-bottom: 10px;
                        }
                        .offer-badge {
                            background-color: #28a745;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 5px;
                            font-size: 14px;
                        }
    </style>
    <script>
       function toggleSidebar() {
           var sidebar = document.getElementById("sidebar");
           var content = document.querySelector(".content"); // Get the content element
           if (sidebar.style.left === "-250px") {
               sidebar.style.left = "0";
               content.style.marginLeft = "250px"; // Move the content to the right
           } else {
               sidebar.style.left = "-250px";
               content.style.marginLeft = "0"; // Move the content back to its original position
           }
       }
    </script>
</head>
<body>

  <header>
      <div style="display: flex; align-items: center; gap: 0px;">
          <button class="toggle-btn" onclick="toggleSidebar()">☰</button>
          <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
      </div>
      <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
  </header>





    <div id="sidebar" class="sidebar">
        <button class="close-btn" onclick="toggleSidebar()">&times;</button>
        <a href="createStock">Create Stocks</a>
        <a href="viewProducts">View Stocks</a>
        <a href="generateBill.jsp">Generate Bill</a>

    </div>

    <div class="content">
        <div class="container stock-container">
                    <h2 class="text-center">Medical Stocks & Offers</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="stock-card">
                                <h5>Paracetamol 500mg</h5>
                                <p>Effective for fever and pain relief.</p>
                                <span class="offer-badge">10% OFF</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stock-card">
                                <h5>Vitamin C Tablets</h5>
                                <p>Boosts immunity and improves skin .</p>
                                <span class="offer-badge">Buy 1 Get 1 Free</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stock-card">
                                <h5>Blood Pressure Monitor</h5>
                                <p>Accurate readings for daily health .</p>
                                <span class="offer-badge">15% OFF</span>
                            </div>
                        </div>
                    </div>
                </div>
    </div>

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

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>