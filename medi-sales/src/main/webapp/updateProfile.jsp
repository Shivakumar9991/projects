<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
             background-repeat:no-repeat;
             background-position:center;
             background-size:cover;
            margin: 0;
            padding: 0;
            color: #333;
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
                            padding: 10px 15px; /* Adjusted padding */
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                            font-size: 16px; /* Adjusted font size */
                        }
        header nav a {
            color: white;
            font-weight: bold;
            margin: 0 10px;
            text-decoration: none;
        }
        .form-container {

               max-width: 701px;
               margin: 0px auto;
               padding: 30px;
               background: #ffffff66;
               border-radius: 10px;
               box-shadow: -1px 9px 15px rgba(0, 0, 0, 0.2);
        }
        .form-container h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #004d40;
        }
        .form-container label {
            font-weight: bold;
            color: #00796b;
        }
        .form-container input,
        .form-container select {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 10px;
            margin-top: 5px;
        }
        .form-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .form-container button.btn-primary {
            background-color: #00796b;
            color: white;
        }
        .form-container button.btn-secondary {
            background-color: #b0bec5;
            color: black;
        }

        footer {
            background: linear-gradient(to right, #080807, #c77216);
            color: white;
            text-align: center;
            padding: 10px 0; /* Adjusted padding */
            margin-top: 50px;
            font-size: 14px; /* Adjusted font size */
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
         <a href="logIn">Profile</a>
          <nav>
             <div style="display: flex; justify-content : end ; align-items:center"></div>
             <div> <img style="border-radius :50%" height="30px" width="30px" src="view/${dto.getProfilePhoto()}"></div>

          </nav>
    </header>
<main class="form-container">
    <h1 class="text-center mb-4">Update Profile</h1>
    <h1>${success}</h1>
    <form action="update" method="post" enctype="multipart/form-data">
        <div class="row mb-3">
                <label for="firstName" class="form-label">Id:</label>
                <input type="number" class="form-control" id="id" name="id" value="${dto.getId()}"  required>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="companyName" class="form-label">Company Name:</label>
                <input type="text" class="form-control" id="companyName" name="companyName" value="${dto.getCompanyName()}" placeholder="Enter first name" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="personContact" class="form-label">Person Contact:</label>
                <input type="text" class="form-control" id="personContact" name="personContact" value="${dto.getPersonContact()}" placeholder="Enter last name" required>
            </div>
            <div class="col-md-6">
                 <label for="businessType" class="form-label">Business Type:</label>
                 <input type="text" class="form-control" id="businessType" name="businessType" value="${dto.getBusinessType()}" placeholder="Enter Business Type" required>
            </div>
             <div class="col-md-6">
                  <label for="registeredMobile" class="form-label">Registered Mobile:</label>
                  <input type="num" class="form-control" id="registeredMobile" name="registeredMobile" value="${dto.getRegisteredMobile()}" placeholder="Enter Business Type" required>
             </div>
              <div class="col-md-6">
                             <div><p>${emailVerifies}</p></div>
                             <label for="registeredEmail" class="form-label">Registered Email:</label>
                             <input type="email" class="form-control" id="registeredEmail" name="registeredEmail" value="${dto.getEmail()}" placeholder="Enter Registered Email" required>
              </div>
              <div class="col-md-6">
                             <label for="password" class="form-label">Password:</label>
                             <input type="password" class="form-control" id="password"  name="password" value="${dto.getPassword()}" placeholder="Enter password" required>
              </div>
              <div class="col-md-6">
                             <label for="confirmPassword" class="form-label">Confirm Password:</label>
                             <input type="password" class="form-control" id="confirmPassword"  name="confirmPassword" value="${dto.getConfirmPassword()}" placeholder="Confirm password" required>
              </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="address1" class="form-label">Address 1:</label>
                <input type="text" class="form-control" id="address1" name="address1" value="${dto.getAddress1()}" placeholder="Enter address1" required>
            </div>
            <div class="col-md-6">
                <label for="address2" class="form-label">Address 2:</label>
                <input type="tel" class="form-control" id="address2" name="address2" value="${dto.getAddress2()}" placeholder="Enter address2" required>
            </div>
        </div>
         <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="pinCode" class="form-label">Pin Code:</label>
                        <input type="text" class="form-control" id="pinCode" name="pinCode" value="${dto.getPinCode()}" placeholder="Enter Pin Code" required>
                    </div>
                    <div class="col-md-6">
                        <label for="referral" class="form-label">Referral:</label>
                        <input type="tel" class="form-control" id="referral" name="referral" value="${dto.getReferral()}" placeholder="Enter Referral" required>
                    </div>
         </div>
          <div class="row mb-3">
                <div class="col-md-6">
                            <label for="profilePhoto">Profile Photo</label>
                            <input type="file" id="profilePhoto" name="profilePhoto" required>
                            <span>${ProfilePhotoError}</span>
                </div>
                <div class="col-md-6">
                         <label for="fileType">File Type</label>
                         <input type="fileType" id="fileType" name="fileType" required>
                         <span>${FileTypeError}</span>
                </div>
          </div>



        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Update Profile</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
    </form>
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
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        java.util.Date date = new java.util.Date();
                        out.println(sdf.format(date));
                    %>
                </p>
    </footer>

</body>
</html>
