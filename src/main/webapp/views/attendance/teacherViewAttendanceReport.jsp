<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/8/2024
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Attendance Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 2.5em;
        }
        h2 {
            color: #2980b9;
            margin-bottom: 15px;
            border-bottom: 2px solid #2980b9;
            padding-bottom: 10px;
            font-size: 1.8em;
        }
        .list-container {
            margin-bottom: 30px;
        }
        .list-group {
            list-style: none;
            padding: 0;
        }
        .list-group li {
            margin-bottom: 10px;
        }
        .list-group a {
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
            font-size: 1.1em;
        }
        .list-group a:hover {
            text-decoration: underline;
        }
        .report-container {
            margin-top: 30px;
        }
        #attendanceTable {
            width: 100%;
            border-collapse: collapse;
        }
        #attendanceTable th, #attendanceTable td {
            padding: 15px;
            text-align: center;
        }
        #attendanceTable th {
            background-color: #3498db;
            color: #ffffff;
            font-size: 1.1em;
        }
        #attendanceTable td {
            border: 1px solid #ddd;
            font-size: 1em;
        }
        #attendanceTable tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        #attendanceTable tr:hover {
            background-color: #eaf0f8;
        }
        .legend {
            margin-top: 20px;
            font-size: 1.1em;
        }
        .legend p {
            margin: 5px 0;
        }
        .legend span {
            font-weight: bold;
            font-size: 1.2em;
        }
        .present {
            color: #27ae60; /* Màu xanh lá cho trạng thái Present */
        }
        .absent {
            color: #e74c3c; /* Màu đỏ cho trạng thái Absent */
        }
        .not-yet {
            color: #f39c12; /* Màu vàng cho trạng thái Not Yet */
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
<div class="container">
    <h1>Attendance Report</h1>
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
    <div class="report-container" style="display: none;">
        <h2>Attendance Report</h2>
        <table id="attendanceTable">
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
            url: "${pageContext.request.contextPath}/teacher/attendancereport",
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
            url: "${pageContext.request.contextPath}/teacher/attendancereport",
            type: "POST",
            dataType: "JSON",
            data: { sesid: ses, gid: group },
            success: function (data) {
                const students = data.students;
                const sessions = new Set(); // Để lưu trữ các session unique

                // Thu thập tất cả các session khác nhau với định dạng: date-slotId
                students.forEach(student => {
                    student.attendances.forEach(attendance => {
                        sessions.add(attendance.session.date + '-' + attendance.session.slot.id);
                    });
                });

                // Tạo bảng với các session và trạng thái điểm danh
                let tableHtml = '<thead><tr><th>Session</th>';
                students.forEach(student => {
                    tableHtml += '<th>' + student.account.fullname + '</th>';
                });
                tableHtml += '</tr></thead><tbody>';

                // Tạo hàng cho mỗi session
                Array.from(sessions).forEach(sessionIdentifier => {
                    const [date, slotId] = sessionIdentifier.split('-');
                    let sessionTaken = false;

                    // Kiểm tra xem session đó đã được taken hay chưa
                    for (let student of students) {
                        for (let attendance of student.attendances) {
                            if (attendance.session.date === date && attendance.session.slot.id == slotId) {
                                sessionTaken = attendance.session.taken;
                                break;
                            }
                        }
                        if (sessionTaken) break;
                    }

                    // Tạo hàng cho session
                    tableHtml += '<tr><td>' + new Date(date).toLocaleDateString('en-GB') + ' (Slot ' + slotId + ')</td>';

                    students.forEach(student => {
                        let status = 'N'; // Mặc định là Not Yet
                        student.attendances.forEach(attendance => {
                            if (attendance.session.date === date && attendance.session.slot.id == slotId) {
                                status = sessionTaken ? (attendance.present ? 'P' : 'A') : 'N';
                            }
                        });

                        // Xác định class cho trạng thái điểm danh
                        var className;
                        if (status === 'P') {
                            className = 'present';
                        } else if (status === 'A') {
                            className = 'absent';
                        } else {
                            className = 'not-yet';
                        }

                        tableHtml += '<td class="' + className + '">' + status + '</td>';
                    });

                    tableHtml += '</tr>';
                });

                tableHtml += '</tbody>';
                document.getElementById('attendanceTable').innerHTML = tableHtml;
            }
        });
    }
</script>
</body>
</html>
