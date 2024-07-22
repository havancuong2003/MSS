<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/12/2024
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Attendance Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            color: #0056b3;
            text-align: center;
        }

        h1 {
            margin-bottom: 0.5em;
        }

        h2 {
            margin-top: 1em;
            margin-bottom: 0.5em;
            color: #007bff;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .search-form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-form input[type="text"] {
            width: 100%;
            max-width: 400px;
            padding: 10px;
            border: 2px solid #007bff;
            border-radius: 4px;
            font-size: 16px;
        }

        .search-form button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-form button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f0f0f0;
            color: #0056b3;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul li {
            margin-bottom: 10px;
        }

        ul li a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            padding: 10px;
            border-radius: 4px;
            background-color: #f0f8ff;
            transition: background-color 0.3s ease;
        }

        li a:hover {
            background-color: #e6f0ff;
        }

        li a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            padding: 10px;
            border-radius: 4px;
            background-color: #f0f8ff;
            transition: background-color 0.3s ease;
            margin-bottom: 10px;
        }

        ul li a:hover {
            background-color: #e6f0ff;
        }

        .legend {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .legend p {
            margin: 0;
            font-size: 16px;
            color: #555;
        }

        .legend span {
            font-weight: bold;
            padding: 5px;
        }

        .not-yet {
            color: yellow;
        }

        .absent {
            color: red;
        }

        .present {
            color: green;
        }



        .report-container table {
            margin-top: 20px;
        }

        .report-container table th {
            background-color: #007bff;
            color: #fff;
        }

        .report-container table td {
            text-align: center;
        }

        .status-cell {
            padding: 10px;
            border-radius: 4px;
            /*color: #fff;*/
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
    <div class="search-form">
        <input type="text" name="search" id="search" placeholder="Enter id or name of user..." oninput="getSearch()"/>
        <button type="button" onclick="getSearch()">Search</button>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="searchTable">
        <!-- Search results will be populated here -->
        </tbody>
    </table>
    <h2>Semester List</h2>
    <ul id="semesterList">
        <!-- Semester list will be populated here -->
    </ul>
    <input type="hidden" id="semesterId" name="semesterId" value="">
    <h2>Group List</h2>
    <ul id="groupsList">
        <!-- Group list will be populated here -->
    </ul>
    <input type="hidden" id="gid" name="gid" value="">
    <div id="studentGrade" style="display: none">
        <h2>Attendance Report</h2>
        <table id="studentAttendanceTable">
            <thead>
            <tr>
                <th>Slot ID</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <!-- Student attendance data will be populated here -->
            </tbody>
        </table>
    </div>
    <div id="teacherGrade" style="display: none">
        <h2>Attendance Report</h2>
        <table id="TeacherAttendanceTable">
            <!-- Teacher attendance data will be populated here -->
        </table>
    </div>
    <div class="legend">
        <p><span class="not-yet">N</span> - Not Yet</p>
        <p><span class="absent">A</span> - Absent</p>
        <p><span class="present">P</span> - Present</p>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function getSearch() {
        const search = document.getElementById("search").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadSearchGrade",
            type: "GET",
            dataType: "JSON",
            data: { search: search },
            success: function (data) {
                var studentGradeDiv = document.getElementById("studentGrade");
                var teacherGradeDiv = document.getElementById("teacherGrade");
                if (data.role === "student") {
                    studentGradeDiv.style.display = "block";
                    teacherGradeDiv.style.display = "none";
                    var student = data.student;
                    var body = document.getElementById("searchTable");
                    body.innerHTML = "";
                    var htmlValue = '';
                    htmlValue += '<tr>';
                    htmlValue += '<td>' + student.id + '</td>';
                    htmlValue += '<td>' + student.account.fullname + '</td>';
                    htmlValue += '<td>Student</td>';
                    htmlValue += '<td><button type="button" onclick="getSemester()">View</button></td>';
                    htmlValue += '</tr>';
                    body.innerHTML = htmlValue;
                } else if (data.role === "teacher") {
                    studentGradeDiv.style.display = "none";
                    teacherGradeDiv.style.display = "block";
                    var teacher = data.teacher;
                    var body = document.getElementById("searchTable");
                    body.innerHTML = "";
                    var htmlValue = '';
                    htmlValue += '<tr>';
                    htmlValue += '<td>' + teacher.tid + '</td>';
                    htmlValue += '<td>' + teacher.account.fullname + '</td>';
                    htmlValue += '<td>Teacher</td>';
                    htmlValue += '<td><button type="button" onclick="getSemester()">View</button></td>';
                    htmlValue += '</tr>';
                    body.innerHTML = htmlValue;
                } else {
                    studentGradeDiv.style.display = "none";
                    teacherGradeDiv.style.display = "none";
                }
            }
        })
    }

    function setSemesterId(id) {
        document.getElementById("semesterId").value = id;
        getGroup();
    }

    function setGroupId(id) {
        document.getElementById("gid").value = id;
        getReports();
    }

    function getSemester() {
        const search = document.getElementById("search").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadSearchGrade",
            type: "GET",
            dataType: "JSON",
            data: { search: search },
            success: function (data) {
                var semester = data.semester;
                var list = document.getElementById("semesterList");
                list.innerHTML = "";
                semester.forEach(function (s) {
                    list.innerHTML += '<li><a href="javascript:setSemesterId(' + s.id + ')" >' + s.detail + '</a></li>';
                });
            }
        })
    }

    function getGroup() {
        const search = document.getElementById("search").value;
        const ses = document.getElementById("semesterId").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadSearchGrade",
            type: "GET",
            dataType: "JSON",
            data: {
                sesid: ses,
                search: search
            },
            success: function (data) {
                var groups = data.groups;
                var list = document.getElementById("groupsList");
                list.innerHTML = "";
                groups.forEach(function (group) {
                    list.innerHTML += '<li><a href="javascript:setGroupId(' + group.id + ')" >' + group.course.code + ' - ' + group.course.detail + ' - ' + group.name + '</a></li>';
                });
            }
        });
    }

    function getReports() {
        const search = document.getElementById("search").value;
        const ses = document.getElementById("semesterId").value;
        const gid = document.getElementById("gid").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/manager/viewattendancereport",
            type: "POST",
            dataType: "JSON",
            data: {
                sesid: ses,
                gid: gid,
                search: search
            },
            success: function (data) {
                if (data.role === "student") {
                    var attendances = data.attendances;
                    getStudentAttendance(attendances);
                } else {
                    var students = data.students;
                    getTeacherAttendance(students);
                }
            }
        });
    }

    function getTeacherAttendance(students) {
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
                    className = 'present status-cell';
                } else if (status === 'A') {
                    className = 'absent status-cell';
                } else {
                    className = 'not-yet status-cell';
                }

                tableHtml += '<td class="' + className + '">' + status + '</td>';
            });

            tableHtml += '</tr>';
        });

        tableHtml += '</tbody>';
        document.getElementById('TeacherAttendanceTable').innerHTML = tableHtml;
    }

    function getStudentAttendance(attendances) {
        const tableBody = document.querySelector("#studentAttendanceTable tbody");
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
</script>
</body>
</html>
