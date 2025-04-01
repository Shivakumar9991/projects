<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
     <meta charset="UTF-8">
     <title>Generate Bill - MEDI-SALES</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
     <style>
         /* General Styling */
         body {
             font-family: 'Segoe UI Emoji', Arial, sans-serif;
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
             background-color: #fff;
             border-radius: 10px;
             box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
             padding: 30px;
         }
         /* Header Styling */
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
         .form-row {
             margin-top: 20px;
         }
         .form-row input,
         .form-row select {
             margin-right: 10px;
         }
         .form-btn {
             background-color: #0056b3;
             color: white;
             padding: 10px 20px;
             border: none;
             border-radius: 5px;
             cursor: pointer;
         }
         .form-btn:hover {
             background-color: #003d80;
         }

         /* Table Styling */
         #sales-table {
             width: 100%;
             border-collapse: collapse;
             margin-top: 20px;
         }
         #sales-table th, #sales-table td {
             padding: 12px;
             text-align: left;
             border-bottom: 1px solid #ddd;
         }
         #sales-table th {
             background-color: #f5f9fa;
             font-weight: bold;
         }

         /* Custom styles for the max stock message */
         #maxStockMessage {
             font-size: 12px;  /* Small text */
             color: blue;      /* Blue color */
             margin-top: 5px;   /* Space below quantity field */
         }

         /* Styling for the form fields to align them in one row */
         .form-row input, .form-row select {
             margin-bottom: 10px;
         }

         /* Adjust column width to ensure fields are properly aligned */
         .col-md-2, .col-md-3 {
             padding-right: 10px;
         }
         /* Styling for Total Amount */
         .total-amount {
             font-size: 22px;
             font-weight: bold;
             color: #006b5d;  /* Dark green for emphasis */
             text-align: right;
             padding: 10px;
             margin-top: 10px;
             background-color: #f1f1f1; /* Light gray background */
             border-radius: 5px;
             box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
         }

     </style>
 </head>
 <body>


       <header>
           <div style="display: flex; align-items: center; justify-content: space-between; width: 100%;">

               <div style="display: flex; align-items: center; gap: 10px;">
                   <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
               </div>

               <div>
                   <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
                   <button class="home-btn" onclick="location.href='logIn';">Login</button>
               </div>
           </div>
       </header>


     <div class="container">
         <!-- Sales Bill Form -->
         <form method="post" action="getBill">
             <h2 id="page-title">Generate Vendor Sales Bill</h2>
             <h3>Billing for :${personContact}</h3>
             <p>Address :${address}</p>

             <div class="row form-row">
                 <div class="col-md-3">
                     <select name="productName" id="productName" class="form-select" required onchange="fetchProductStock()">
                         <option value="">Select Product</option>


                     </select>
                 </div>
                 <div class="col-md-3">
                     <select name="personContact" id="personContact" class="form-select" required>
                         <option value="">Select Customer</option>


                     </select>
                 </div>
                 <div class="col-md-2">
                     <input type="number" name="quantity" id="quantityEntered" class="form-control" placeholder="Quantity" required />
                  <div id="maxStockMessage"></div>
                 </div>
                 <div class="col-md-2">
                     <input type="number" name="gst" id="gstEntered" class="form-control" placeholder="GST (%)" required />
                 </div>
                 <div class="col-md-2">
                     <input type="number" name="discount" id="discountEntered" class="form-control" placeholder="Discount (%)" required />
                 </div>
             </div>

             <!-- Max Stock message below the Quantity -->


             <!-- Submit Button -->
             <div class="form-row mt-3">
                 <button type="submit" class="form-btn">Generate Bill</button>
             </div>
         </form>

         <!-- Table for Bill Details -->
         <h3 class="mt-4">Sales Bill Details</h3>
         <table id="sales-table">
             <thead>
                 <tr>
                     <th>Sl.no</th>
                     <th>Product</th>
                     <th>HSN No</th>
                     <th>Description</th>
                     <th>Exp. Date</th>
                     <th>Quantity</th>
                     <th>Rate</th>
                     <th>GST</th>
                     <th>Discount</th>
                 </tr>
             </thead>
             <tbody>
             <c:forEach var="dto" items="${dtoList}" varStatus="status">
                 <tr>
                     <td>${status.index + 1}</td>
                     <td>${dto.productName}</td>
                     <td>${dto.hsn}</td>
                     <td>${dto.productCompany}</td>
                     <td>${dto.expDate}</td>
                     <td>${dto.quantity}</td>
                     <td>${dto.rate}</td>
                     <td>${dto.gst}</td>
                     <td>${dto.discount}</td>
                 </tr>
               </c:forEach>
             </tbody>
         </table>
         <h4 class="total-amount">Total: ₹${total}</h4>
         <a href="generatePdf" class="form-btm">Print Receipt</a>
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

   <script>
       document.addEventListener("DOMContentLoaded", function() {
           fetchProducts();
           fetchCustomers();
       });

       function fetchProducts() {
           fetch('http://localhost:8080/medi-sales-project/api/getProducts')
               .then(response => response.json())
               .then(data => {
                   let selectElement = document.getElementById("productName");
                   selectElement.innerHTML = '<option value="">Select Product</option>';

                   data.forEach(product => {
                       let option = document.createElement("option");
                       option.value = product;  // Assuming the product object has a "name" property
                       option.text = product;
                       selectElement.appendChild(option);
                   });
               })
               .catch(error => console.error('Error fetching products:', error));
       }

       function fetchCustomers() {
           fetch('http://localhost:8080/medi-sales-project/api/getCustomer')
               .then(response => response.json())
               .then(data => {
                   let selectElement = document.getElementById("personContact");
                   selectElement.innerHTML = '<option value="">Select Customer</option>';
                   data.forEach(customer => {
                       let option = document.createElement("option");
                       option.value = customer;
                       option.text = customer;
                       selectElement.appendChild(option);
                   });
               })
               .catch(error => console.error('Error fetching customers:', error));
       }
        function fetchProductStock() {
                   const name = document.getElementById("productName").value ;
                   console.log(name);
                   if (name) {
                      fetch("http://localhost:8080/medi-sales-project/api/getStockByProduct?productName="+name)
                           .then(response => response.json())
                           .then(stock => {
                               const maxStockMessage = document.getElementById("maxStockMessage");
                               maxStockMessage.textContent = "Maximum quantity available is"+stock;

                               const quantityInput = document.getElementById("quantityEntered");
                               quantityInput.setAttribute("max", stock);  // Set the max attribute
                               quantityInput.setAttribute("placeholder", "Enter quantity (max " + stock + ")")

                               const submitButton = document.querySelector(".form-btn");
                               submitButton.disabled = stock === 0;  // Disable button if stock is 0
                           })
                           .catch(error => console.error('Error fetching product stock:', error));
                           } else {
                               const maxStockMessage = document.getElementById("maxStockMessage");
                               maxStockMessage.textContent = '';

                               const quantityInput = document.getElementById("quantityEntered");
                               quantityInput.setAttribute("placeholder", "Enter quantity");

                               const submitButton = document.querySelector(".form-btn");
                               submitButton.disabled = false;
                           }

                       }

   </script>
</body>
</html>