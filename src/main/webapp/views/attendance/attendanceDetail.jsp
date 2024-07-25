<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/17/2024
  Time: 1:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Activity Detail</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .attendance-status {
            font-weight: bold;
            color: #4CAF50;
        }
        .attendance-status.absent {
            color: #f44336;
        }
        .attendance-status.not-yet {
            color: #ff9800;
        }
        .description {
            margin-top: 20px;
            padding: 15px;
            background-color: #e7f3fe;
            border-left: 5px solid #2196F3;
            color: #333;
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
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }

        // function logout() {
        //     // Add your logout logic here
        //     alert('Logged out');
        // }

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
    <div class="profile-container" >
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
<div class="container" style="margin-top: 20px">
    <h2>Activity Detail</h2>
    <table>
        <tr>
            <th>Date</th>
            <td>${requestScope.attendance.session.date}</td>
        </tr>
        <tr>
            <th>Slot</th>
            <td>${requestScope.attendance.session.slot.id}</td>
        </tr>
        <tr>
            <th>Student Group</th>
            <td><a href="groupDetail?id=${requestScope.attendance.session.group.id}">${requestScope.attendance.session.group.name}</a></td>
        </tr>
        <tr>
            <th>Instructor</th>
            <td>${requestScope.attendance.session.teacher.account.fullname}</td>
        </tr>
        <tr>
            <th>Course</th>
            <td>${requestScope.attendance.session.group.course.detail} (${requestScope.attendance.session.group.course.code})</td>
        </tr>
        <tr>
            <th>Attendance</th>
            <td>
                <c:if test="${requestScope.attendance.session.taken}">
                    <c:if test="${requestScope.attendance.present}">
                        <span class="attendance-status">Present</span>
                    </c:if>
                    <c:if test="${!requestScope.attendance.present}">
                        <span class="attendance-status absent">Absent</span>
                    </c:if>
                </c:if>
                <c:if test="${!requestScope.attendance.session.taken}">
                    <span class="attendance-status not-yet">Not Yet</span>
                </c:if>
            </td>
        </tr>
        <tr>
            <th>Record Time</th>
            <td>${requestScope.attendance.date}</td>
        </tr>
    </table>
<%--    <div class="description">--%>
<%--        ${requestScope.attendance.description}--%>
<%--    </div>--%>
</div>
</body>
</html>
