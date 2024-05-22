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
    <link rel="stylesheet" href="../css/boostrapmin.css">
</head>
<style>
    /*
    Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
    Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/CascadeStyleSheet.css to edit this template
    */
    /*
        Created on : May 18, 2024, 1:42:48 PM
        Author     : DEll
    */

    body {
        padding: 0px;
        margin: 0px;
        height: 100vh;
    }

    .no-padding-margin {
        margin: 0px;
        padding: 0px;
    }

    .body-content-left div a {
        color: black;
        text-decoration: none;
    }

    .side-bar {
        background-color: rgba(0,0,0,0.1);
        height: 100vh;
        display: flex;
    }

    .header {
        padding: 0px;
        margin-top: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .slidebar-content {
        list-style-type: none;
    }

    .bottom {
        display: flex;
        margin-right: 10px;
        justify-content: space-between;
        align-items: center;
    }

    .bottom-fixed {
        position: fixed;
        bottom: 0;
        padding: 10px;
    }

    .top-fixed {
        position: fixed;
        top: 0;
        padding: 10px;
    }

    .img-info img{
        width: 50px;
        height: 50px;
        border-radius: 30px;
    }

    .content a {
        color: black;
        text-decoration: none;
        margin-left: 5px;
        font-size: 20px;
    }

    /* Định dạng phần tiêu đề */
    h2 {
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    /* Định dạng thông báo lỗi */
    h5 {
        font-size: 16px;
        margin-top: -10px;
    }

    /* Định dạng nhãn và ô nhập liệu */
    .input-label {
        font-size: 16px;
        font-weight: bold;
    }

    .form-group {
        margin-bottom: 10px;
    }

    /* Định dạng nút */
    .btn {
        padding: 10px 20px;
        font-size: 16px;
    }

    /* Định dạng ô nhập liệu */
    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    /* Định dạng các ô nhập liệu cạnh nhau */
    .name-input-style {
        display: flex;
    }

    /* Định dạng các nút Reset và Add */
    .form-group button {
        margin-right: 10px;
    }

    /* Định dạng các nút radio */
    input[type="radio"] {
        margin-right: 5px;
        vertical-align: middle;
    }

    .form-info {
        display: flex;

    }

    .search-form {
        position: relative;
        display: flex;
        align-items: center;
        background-color: #f2f2f2;
        border-radius: 20px;
        padding: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .search-input {
        border: 2px solid #00000008; /* Thêm border cho input */
        background: transparent;
        font-size: 16px;
        padding: 8px 40px 6px 20px;
        outline: none;
        flex: 1;
        border-radius: 20px; /* Bo tròn cả input */
        width: 300px;
    }

    .search-button {
        position: absolute;
        right: 0;
        background-color: transparent;
        border: 2px solid transparent; /* Thêm border cho button */
        padding: 8px;
        border-radius: 20px; /* Bo tròn cả button */
        cursor: pointer;
        transition: background-color 0.3s ease;
        display: none;
    }

    .search-icon {
        color: #555;
    }

    .search-input:focus {
        border-color: #007bff;
    }


    td button {
        width: 80px;
    }

    .btn {
        padding: 10px 15px;
    }

    .centered-button {
        display: inline-block;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        margin-left: 45%; /* căn giữa ngang */
        transition: background-color 0.3s; /* hiệu ứng chuyển đổi màu nền */
    }

    .centered-button:hover {
        background-color: #ffd700; /* màu vàng */
    }

</style>
<body>
<div class="container-fluid">
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
                        <input type="text" id="fullname" class="form-control" name="fullname" placeholder="" required="required" value="${fullname}">
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
                        <input type="radio" name="role" value="0" required ${role == 0 ? "checked" : ""}>
                        <span style="color: #979696;
                                      margin-bottom: 10px;
                                      font-weight: 500; margin-right: 50px; cursor: pointer">Teacher</span>
                    </label>

                    <label>
                        <input type="radio" name="role" value="1" required ${role == 1 ? "checked" : ""}>
                        <span style="color: #979696;
                                      margin-bottom: 10px;
                                      font-weight: 500; margin-right: 80px; cursor: pointer">Student</span>
                    </label>
                </div>
                <div class="form-group">
                    <label for="password" class="input-label">Password</label>
                    <input id="password" type="password" class="form-control" name="password" placeholder="Enter password" required="required" oninput="validatePassword()">
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

