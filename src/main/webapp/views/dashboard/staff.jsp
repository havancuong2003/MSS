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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #f8f8f8;
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
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
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
            display: flex;
            flex: 1;
            height: calc(100vh - 71px); /* Chiều cao của header */
        }
        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            box-sizing: border-box;
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
        .sp{
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
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
<header>
    <div>
        <img src="logo.png" alt="">
        <span class="sp">MyStudySpace</span>
    </div>
    <div class="profile-container">
        <img src="data:image/jpeg;base64,${photoBase64}" alt="" class="profile-img" onclick="toggleProfileDropdown()">
        <div id="profileDropdown" class="profile-dropdown">
            <div class="profile-info">
                <img src="data:image/jpeg;base64,${photoBase64}" alt="">
                <div>
                    <span id="profileFullName">${requestScope.account.fullname}</span>
                    <span id="profileRole" class="role">${requestScope.roleName}</span>
                </div>
            </div>
            <div class="profile-actions">
                <a href="<%=request.getContextPath()%>/load-profile"><i class="fas fa-user"></i> My Profile</a>
                <a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </div>
</header>
<div class="main-container">
    <div class="sidebar">
        <a href="#" onclick="toggleSubMenu('homeSubMenu')"><i class="fas fa-home"></i> Home</a>
<%--        <a href="#" onclick="toggleSubMenu('userManagementSubMenu')"><i class="fas fa-users"></i> User Management</a>--%>
<%--        <div id="userManagementSubMenu" class="submenu" style="display: none;">--%>
<%--            <a href="<%=request.getContextPath()%>/add-New-Account"><i class="fas fa-user-plus"></i> Add New Account</a>--%>
<%--            <a href="<%=request.getContextPath()%>/list-account"><i class="fas fa-list"></i> Account List</a>--%>
<%--        </div>--%>
        <a href="#" onclick="toggleSubMenu('courseManagementSubMenu')"><i class="fas fa-book"></i> Course Management</a>
        <div id="courseManagementSubMenu" class="submenu" style="display: none;">
            <a href="<%=request.getContextPath()%>/addCourse"><i class="fas fa-plus"></i> Add New Course</a>
            <a href="<%=request.getContextPath()%>/listCourse"><i class="fas fa-list"></i> Course List</a>
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
