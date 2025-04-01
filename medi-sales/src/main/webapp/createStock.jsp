<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

   <style>
           /* General Styling */
           body {
               font-family: Arial, sans-serif;
               margin: 0;
               padding: 0;
                background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
                           background-size: cover;
                           background-position: center;
                           background-repeat: no-repeat;
               background-color: #f8f9fa;
           }
           .container {
               max-width: 1100px;
               margin: 50px auto;
               display: flex;
               background-color: #fff;
               border-radius: 10px;
               box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
               overflow: hidden;
           }
           /* Header Styling */
           header {
                      background: linear-gradient(to right, #0c0101, #cc7300);
                      color: white;
                      padding: 15px 20px;
                      display: flex;
                      align-items: center;
                      justify-content: space-between;
                  }
                  header img {
                      height: 50px;
                  }
           .header h1 {
               font-size: 20px;
               margin: 0;
           }
           .header .home-btn {
               background-color: #fff;
               color: #006b5d;
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

           /* Footer Styling */
          footer {
                      background: linear-gradient(to right, #080807, #c77216);
                      color: white;
                      text-align: center;
                      padding: 15px 0;
                      margin-top: 50px;
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

           /* Form Section */
           .form-section {
               flex: 2;
               padding: 40px 30px;
           }
           .form-section h2 {
               font-size: 26px;
               color: #006b5d;
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
           .form-group input,
           .form-group select {
               width: 100%;
               padding: 10px 12px;
               font-size: 14px;
               border: 1px solid #ccc;
               border-radius: 5px;
               box-sizing: border-box;
           }
           .radio-group {
               display: flex;
               gap: 10px;
           }
           .radio-group input {
               margin-top: 4px;
           }
           .radio-group label {
               font-size: 14px;
           }
           .btn {
               width: 100%;
               background-color: #006b5d;
               color: #fff;
               border: none;
               padding: 12px;
               font-size: 16px;
               border-radius: 5px;
               cursor: pointer;
               transition: background-color 0.3s;
           }
           .btn:hover {
               background-color: #004f43;
           }
           .form-section a {
               text-decoration: none;
               color: #006b5d;
               font-weight: bold;
           }

           .container {
                       max-width: 1100px;
                       margin: 50px auto;
                       display: flex;
                       background-color: #fff;
                       border-radius: 10px;
                       box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                       overflow: hidden;
                   }
                   .form-section {
                       flex: 2;
                       padding: 40px 30px;
                   }
                   .form-section h2 {
                       font-size: 26px;
                       color: #006b5d;
                       margin-bottom: 20px;
                   }
                   .btn {
                       width: 100%;
                       background-color: #006b5d;
                       color: #fff;
                       border: none;
                       padding: 12px;
                       font-size: 16px;
                       border-radius: 5px;
                       cursor: pointer;
                       transition: background-color 0.3s;
                   }
                   .btn:hover {
                       background-color: #004f43;
                   }
                   .info-section {
                       flex: 1;
                       background: linear-gradient(135deg, #e6f7f4, #f5f9fa);
                       padding: 40px 20px;
                       text-align: center;
                   }
                   .info-section img {
                       width: 100px;
                       margin-bottom: 20px;
                   }

           /* Toggle Password Visibility */
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
       </style>

</head>
<body>
    <!-- Header -->
     <header>
            <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
            <nav>
                <a href="index" class="text-white">Home</a>
            </nav>
        </header>

    <div class="container">
        <div class="form-section">
            <h2>Add Product</h2>
            <p>Enter Product Details for Marg ERP Cloud</p>
            <form action="addProduct" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <label for="productCompany" class="form-label">Product Company *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-building"></i></span>
                            <input type="text" class="form-control" id="productCompany" name="productCompany" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="productName" class="form-label">Product Name *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-box"></i></span>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>
                    </div>


                    <div class="col-md-6">
                        <label for="mrp" class="form-label">MRP *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="number" class="form-control" id="mrp" name="mrp" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="pack" class="form-label">Pack *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-cube"></i></span>
                            <input type="text" class="form-control" id="pack" name="pack" required>
                        </div>
                    </div>


                    <div class="col-md-6">
                        <label for="mfgDate" class="form-label">Manufacture Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                            <input type="date" class="form-control" id="mfgDate" name="mfgDate" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="expDate" class="form-label">Expiry Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar-x"></i></span>
                            <input type="date" class="form-control" id="expDate" name="expDate" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="quantity" class="form-label">Quantity *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="rate" class="form-label">Rate *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="number" class="form-control" id="rate" name="rate" required>
                        </div>
                    </div>
                     <div class="col-md-6">
                                            <label for="discount" class="form-label">Discount *</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-percent"></i></span>
                                                <input type="number" class="form-control" id="discount" name="discount" required>
                                            </div>
                     </div>
                      <div class="col-md-6">
                                             <label for="gst" class="form-label">GST *</label>
                                             <div class="input-group">
                                                 <span class="input-group-text"><i class="bi bi-percent"></i></span>
                                                 <input type="number" class="form-control" id="gst" name="gst" required>
                                             </div>
                      </div>
                </div>

                <button type="submit" class="btn">Add Product</button>
            </form>
        </div>

        <div class="info-section">
            <img src="https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg" alt="Marg ERP On Cloud">
            <h3>Access From Anywhere</h3>
            <p>Enjoy the convenience of 24/7 accessibility to Marg Cloud to monitor your business data, transactions, and expenses, keeping you up-to-date.</p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>