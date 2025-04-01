<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediSales - Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.2.1/axios.min.js"></script>


    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            box-sizing: border-box;
        }
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
        .container {
            max-width: 900px;
            margin: 50px auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .form-section {
            padding: 40px 30px;
        }
        .info-section {
            background: linear-gradient(135deg, #e6f7f4, #f5f9fa);
            padding: 40px 20px;
            text-align: center;
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
        .form-row {
            display: flex;
            gap: 20px;
        }
        .form-group {
            flex: 1;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
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
        /* Responsive styles */
        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header>
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
        <nav>
           <div style="display: flex; align-items: center; gap: 20px;">
                 <button class="home-btn" onclick="location.href='index';">Home</button>
                 <button class="home-btn" onclick="location.href='logIn';">Login</button>

           </div>
        </nav>
    </header>

    <div class="container">
        <div class="form-section">
            <h2>Registration Form</h2>
            <p>Create an Account on X-workz Pharm Cloud</p>
            <form action="registration" method="POST">
                <div class="form-row">
                    <div class="form-group">
                        <label for="companyName">Company Name</label>
                        <input type="text" id="companyName" name="companyName" oninput="validateLength('companyName', 'companyNameError')" required>
                        <span style="color: red;">${CompanyNameError}</span>
                    </div>
                </div>
                 <div class="form-row">
                    <div class="form-group">
                        <label for="personContact">Contact Person</label>
                        <input type="text" id="personContact" name="personContact" oninput="validateLength('personContact', 'contactPersonError')" required>
                        <span style="color: red;">${PersonContactError}</span>
                    </div>
                    <div class="form-group">
                        <label for="businessType">Business Type</label>
                        <select id="businessType" name="businessType" required>
                            <option value="" disabled selected>Select Business Type</option>
                            <option value="Distributor">Distributor</option>
                            <option value="Retailer">Retailer</option>
                        </select>
                        <span style="color: red;">${BusinessTypeError}</span>
                    </div>
                 </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="registeredMobile">Registered Mobile</label>
                        <input type="tel" id="registeredMobile" name="registeredMobile" onblur="checkRegisteredMobile()" oninput="validateLength('registeredMobile', 'phoneError')" required>
                        <span id="contactError" style="color: red;">${RegisteredMobileError}</span>
                    </div>
                    <div class="form-group">
                        <label for="registeredEmail">Registered Email</label>
                        <input type="email" id="registeredEmail" name="registeredEmail" onblur="checkEmail()" oninput="validateLength('registeredEmail', 'emailError')" required>
                        <span id="emailError" style="color: red;">${RegisteredEmailError}</span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="address1">Address Line 1</label>
                        <input type="text" id="address1" name="address1"  oninput="validateLength('address1', 'addressError')" required>
                        <span style="color: red;">${Address1Error}</span>
                    </div>
                    <div class="form-group">
                        <label for="address2">Address Line 2</label>
                        <input type="text" id="address2" name="address2"  oninput="validateLength('address2', 'addressError')">
                        <span style="color: red;">${Address2Error}</span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="pinCode">Pincode</label>
                        <input type="number" id="pinCode" name="pinCode" required>
                        <span style="color: red;">${PinCodeError}</span>
                    </div>
                    <div class="form-group">
                        <label for="referral">Referral</label>
                        <input type="text" id="referral" name="referral">
                        <span style="color: red;">${ReferralError}</span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" oninput="checkPasswords()"  required>
                        <span style="color: red;">${PasswordError}</span>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" oninput="checkPasswords()" required>
                        <span style="color: red;">${ConfirmPasswordError}</span>
                    </div>
                </div>



                <button type="submit" class="btn btn-primary btn-block">Submit</button>
            </form>



        </div>

        <div class="info-section">
            <img src="https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg" alt="Marg ERP On Cloud">
            <h3>Secure Access</h3>
            <p>Log in to Marg Cloud to access all your business data securely from anywhere.</p>
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

    <script>

            const checkEmail = async ()=>{
            const registeredEmail = document.getElementById("registeredEmail").value
            const response = await axios("http://localhost:8080/medi-sales-project/api/checkEmail/"+registeredEmail)
            if(response.data==="Email already exists..."){
            document.getElementById("emailError").innerHTML=response.data
            }else{
            document.getElementById("emailError").innerHTML=""

            }
      }

    </script>
    <script>

            const checkRegisteredMobile = async ()=>{
            const registeredMobile = document.getElementById("registeredMobile").value
            const response = await axios("http://localhost:8080/medi-sales-project/api/checkRegisteredMobile/"+registeredMobile)
            if(response.data==="Contact Already Exists..."){
            document.getElementById("contactError").innerHTML=response.data
            }else{
            document.getElementById("contactError").innerHTML=""
            }
      }
    </script>

</body>
</html>
