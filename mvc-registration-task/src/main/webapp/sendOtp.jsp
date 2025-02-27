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
            background-image: url('https://wallpaperaccess.com/full/359978.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
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
        .header, .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px 0;
        }
         header {
                            background-color: #6c757d;
                            color: white;
                            padding: 4px 20px;
                        }
                        header .logo img {
                            height: 60px;
                        }
                        header nav a {
                            color: white;
                            text-decoration: none;
                            margin: 0 10px;
                        }
    </style>
</head>
<body>

<header class="d-flex justify-content-between align-items-center">
    <div class="logo">
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="Xworkz ODC Logo">
    </div>
</header>

<div class="form-container">
    <h2>OTP Verification</h2>
    <form action="validateOtp" method="get" id="otpForm">
         <div class="mb-3">
                    <label for="email" class="form-label">Enter Email</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="EnterEmail" required >
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



<footer class="footer">
    <p>&copy; 2025 X-Workz ODC. All Rights Reserved. <a href="privacy.html">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
  const otpSend = async () => {
      const email = document.getElementById("email").value;

      if (!email) {
          alert("Please enter your email address.");
          return;
      }

      try {
          const response = await axios.get("http://localhost:8080/mvc-registration-task/api/sendOtp/"+email);

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
