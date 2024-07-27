<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <!-- Thêm Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Đảm bảo chiều cao tối thiểu của body là 100% viewport height */
            margin: 0;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #e7e7e7;
            width: 100%;
            box-sizing: border-box;
        }

        header img {
            height: 40px;
            width: 40px;
        }

        header span {
            font-size: 24px;
            font-weight: bold;
            color: white;
        }

        .profile-container {
            position: relative;
            display: inline-block;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }

        .profile-dropdown {
            display: none;
            position: absolute;
            right: 0;
            top: 50px;
            background-color: #ffffff;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            padding: 20px;
            z-index: 1;
            width: 160px;
            border-radius: 8px;
        }

        .profile-info {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
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

        .profile-actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
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
            flex: 1;
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #f5f5f5;
            color: #333;
            display: flex;
            flex-direction: column;
            padding: 20px;
            box-sizing: border-box;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ccc; /* Border cho sidebar */
            margin:30px;
            height: max-content;
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: #333;
            display: block;
            transition: background 0.3s;
            margin-bottom: 30px;
            border-radius: 4px;
            background-color: #d0d0d0; /* Màu nền cho mỗi chức năng */
        }

        .sidebar a:hover {
            background-color: #b8b8b8; /* Màu nền khi di chuột qua */
        }

        .sidebar .submenu a {
            padding: 15px 30px;
            background-color: #4d4d4d; /* Màu nền cho submenu */
            margin-left: 15px;
            border-radius: 4px;
            color: #FFFFFF;
        }

        .sidebar .submenu a:hover {
            background-color: #333333; /* Màu nền khi di chuột qua submenu */
        }
        /* CSS cho submenu */
        .submenu {
            display: none; /* Ẩn submenu mặc định */
            padding: 0;


            border-radius: 4px;


        }

        .submenu a {
            padding: 10px 20px;
            display: block;
            color: #333;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .submenu a:hover {
            background-color: #c0c0c0; /* Màu nền khi di chuột qua submenu */
        }



        .sidebar a:hover {
            background-color: #e0e0e0; /* Màu nền khi di chuột qua các mục sidebar */
        }


        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f1f1f1;
            /*overflow-y: auto;*/
        }
        footer {
            background-color: #E8E8E8;
            padding: 15px;
            width: 100%;
            position: relative;
            margin-top: 20px; /* Cách phần nội dung chính để tránh bị che khuất */
        }

        .sp {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
        }

        body {
            font-family: Helvetica;
            margin: 0;
        }
        a {
            text-decoration: none;
            color: #000;
        }
        .site-header {
            border-bottom: 1px solid #ccc;
            padding: .5em 1em;
            position: relative;
        }

        .site-header::after {
            content: "";
            display: table;
            clear: both;
        }

        .site-identity {
            float: left;
        }

        .site-identity h1 {
            font-size: 1.5em;
            margin: .7em 0 .3em 0;
            display: inline-block;
            color: white;
        }

        .site-identity img {
            max-width: 55px;
            float: left;
            margin: 0 10px 0 0;
        }

        .site-navigation {
            float: right;
        }

        .site-navigation ul, li {
            margin: 0;
            padding: 0;
        }

        .site-navigation li {
            display: inline-block;
            margin: 1.4em 1em 1em 1em;
        }

        .avatar-container {
            float: right;
            position: absolute;
            margin: 1em 1em 1em 0;
            cursor: pointer;
            right: 20px; /* Di chuyển avatar sát bên phải */
        }

        .avatar {
            border-radius: 50%;
            width: 40px;
            height: 40px;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            right: 0;
            top: 200%;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-menu a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #000;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }
        .submenu a i {
            color: #FFFFFF; /* Màu trắng cho icon trong submenu */
        }
        .modal-body {
            padding: 20px;
        }

        #listCourse {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            background-color: #f8f9fa;
            color: #495057;
            margin-bottom: 10px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="none" stroke="gray" stroke-width=".5" d="M2 0L0 2h4z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px 10px;
        }

        #listCourse:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        #listCourseBank {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            background-color: #f8f9fa;
            color: #495057;
            margin-bottom: 10px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="none" stroke="gray" stroke-width=".5" d="M2 0L0 2h4z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px 10px;
        }

        #listCourseBank:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }

        function logout() {
            // Add your logout logic here
            // alert('Logged out');
        }

        function toggleSubMenu(menuId) {
            var submenu = document.getElementById(menuId);
            submenu.style.display = (submenu.style.display === "block") ? "none" : "block";
        }
    </script>
</head>
<body>
<header class="site-header">
    <div class="site-identity">
        <a href="dashboard"><img src="https://d112y698adiu2z.cloudfront.net/photos/production/software_thumbnail_photos/000/532/351/datas/medium.jpg" alt="Site Name" /></a>
        <h1><a href="dashboard">My study space</a></h1>
    </div>

    <div class="avatar-container" onclick="toggleProfileDropdown()">
        <img src="data:image/jpeg;base64,${photoBase64}" alt="Avatar" class="avatar" />
        <div id="profileDropdown" class="dropdown-menu">
            <a href="../load-profile">Setting</a>
            <a href="../logout" onclick="logout()">Logout</a>
        </div>
    </div>
</header>
<div class="main-container">
    <div class="sidebar">
        <a href="dashboard">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="#" onclick="toggleSubMenu('scheduleSubMenu')"><i class="fas fa-calendar-alt"></i> Education </a>
        <div id="scheduleSubMenu" class="submenu" style="display: none;">
            <a href="../manager/schedule"><i class="fas fa-calendar"></i> View Schedule</a>
            <a href="../manager/viewattendancereport"><i class="fas fa-check"></i> View Attendance Report</a>
            <a href="../manager/viewgrade"><i class="fas fa-tasks"></i> View Grade Report</a>
        </div>
        <a href="#managePublicQuestions" data-toggle="modal"> <i class="fas fa-tasks"></i> Manage Public Question</a>
        <a href="#manageBankQuestions" data-toggle="modal"> <i class="fas fa-database"></i> Manage Question Bank</a>
    </div>
    <div class="content">
        <!-- Nội dung dashboard -->
    </div>
</div>
</body>
<div class="modal fade" id="managePublicQuestions" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Manage Public Question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="manage-public-question" method="get" onsubmit="return validateForm()">
                <div class="modal-body">
                    <!-- Nội dung modal -->
<%--                    <input type="hidden" name="course_id" id="course_id" value="">--%>
                    <select name="course_id" id="listCourse" onchange="updateCourseId()">
                        <option value="0" data-course-id="">Please choose course</option>
                        <c:forEach var="o" items="${listCourse}">
                            <option value="${o.id}"  data-course-id="${o.id}">${o.code}</option>
                        </c:forEach>
                    </select>
                    <div id="error-message" style="color: red" class="error"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn" style="background-color: #FF6600; color: whitesmoke">Go to manage public question</button>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="modal fade" id="manageBankQuestions" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel">Manage Question Bank</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="manageBankForm" action="manage-bank-question" method="get" onsubmit="return validateFormBank()">
                <div class="modal-body">
                    <!-- Nội dung modal -->
                    <select name="course_id" id="listCourseBank">
                        <option value="0" data-course-id="">Please choose course</option>
                        <c:forEach var="o" items="${listCourse}">
                            <option value="${o.id}" data-course-id="${o.id}">${o.code}</option>
                        </c:forEach>
                    </select>
                    <div id="error-message-bank" style="color: red" class="error"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn" style="background-color: #FF6600; color: whitesmoke">Go to manage question bank</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    function validateForm() {
        // Lấy giá trị của select
        const courseSelect = document.getElementById('listCourse');
        const selectedCourseId = courseSelect.value;

        // Lấy phần tử để hiển thị thông báo lỗi
        const errorMessage = document.getElementById('error-message');

        // Kiểm tra nếu không có khóa học nào được chọn
        if (selectedCourseId === '0') {
            errorMessage.textContent = 'Please select a course.';
            return false; // Ngăn chặn gửi biểu mẫu
        }

        // Xóa thông báo lỗi nếu khóa học được chọn hợp lệ
        errorMessage.textContent = '';
        return true; // Cho phép gửi biểu mẫu
    }

    // Gán hàm validateForm() để kiểm tra khi người dùng gửi biểu mẫu
    document.querySelector('form').addEventListener('submit', function(event) {
        if (!validateForm()) {
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu nếu có lỗi
        }
    });

</script>
<script>
    function validateFormBank() {
        const courseSelect = document.getElementById('listCourseBank');
        const errorMessageDiv = document.getElementById('error-message-bank');

        // Reset the error message
        errorMessageDiv.textContent = '';

        if (courseSelect.value === '0') {
            errorMessageDiv.textContent = 'Please select a course.';
            return false; // Prevent form submission
        }

        return true; // Allow form submission
    }

</script>
</html>
