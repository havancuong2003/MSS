<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/17/2024
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>

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
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        thead {
            background-color: #343a40;
            color: #ffffff;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            /*background-color: #f1f1f1;*/
        }
        .form-check-inline {
            display: flex;
            align-items: center;
        }
        .form-check-label {
            margin-right: 15px;
            margin-left: 5px;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            margin: 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #e9ecef;
            color: #6c757d;
        }
        input[type="radio"] {
            margin-left: 10px;
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
<div class="container">
    <h2>Attendance</h2>
    <form action="takeAttendance" method="post">
        <input type="hidden" name="sesid" value="${requestScope.sesid}">
        <table>
            <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Attendance</th>
                <th>Description</th>
                <th>Time</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.attendances}" var="a">
                <tr>
                    <td>${a.student.id}</td>
                    <td>${a.student.account.fullname}</td>
                    <td>
                        <div class="form-check-inline">
                            <input type="radio" id="present_yes_${a.student.id}" name="present${a.student.id}" disabled
                                   value="yes"
                                   <c:if test="${a.present}">checked</c:if> >
                            <label for="present_yes_${a.student.id}" class="form-check-label">Present</label>

                            <input type="radio" id="present_no_${a.student.id}" name="present${a.student.id}" value="no" disabled
                                   <c:if test="${!a.present}">checked</c:if> >
                            <label for="present_no_${a.student.id}" class="form-check-label">Absent</label>
                        </div>
                    </td>
                    <td>
                        <input type="text" name="description${a.student.id}" value="${a.description}"
                               class="form-control" disabled>
                    </td>
                    <td>${a.date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>


</body>
</html>
