<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:if test="${ChangeGroup eq 'nulladasdss'}">
        <jsp:include page="./modalTimeChangeGroup.jsp"/>
    </c:if>

</div>
<header class="site-header">
    <div class="site-identity">
        <a href="dashboard"><img src="https://d112y698adiu2z.cloudfront.net/photos/production/software_thumbnail_photos/000/532/351/datas/medium.jpg" alt="Site Name" /></a>
        <h1><a href="dashboard">My study space</a></h1>
    </div>

    <div class="avatar-container" onclick="toggleProfileDropdown()">
        <img src="data:image/jpeg;base64,${photoBase64}" alt="Avatar" class="avatar" />
        <div id="profileDropdown" class="dropdown-menu">
            <a href="#">Setting</a>
            <a href="../logout" onclick="logout()">Logout</a>
        </div>
    </div>
</header>

<div class="main-container">
    <div class="sidebar">
        <a href="dashboard">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <!-- User Management -->
        <a href="#" onclick="toggleSubMenu('userManagementSubMenu', event)">
            <i class="fas fa-users"></i> User Management
        </a>
        <div id="userManagementSubMenu" class="submenu">
            <a href="add-New-Account">
                <i class="fas fa-user-plus"></i> Add New Account
            </a>
            <a href="list-account">
                <i class="fas fa-list"></i> Account List
            </a>
        </div>

        <!-- Course Management -->
        <a href="#" onclick="toggleSubMenu('courseManagementSubMenu', event)">
            <i class="fas fa-book"></i> Course Management
        </a>
        <div id="courseManagementSubMenu" class="submenu">
            <a href="addCourse">
                <i class="fas fa-plus"></i> Add New Course
            </a>
            <a href="listCourse">
                <i class="fas fa-list"></i> Course List
            </a>
        </div>

        <!-- Time Periods -->
        <a href="#" onclick="toggleSubMenu('timePeriodsSubMenu', event)">
            <i class="fas fa-clock"></i> Time Periods
        </a>
        <div id="timePeriodsSubMenu" class="submenu">
            <a href="timeChangeClass">
                <i class="fas fa-exchange-alt"></i> Time Change Class
            </a>
            <a href="registerTime">
                <i class="fas fa-calendar-check"></i> Time Register Course
            </a>
        </div>

        <!-- Education -->
        <a href="#" onclick="toggleSubMenu('scheduleSubMenu', event)">
            <i class="fas fa-calendar-alt"></i> Education
        </a>
        <div id="scheduleSubMenu" class="submenu">
            <a href="../manager/schedule">
                <i class="fas fa-calendar"></i> View Schedule
            </a>
            <a href="../manager/viewattendancereport">
                <i class="fa fa-check" aria-hidden="true"></i> View Attendance Report
            </a>
            <a href="../manager/viewgrade">
                <i class="fas fa-tasks"></i> View Grade Report
            </a>
        </div>

        <!-- Slot -->
        <a href="#" onclick="toggleSubMenu('slotSubMenu', event)">
            <i class="fas fa-clock"></i> Slot
        </a>
        <div id="slotSubMenu" class="submenu">
            <a href="viewslot">
                <i class="fas fa-plus-circle"></i> Add Slot
            </a>
        </div>


        <!-- Semester -->
        <a href="#" onclick="toggleSubMenu('semesterSubMenu', event)">
            <i class="fas fa-university"></i> Semester
        </a>
        <div id="semesterSubMenu" class="submenu">
            <a href="addSemester">
                <i class="fas fa-plus-square"></i> Add New Semester
            </a>
            <a href="viewupdatesemester">
                <i class="fas fa-eye"></i> View Semester
            </a>

        </div>


        <!-- Curriculum Management -->
        <a href="#" onclick="toggleSubMenu('curSubMenu', event)">
            <i class="fas fa-book"></i> Curriculum Management
        </a>
        <div id="curSubMenu" class="submenu">
            <a href="viewCurriculum">
                <i class="fas fa-book-open"></i> View Curriculum
            </a>
            <a href="addCourseToCurriculum">
                <i class="fas fa-plus"></i> Add Course To Curriculum
            </a>
        </div>

        <!-- Group -->
        <a href="#" onclick="toggleSubMenu('groupSubMenu', event)">
            <i class="fas fa-users"></i> Group
        </a>
        <div id="groupSubMenu" class="submenu">
            <a href="createGroup">
                <i class="fas fa-users-cog"></i> Create Group
            </a>
            <a href="viewGroup">
                <i class="fas fa-list"></i> View all Group
            </a>
        </div>

        <!-- Manage Request -->
        <a href="manage-application">
            <i class="fas fa-tasks"></i> Manage Request
        </a>

        <!-- Major Management -->
        <a href="#" onclick="toggleSubMenu('majorSubMenu', event)">
            <i class="fas fa-university"></i> Major Management
        </a>
        <div id="majorSubMenu" class="submenu">
            <a href="viewmajor">
                <i class="fas fa-list-ul"></i> View List Major
            </a>
        </div>
    </div>
    <div class="content">
        <h1>Welcome to the Dashboard</h1>
        <p>This is the main content area. Replace this with your actual content.</p>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>


</html>
