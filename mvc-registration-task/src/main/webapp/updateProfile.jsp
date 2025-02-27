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
             background-image: url('https://wallpaperaccess.com/full/359978.jpg');
             background-repeat:no-repeat;
             background-position:center;
             background-size:cover;

            margin: 0;
            padding: 0;
            color: #333;
        }
        header {
            background-color: #00796b;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header .logo img {
            height: 60px;
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
            background-color: #004d40;
            color: white;
            padding: 15px;
            text-align: center;
        }
        footer a {
            color: #80deea;
            text-decoration: none;
        }
        footer .social-media img {
            width: 30px;
            margin: 0 10px;
        }
    </style>
</head>
<body>
<header>
    <div class="logo">
        <img src="https://raw.githubusercontent.com/X-workzDev01/xworkzwebsite/master/src/main/webapp/assets/images/Logo.png" alt="Xworkz ODC Logo">
    </div>
    <nav>
    <div style="display: flex; justify-content : end ; align-items:center"></div>
    <div> <img style="border-radius :50%" height="30px" width="30px" src="view/${dto.getProfilePhoto()}"></div>
      <a href="signIn">Profile</a>
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
                <label for="firstName" class="form-label">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="${dto.getFirstName()}" placeholder="Enter first name" required>
            </div>
            <div class="col-md-6">
                <label for="lastName" class="form-label">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="${dto.getLastName()}" placeholder="Enter last name" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <div><p>${emailVerifies}</p></div>
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="${dto.getEmail()}" placeholder="Enter email" required>
            </div>
            <div class="col-md-6">
                <label for="alternativeEmail" class="form-label">Alternative Email:</label>
                <input type="alterEmail" class="form-control" id="alterEmail" name="alterEmail" value="${dto.getAlterEmail()}" placeholder="Enter Alter Email" required>
            </div>
        </div>

        <div class="row mb-3">
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
                <label for="contactNo" class="form-label">Contact Number:</label>
                <input type="tel" class="form-control" id="contactNo" name="contact" value="${dto.getContact()}" placeholder="Enter contact number" required>
            </div>
            <div class="col-md-6">
                <label for="alternativeContactNo" class="form-label">Alternative Contact:</label>
                <input type="tel" class="form-control" id="alternativeContactNo" name="alternativeContact" value="${dto.getAlternativeContact()}" placeholder="Enter alternative contact">
            </div>
        </div>
        <div class="mb-3">
            <label for="dob" class="form-label">Date of Birth:</label>
            <input type="date" class="form-control" id="dob" value="${dto.getDob()}" name="dob" required>
        </div>
        <div class="mb-3">
            <label for="village" class="form-label">Place:</label>
            <input type="text" class="form-control" id="village" name="place" value="${dto.getPlace()}" placeholder="Enter village" required>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="state" class="form-label">State:</label>
                <select class="form-select" id="state" name="state" value="${dto.getState()}" required>
                    <option value="${dto.getState()}">${dto.getState()}</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="district" class="form-label">District:</label>
                <select class="form-select" id="district" name="district" value="${dto.getDistrict()}" required>
                    <option value="${dto.getDistrict()}">${dto.getDistrict()}</option>
                </select>
            </div>
        </div>
        <input type="file" name="file" />

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Update Profile</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
    </form>
</main>

<footer>
    <p>Contact us: <a href="mailto:info@xworkzodc.com">info@xworkzodc.com</a></p>
    <div class="social-media">
        <a href="https://www.facebook.com/xworkzdevelopmentcenter/"><img src="https://cdn-icons-png.flaticon.com/512/124/124010.png" alt="Facebook"></a>
        <a href="https://www.instagram.com/xworkzraj/"><img src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png" alt="Instagram"></a>
        <a href="https://www.ambitionbox.com/reviews/x-workz-reviews/software-trainee"><img src="https://cdn-icons-png.flaticon.com/512/733/733635.png" alt="Twitter"></a>
    </div>
    <p id="current-date"></p>
</footer>

<script>
    const stateDistrictMapping = {
        "Karnataka": ["Bagalkot", "Ballari", "Bengaluru Urban", "Chikkamagaluru", "Kalaburgi", "Bidar", "Raichur", "Yadgir", "Mysuru", "Koppal", "Haveri", "Hassan", "Bijapur", "Gadag"],
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

</body>
</html>
