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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.2.1/axios.min.js"></script>
    <style>
        body {
            background-color: #f5f5f5;
            background-image: url('https://wallpaperaccess.com/full/359978.jpg');
            background-repeat:no-repeat;
            background-position:center;
            background-size:cover;
        }
        header {
            background-color: #6c757d;
            color: white;
            padding: 15px 20px;
        }
        header .logo img {
            height: 60px;
        }
        .form-container {
               max-width: 600px;
               margin: 20px auto;
               padding: 30px;
               background: #ffffffe0;
               border-radius: 8px;
               box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 10px;
            text-align: center;
        }
        footer .social-media img {
            width: 24px;
            margin: 0 8px;
        }
        span{
        color:red;
        }
    </style>
</head>
<body>

<header class="d-flex justify-content-between align-items-center">
    <div class="logo">
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="Xworkz ODC Logo">
    </div>
    <nav>
        <a href="index" class="text-white text-decoration-none mx-3">Home</a>
        <a href="signIn " class="text-white text-decoration-none mx-3">Sign In</a>
    </nav>
</header>

<main class="form-container">
    <h1 class="text-center mb-4">Register Now</h1>
    <form action="user" method="post">

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="firstName" class="form-label">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name" required>
                <span>${FirstNameError}</span>
            </div>
            <div class="col-md-6">
                <label for="lastName" class="form-label">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name" required>
                   <span>${LastNameError}</span>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
            <div><p>${emailVerifies}</p></div>
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" onblur="checkEmail()" placeholder="Enter email" required>
                <span id="emailError"></span>
                <span>${EmailError}</span>
            </div>
            <div class="col-md-6">
                <label for="alternativeEmail" class="form-label">Alternative Email:</label>
                <input type="email" class="form-control" id="alternativeEmail" name="alterEmail" placeholder="Enter alternative email">
                <span>${AlterEmailError}</span>
            </div>
        </div>
         <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                        <span>${PasswordError}</span>
                    </div>
                    <div class="col-md-6">
                        <label for="confirmPassword" class="form-label">Confirm Password:</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required>
                        <span>${ConfirmPasswordError}</span>
                    </div>
                </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="contactNo" class="form-label">Contact Number:</label>
                <input type="tel" class="form-control" id="contact" name="contact" onblur="checkContact()" placeholder="Enter contact number"   required>
                <span id="contactError"></span>
                 <span>${ContactError}</span>
            </div>
            <div class="col-md-6">
                <label for="alternativeContactNo" class="form-label">Alternative Contact:</label>
                <input type="tel" class="form-control" id="alternativeContactNo" name="alternativeContact" placeholder="Enter alternative contact">
                <span>${AlternativeContactError}</span>
            </div>
        </div>

        <div class="mb-3">
            <label for="dob" class="form-label">Date of Birth:</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
        </div>

        <div class="mb-3">
            <label for="village" class="form-label">Village:</label>
            <input type="text" class="form-control" id="village" name="place" placeholder="Enter village" required>
            <span>${PlaceError}</span>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="state" class="form-label">State:</label>
                <select class="form-select" id="state" name="state" required>
                    <option value="">Select State</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                </select>
                <span>${StateError}</span>
            </div>
            <div class="col-md-6">
                <label for="district" class="form-label">District:</label>
                <select class="form-select" id="district" name="district" required>
                    <option value="">Select District</option>
                </select>
                <span>${DistrictError}</span>
            </div>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Register</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
    </form>
</main>

<footer>
    <p>Contact us: <a href="mailto:info@xworkzodc.com" class="text-white">info@xworkzodc.com</a></p>
    <div class="social-media">
        <a href="https://www.facebook.com/xworkzdevelopmentcenter/"><img src="https://cdn-icons-png.flaticon.com/512/124/124010.png" alt="Facebook"></a>
        <a href="https://www.instagram.com/xworkzraj/"><img src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png" alt="Instagram"></a>
        <a href="https://www.ambitionbox.com/reviews/x-workz-reviews/software-trainee"><img src="https://cdn-icons-png.flaticon.com/512/733/733635.png" alt="Twitter"></a>
    </div>
    <p id="current-date"></p>
</footer>

<script>
    const stateDistrictMapping = {
        "Karnataka": ["Bagalkot", "Ballari", "Bengaluru Urban", "Chikkamagaluru","Kalaburgi","Bidar","Raichur","Yadgir","Mysuru",
        "Koppal","Haveri","Hassan","Bijapur","Gadag",""],
        "Maharashtra": ["Mumbai", "Pune", "Nagpur", "Nashik"],
        "Andhra Pradesh": ["Vijayawada", "Visakhapatnam", "Guntur", "Nellore"]
    };

    const stateSelect = document.getElementById("state");
    const districtSelect = document.getElementById("district");

    stateSelect.addEventListener("change", function() {
        const selectedState = stateSelect.value;
        districtSelect.innerHTML = '<option value="">Select District</option>';

        if (stateDistrictMapping[selectedState]) {
            stateDistrictMapping[selectedState].forEach(district => {
                const option = document.createElement("option");
                option.value = district;
                option.textContent = district;
                districtSelect.appendChild(option);
            });
        }
    });

    const currentDate = new Date().toLocaleDateString();
    document.getElementById("current-date").textContent = `Today's Date: ${currentDate}`;

    const form = document.querySelector("form");
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmPassword");

    form.addEventListener("submit", function(event) {
        if (password.value !== confirmPassword.value) {
            event.preventDefault();
            alert("Passwords do not match!");
        }
    });
</script>
<script>

        const checkEmail = async ()=>{
        const email = document.getElementById("email").value
        const response = await axios("http://localhost:8080/mvc-registration-task/api/checkEmail/"+email)
        if(response.data==="Email already exists..."){
        document.getElementById("emailError").innerHTML=response.data
        }else{
        document.getElementById("emailError").innerHTML=""
        }

  }

</script>
<script>

        const checkContact = async ()=>{
        const contact = document.getElementById("contact").value
        const response = await axios("http://localhost:8080/mvc-registration-task/api/checkContact/"+contact)
        if(response.data==="Number already exists..."){
        document.getElementById("contactError").innerHTML=response.data
        }else{
        document.getElementById("contactError").innerHTML=""
        }
  }

</script>

</body>
</html>
