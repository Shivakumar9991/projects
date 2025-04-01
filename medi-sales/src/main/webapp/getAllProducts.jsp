<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="con" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
                       background-size: cover;
                       background-position: center;
                       background-repeat: no-repeat;
            color: white;
            font-family: Arial, sans-serif;
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

        .container {
            margin-top: 50px;
        }

        .table-container {
            background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
        }

        table {
            width: 100%;
        }

        th, td {
            text-align: center;
            padding: 10px;
            color: white;
        }

        th {
            background-color: #0044cc;
        }

        td {
            background-color: #003366;
        }

        /* Hover effect for rows */
        tbody tr:hover {
            background-color: #575757;
        }

        .btn-custom {
            padding: 8px 12px;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
        }

        .btn-success-custom {
            background-color: #28a745;
            color: white;
        }

        .btn-danger-custom {
            background-color: #dc3545;
            color: white;
        }

       footer {
                   background: linear-gradient(to right, #080807, #c77216);
                   color: white;
                   text-align: center;
                   padding: 15px 0;
                   margin-top: 80px;
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
    </style>
</head>
<body>
 <header>
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
        <a href="index">Home</a>
    </header>

<div class="container">
    <div class="table-container">
        <h2 class="text-center mb-4">Product Details</h2>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>ProductCompany</th>
                    <th>ProductName</th>
                    <th>Quantity</th>
                    <th>MRP</th>
                    <th>Pack</th>
                    <th>MfgDate</th>
                    <th>ExpDate</th>
                    <th>Rate</th>
                    <th>Discount</th>
                    <th>TotalAmount</th>

                </tr>
            </thead>
            <tbody>
                <con:forEach var="dto" items="${listOfAllProducts}">
                    <tr>
                        <td>${dto.getId()}</td>
                        <td>${dto.getProductCompany()}</td>
                        <td>${dto.getProductName()}</td>
                        <td>${dto.getQuantity()}</td>
                        <td>${dto.getMrp()}</td>
                        <td>${dto.getPack()}</td>
                        <td>${dto.getMfgDate()}</td>
                        <td>${dto.getExpDate()}</td>
                        <td>${dto.getRate()}</td>
                        <td>${dto.getDiscount()}</td>
                        <td>${dto.getTotalAmount()}</td>

                    </tr>
                </con:forEach>
            </tbody>
        </table>
    </div>

    <div class="footer mt-4">
        <a href="dashboard" class="btn btn-primary">Add New Bill</a>
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

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>

