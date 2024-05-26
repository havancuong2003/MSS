<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 5/22/2024
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MSS | Admin</title>
    <%--    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.jpg">--%>
    <%--    <link rel="stylesheet" href="templates/css/bootstrapmin.css">--%>
    <%--    <link rel="stylesheet" href="templates/css/fontawesome-all.min.css">--%>
    <link rel="stylesheet" href="css/boostrapmin.css">
    <link rel="stylesheet" href="css/addnewaccount.css">
</head>
<body>
<div class="container-fluid container">
    <div class="row">
        <div class="col-lg-2 side-bar">
            <div class="top-fixed">
                <div class="content"><i class="fas fa-home" style="font-size: 20px;"></i><a href="admin?cp=1">Home</a></div>
            </div>
            <div class="bottom bottom-fixed">
                <div class="img-info"><img src="img/${currentUser.image}" alt="alt"/></div>
                <div style="margin: 0px 15px">${currentUser.f_name} ${currentUser.l_name}</div>
                <a href="logout"><i class="fas fa-sign-out-alt" style="font-size: 22px; padding-top: 5px"></i></a>
            </div>

        </div>
        <div class="col-lg-4" style="margin: 0px auto; padding-left: 50px">
            <h1 style="margin: 25px 0px">Create An Account</h1>
            <form action="add-New-Account" method="post">
                <%--                start--%>
                <div class="form-info">
                    <div class="form-group" style="margin-right: 18px">
                        <label for="name" class="input-label" >Full Name</label>
                        <input type="text" id="fullname" class="form-control" name="fullname" placeholder="" required="required" value="${f_name}">
                    </div>
                </div>
                <div class="form-group" style="margin-bottom: 0px" >
                    <label for="name" class="input-label">Username</label>
                    <input type="text" id="username" class="form-control" name="username" placeholder="" required="required" value="${username}">
                    <span style="color: red; font-size: 15px; padding-left: 5px">${errorUsername}</span>
                </div>
                <div class="name-input-style"  style="margin-bottom: 0px">
                    <div class="form-group" style="margin-right: 18px; margin-bottom: 0px">
                        <label for="name" class="input-label">Phone Number</label>
                        <input type="text" id="number" class="form-control" name="phone" placeholder="" minlength="10" maxlength="10" pattern="[0-9]{10}" title="Please enter a 10-digit phone number" value="${phone}">
                        <span style="color: red; font-size: 15px; padding-left: 5px">${errorPhone}</span>
                    </div>
                    <div class="form-group" style="margin-left: 20px; margin-bottom: 0px">
                        <label for="email" class="input-label">Email Address</label>
                        <input type="email" id="email" class="form-control" name="email" placeholder="demo@gmail.com" value="${email}">
                        <span style="color: red; font-size: 15px; padding-left: 5px">${errorEmail}</span>
                    </div>
                </div>

                <div class="form-group" style="margin-right: 50px;">
                    <p for="gender" class="input-label">Gender</p>
                    <label>
                        <input type="radio" name="gender" value="1" required ${gender == 1 ? "checked" : ""}>
                        <span style="color: #979696; margin-bottom: 10px;font-weight: 500; margin-right: 40px; cursor: pointer">Male</span>
                    </label>
                    <label>
                        <input type="radio" name="gender" value="0" required ${gender == 0 ? "checked" : ""}>
                        <span style="color: #979696;margin-bottom: 10px; font-weight: 500; cursor: pointer">Female</span>
                    </label>
                </div>

                <div class="form-group">
                    <p for="role" class="input-label">Role</p>
                    <label>
                        <input type="radio" name="role" value="3" required ${role == 3 ? "checked" : ""}>
                        <span style="color: #979696;
                                      margin-bottom: 10px;
                                      font-weight: 500; margin-right: 50px; cursor: pointer">Teacher</span>
                    </label>
                    <label>
                        <input type="radio" name="role" value="2" required ${role == 2 ? "checked" : ""}>
                        <span style="color: #979696;
                                      margin-bottom: 10px;
                                      font-weight: 500; margin-right: 50px; cursor: pointer">Staff</span>
                    </label>
                    <label>
                        <input type="radio" name="role" value="4" required ${role == 4 ? "checked" : ""}>
                        <span style="color: #979696;
                                      margin-bottom: 10px;
                                      font-weight: 500; margin-right: 80px; cursor: pointer">Student</span>
                    </label>
                    <label>
                        <input type="radio" name="role" value="1" required ${role == 1 ? "checked" : ""}>
                        <span style="color: #979696;
                                      margin-bottom: 10px;
                                      font-weight: 500; margin-right: 80px; cursor: pointer">Admin</span>
                    </label>
                </div>
                <div class="form-group">
                    <label for="password" class="input-label">Password</label>
                    <input id="password" type="password" class="form-control" name="password" placeholder="Enter password" required="required" oninput="validatePassword()">
<%--                    <span style="color: red; font-size: 15px; padding-left: 5px">${errorPassword}</span>--%>
                </div>

                <div class="form-group">
                    <label for="password" class="input-label">Confirm Password</label>
                    <input id="re-password" type="password" class="form-control" name="confirmPassword" placeholder="Confirm password" required="required" oninput="validatePassword()">
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary" style="padding: 10px 40px; margin-top: 5px">Add account</button>
                </div>
            </form>
        </div>
        <div class="col-lg-6 side-bar" style="background-color: white"></div>
    </div>
</div>

</body>
<script src="css/boostrap.min.js"></script>
<script>
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
</html>

