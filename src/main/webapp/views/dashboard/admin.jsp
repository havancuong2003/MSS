<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <!-- Thêm Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }

        function logout() {
            // Add your logout logic here
            //  alert('Logged out');

        }

        function toggleSubMenu(menuId) {
            var submenu = document.getElementById(menuId);
            submenu.style.display = (submenu.style.display === "block") ? "none" : "block";
        }
    </script>
</head>
<body>
<div>
    <c:if test="${timeRegister eq 'null'}">
        <jsp:include page="./modalRegisterGroup.jsp"/>
    </c:if>
    <c:if test="${CreateGroup eq 'null'}">
        <jsp:include page="./modalErrorCreateGroup.jsp"/>
    </c:if>
    <c:if test="${ChangeGroup eq 'null'}">
        <jsp:include page="./modalTimeChangeGroup.jsp"/>
    </c:if>
</div>
<div></div>
<div></div>
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
        <a href="#" onclick="toggleSubMenu('userManagementSubMenu')"><i class="fas fa-users"></i> User Management</a>
        <div id="userManagementSubMenu" class="submenu" style="display: none;">
            <a href="<%=request.getContextPath()%>/add-New-Account"><i class="fas fa-user-plus"></i> Add New Account</a>
            <a href="<%=request.getContextPath()%>/list-account"><i class="fas fa-list"></i> Account List</a>
        </div>
        <a href="#" onclick="toggleSubMenu('courseManagementSubMenu')"><i class="fas fa-book"></i> Course Management</a>
        <div id="courseManagementSubMenu" class="submenu" style="display: none;">
            <a href="<%=request.getContextPath()%>/admin/addCourse"><i class="fas fa-plus"></i> Add New Course</a>
            <a href="<%=request.getContextPath()%>/admin/listCourse"><i class="fas fa-list"></i> Course List</a>
        </div>
        <a href="#" onclick="toggleSubMenu('timePeriodsSubMenu')"><i class="fas fa-clock"></i> Time Periods</a>
        <div id="timePeriodsSubMenu" class="submenu" style="display: none;">
            <a href="timeChangeClass"><i class="fas fa-exchange-alt"></i> Time Change Class</a>
            <a href="registerTime"><i class="fas fa-calendar-check"></i> Time Register Course</a>
        </div>
        <a href="#" onclick="toggleSubMenu('scheduleSubMenu')"><i class="fas fa-calendar-alt"></i> Education </a>
        <div id="scheduleSubMenu" class="submenu" style="display: none;">
            <a href="../manager/schedule"><i class="fas fa-calendar"></i> View Schedule</a>
            <a href="../manager/viewattendancereport"><i class="fa fa-check" aria-hidden="true"></i> View Attendance Report</a>
            <a href="../manager/viewgrade"><i class="fas fa-tasks"></i> View Grade Report</a>
        </div>
        <a href="#" onclick="toggleSubMenu('curSubMenu')"><i class="fas fa-book"></i> Curriculum Management</a>
        <div id="curSubMenu" class="submenu" style="display: none;">
            <a href="viewCurriculum"><i class="fas fa-book-open"></i> View Curriculum</a>
            <a href="addCourseToCurriculum"><i class="fas fa-plus"></i> Add Course To Curriculum</a>
        </div>
        <a href="#" onclick="toggleSubMenu('groupSubMenu')"><i class="fas fa-users"></i> Group</a>
        <div id="groupSubMenu" class="submenu" style="display: none;">
            <a href="createGroup"><i class="fas fa-users-cog"></i> Create Group</a>
            <a href="viewGroup"><i class="fas fa-list"></i> View all Group</a>
        </div>
        <a href="manage-application"><i class="fas fa-tasks"></i> Manage Request</a>
        <a href="#" onclick="toggleSubMenu('majorSubMenu')"><i class="fas fa-university"></i> Major Management</a>
        <div id="majorSubMenu" class="submenu" style="display: none;">
            <a href="viewmajor"><i class="fas fa-list-ul"></i> View List Major</a>
        </div>

    </div>
    <div class="content">
        <!-- Nội dung dashboard -->
    </div>
</div>
</body>
</html>
