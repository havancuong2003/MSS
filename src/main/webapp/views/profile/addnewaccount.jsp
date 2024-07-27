<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f4;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #343a40;
            border-bottom: 1px solid #e7e7e7;
            width: 100%;
            box-sizing: border-box;
            color: white;
        }
        header img {
            height: 40px;
            width: 40px;
        }
        header span {
            font-size: 24px;
            font-weight: bold;
            color: #ff8a00;
        }

        .profile-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .profile-info div {
            display: flex;
            flex-direction: column;
        }
        .profile-info span {
            font-size: 16px;
        }
        .profile-info span.role {
            font-size: 14px;
            color: #888;
        }

        .profile-actions a {
            text-decoration: none;
            color: rgb(105, 122, 141);
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: color 0.3s;
        }
        .profile-actions a:hover {
            color: #0056b3;
        }
        .main-container {
            display: flex;
            flex: 1;
            height: calc(100vh - 71px);
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            display: block;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .sidebar .submenu a {
            padding-left: 40px;
            font-size: 14px;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f1f1f1;
            overflow-y: auto;
        }
        .sp {
            font-family: "Poppins", sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
        }
        .form-group.required .control-label:after {
            content: " *";
            color: red;
        }
        .form-group .invalid-feedback {
            display: block;
        }
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            color: #343a40;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #343a40;
            font-weight: 500;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        .form-group input[type="radio"] {
            width: auto;
            margin-right: 10px;
            padding: 10px;
        }
        .form-group .form-check-label {
            margin-right: 20px;
            color: #343a40;
        }
        .btn-primary {
            background-color: #ff8a00;
            border-color: #ff8a00;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #e67900;
        }
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        }

        function logout() {
            // Add your logout logic here
            //  alert('Logged out');
        }

        function toggleSubMenu(menuId) {
            var submenu = document.getElementById(menuId);
            submenu.style.display = submenu.style.display === "block" ? "none" : "block";
        }

        document.addEventListener('DOMContentLoaded', function () {
            var password = document.getElementById("password");
            var confirmPassword = document.getElementById("re-password");

            function validatePassword() {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity("Passwords do not match");
                } else {
                    confirmPassword.setCustomValidity('');
                }
            }

            password.addEventListener('change', validatePassword);
            confirmPassword.addEventListener('keyup', validatePassword);
        });
    </script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="main-container">

    <div class="content">
        <!-- Nội dung dashboard -->
        <div class="form-container col-lg-6 mx-auto">
            <h1 class="form-title">Create An Account</h1>
            <form action="add-New-Account" method="post">
                <div class="form-group">
                    <label for="fullname">Full Name*</label>
                    <input type="text" id="fullname" class="form-control" name="fullname" required value="${f_name}">
                </div>
                <div class="form-group">
                    <label for="username">Username*</label>
                    <input type="text" id="username" class="form-control" name="username" required value="${username}">
                    <div class="invalid-feedback">${errorUsername}</div>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number*</label>
                    <input type="text" id="number" class="form-control" name="phone" minlength="10" maxlength="10" pattern="[0-9]{10}" title="Please enter a 10-digit phone number" required value="${phone}">
                    <div class="invalid-feedback">${errorPhone}</div>
                </div>
                <div class="form-group">
                    <label for="email">Email Address*</label>
                    <input type="email" id="email" class="form-control" name="email" required value="${email}">
                    <div class="invalid-feedback">${errorEmail}</div>
                </div>
                <div class="form-group">
                    <label>Gender*</label>
                    <div class="d-flex">
                        <div class="form-check me-4">
                            <input type="radio" id="genderMale" name="gender" value="1" required ${gender == 1 ? "checked" : ""} class="form-check-input">
                            <label class="form-check-label" for="genderMale">Male</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" id="genderFemale" name="gender" value="0" required ${gender == 0 ? "checked" : ""} class="form-check-input">
                            <label class="form-check-label" for="genderFemale">Female</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Role*</label>
                    <div class="d-flex flex-wrap">
                        <div class="form-check me-4">
                            <input type="radio" id="roleTeacher" name="role" value="3" required ${role == 3 ? "checked" : ""} class="form-check-input">
                            <label class="form-check-label" for="roleTeacher">Teacher</label>
                        </div>
                        <div class="form-check me-4">
                            <input type="radio" id="roleStaff" name="role" value="2" required ${role == 2 ? "checked" : ""} class="form-check-input">
                            <label class="form-check-label" for="roleStaff">Staff</label>
                        </div>
                        <div class="form-check me-4">
                            <input type="radio" id="roleStudent" name="role" value="4" required ${role == 4 ? "checked" : ""} class="form-check-input">
                            <label class="form-check-label" for="roleStudent">Student</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" id="roleAdmin" name="role" value="1" required ${role == 1 ? "checked" : ""} class="form-check-input">
                            <label class="form-check-label" for="roleAdmin">Admin</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Password*</label>
                    <input id="password" type="password" class="form-control" name="password" required oninput="validatePassword()">
                </div>
                <div class="form-group">
                    <label for="re-password">Confirm Password*</label>
                    <input id="re-password" type="password" class="form-control" name="confirmPassword" required oninput="validatePassword()">
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary">Add Account</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="css/boostrap.min.js"></script>
<script src="templates/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-Vo0ewNxsZn2Zr2sfotIsOzKQC4fTJPfdHCw2t1jPj2QgW9FpHkAPc6k7cWz1V6k4" crossorigin="anonymous"></script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
