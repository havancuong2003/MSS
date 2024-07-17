<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/8/2024
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Attendance Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1, h2 {
            text-align: center;
            color: #444;
        }

        h1 {
            margin-top: 20px;
        }

        h2 {
            margin-top: 20px;
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            flex-wrap: wrap;
            padding: 20px;
            gap: 20px;
        }

        .list-container, .report-container {
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        .list-container ul, .group-container ul {
            list-style: none;
            padding: 0;
        }

        .list-container ul li, .group-container ul li {
            margin: 10px 0;
        }

        .list-container ul li a, .group-container ul li a {
            display: block;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            transition: background-color 0.3s;
            font-size: 16px;
            font-weight: bold;
            min-width: 100%; /* Đảm bảo nút bấm dài ra */
        }

        .list-container ul li a:hover, .group-container ul li a:hover {
            background-color: #0056b3;
        }

        .report-container {
            display: block;
        }

        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table thead {
            background-color: #007bff;
            color: #fff;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .not-yet {
            color: #ffcc00; /* Vàng */
        }

        .absent {
            color: #ff3333; /* Đỏ */
        }

        .present {
            color: #33cc33; /* Xanh lá */
        }

        .legend {
            width: 100%;
            margin: 20px 0;
            text-align: center;
        }

        .legend span {
            font-weight: bold;
        }

        .legend p {
            margin: 5px 0;
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
<%--    </style>--%>
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
<h1>Attendance Management System</h1>
<div class="container">
    <div class="list-container">
        <h2>Semester List</h2>
        <ul id="semesterList" class="list-group">
            <c:forEach items="${requestScope.semester}" var="s">
                <li>
                    <a href="javascript:setSemesterId(${s.id})">${s.detail}</a>
                </li>
            </c:forEach>
        </ul>
        <input type="hidden" id="semesterId" name="semesterId" value="">
    </div>
    <div class="list-container group-container">
        <h2>Group List</h2>
        <ul id="groupsList" class="list-group"></ul>
        <input type="hidden" id="gid" name="gid" value="">
    </div>
    <div class="report-container">
        <h2>Attendance Report</h2>
        <table id="attendanceTable">
            <thead>
            <tr>
                <th>Slot ID</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="legend">
            <p><span class="not-yet">N</span> - Not Yet</p>
            <p><span class="absent">A</span> - Absent</p>
            <p><span class="present">P</span> - Present</p>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function setSemesterId(id) {
        document.getElementById("semesterId").value = id;
        getGroup();
    }

    function setGroupId(id) {
        document.getElementById("gid").value = id;
        document.querySelector(".report-container").style.display = 'block';
        getAttendances();
    }

    function getGroup() {
        const ses = document.getElementById("semesterId").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/student/attendancereport",
            type: "POST",
            dataType: "JSON",
            data: {sesid: ses},
            success: function (data) {
                const groups = data.groups;
                const list = document.getElementById("groupsList");
                list.innerHTML = "";
                groups.forEach(group => {
                    list.innerHTML += '<li><a href="javascript:setGroupId(' + group.id + ')" >' + group.course.code + ' - ' + group.course.detail + ' - ' + group.name + '</a></li>';
                });
            }
        });
    }

    function getAttendances() {
        const ses = document.getElementById("semesterId").value;
        const group = document.getElementById("gid").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/student/attendancereport",
            type: "POST",
            dataType: "JSON",
            data: {sesid: ses, gid: group},
            success: function (data) {
                const attendances = data.attendances;
                const tableBody = document.querySelector("#attendanceTable tbody");
                tableBody.innerHTML = "";
                attendances.forEach(attendance => {
                    const row = document.createElement("tr");
                    const slotIdCell = document.createElement("td");
                    slotIdCell.textContent = attendance.session.slot.id;
                    const dateCell = document.createElement("td");
                    dateCell.textContent = new Date(attendance.session.date).toLocaleDateString("en-US", {
                        year: 'numeric',
                        month: 'short',
                        day: 'numeric'
                    });
                    const statusCell = document.createElement("td");

                    if (!attendance.session.taken) {
                        statusCell.textContent = "N";
                        statusCell.classList.add("not-yet");
                    } else if (attendance.present) {
                        statusCell.textContent = "P";
                        statusCell.classList.add("present");
                    } else {
                        statusCell.textContent = "A";
                        statusCell.classList.add("absent");
                    }

                    row.appendChild(slotIdCell);
                    row.appendChild(dateCell);
                    row.appendChild(statusCell);
                    tableBody.appendChild(row);
                });
            }
        });
    }
</script>
</body>
</html>
