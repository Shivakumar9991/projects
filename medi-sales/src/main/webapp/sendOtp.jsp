<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #6c757d, #f8f9fa);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           background-image: url('https://img.freepik.com/premium-photo/abstract-background-tablets-capsules-white-background_418128-257.jpg');
                       background-size: cover;
                       background-position: center;
                       background-repeat: no-repeat;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .form-container {
            max-width: 400px;
            width: 100%;
            background: #ffffffe0;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            margin: auto;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #343a40;
        }
        .form-container .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }
        .form-container .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-container .text-center a {
            color: #007bff;
            text-decoration: none;
        }
        .form-container .text-center a:hover {
            text-decoration: underline;
        }
        .form-container label {
            font-weight: 600;
            color: #495057;
        }
        .form-container input {
            border-radius: 8px;
        }
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

    </style>
</head>
<body>

<header>
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="MediSales">
        <a href="index">Home</a>
    </header>

<div class="form-container">
    <h2>OTP Verification</h2>
    <form action="validateOtp" method="get" id="otpForm">
         <div class="mb-3">
                    <label for="registeredEmail" class="form-label">Enter Email</label>
                    <input type="text" class="form-control" id="registeredEmail" name="registeredEmail" placeholder="EnterEmail" required >
                </div>
                <div class="d-grid mb-3">
                            <button type="button" class="btn btn-primary" onclick="otpSend()" id="sendOtpBtn">Send OTP</button>
                        </div>
                            <div class="mb-3">
                                        <label for="otp" class="form-label">Enter OTP</label>
                                        <input type="text" class="form-control" id="otp" name="otp" placeholder="Enter OTP" required disabled>
                                    </div>

                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary"  id="verifyOtpBtn" disabled>Verify OTP</button>
                                    </div>
                                    <div class="text-center mt-3">
                                        <a href="resendOtp">Resend OTP</a>
                                    </div>

                               </div>

    </form>

</div>
<div>



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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
  const otpSend = async () => {
      const email = document.getElementById("registeredEmail").value;

      if (!email) {
          alert("Please enter your email address.");
          return;
      }

      try {
          const response = await axios.get("http://localhost:8080/medi-sales-project/api/sendOtp/"+email);

          if (response.data !== "OTP not sent. Email not found.") {
              alert("OTP sent successfully to your email!");

              // Enable OTP input and verification button
              document.getElementById("otp").disabled = false;
              document.getElementById("verifyOtpBtn").disabled = false;

          } else {
              alert(response.data);
          }
      } catch (error) {
          console.error("Error sending OTP:", error);
          alert("Failed to send OTP. Please try again.");
      }
  };
</script>


</body>
</html>
