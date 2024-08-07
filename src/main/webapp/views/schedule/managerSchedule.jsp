<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/17/2024
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Schedule</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .table th, .table td {
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-view {
            background-color: #007bff;
            color: #fff;
        }
        .btn-view:hover {
            background-color: #0056b3;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            color: #333;
            font-size: 2rem;
            font-weight: 700;
            margin: 0;
            padding: 20px;
            text-align: center; /* add this to center the text */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        select {
            width: 50%; /* reduce the width of the select box */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="hidden"] {
            display: none;
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
        .header {
            background-color: #fff;
            box-shadow: none;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }

        .dropdown-menu {
            min-width: 150px;
            display: none; /* Ẩn menu dropdown mặc định */
        }
        .dropdown-menu.show {
            display: block; /* Hiện menu khi có lớp 'show' */
        }
        nav {
            margin-bottom: 50px;
        }
        * {
            margin: 0;
            padding: 0;
            color: #000;
        }


        footer {
            width: 100%;
            margin-top: 100px;
        }

        h3 {
            font-size: 25px;
        }

        .footer-container {
            position: relative;
            bottom: 0;
            background: #E8E8E8;
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            padding: 15px 0;
        }

        .left-area ul {
            display: flex;
            justify-content: space-between;
            margin-top: 10px
        }

        .center-area, .right-area, .left-area {
            height: 50%;
            margin-bottom: 10px;
        }


        .center-area a {
            position: relative;
            text-decoration: none;
            color: #333;

        }

        .center-area a::after {
            content: "";

            width: 100%;
            height: 2px;
            left: 0;
            bottom: -5px;
            background-color: #495464;
            border-radius: 40px;
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .center-area a:hover::after {
            transform-origin: center;
            transform: scaleX(1);
        }


        .center-area a, .right-area li {
            font-size: 20px;
            padding: 5px 0;
        }

        .center-area li, .right-area li {
            padding: 5px;
        }

        ul {
            list-style-type: none;
        }

        a {
            text-decoration: none;
        }


        .text {
            width: 100%;
            height: 50px;
            background-color: #535C5F;
            color: #FFFCEB;
            margin-top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left-area i:hover {
            color: rgb(205, 127, 50);
            transition: 0.3s;
        }

        @media screen and (max-width: 576px) {
            .footer-container {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }

            h3 {
                font-size: 18px;
            }

            a, li {
                font-size: 14px;
            }

            .center-area a, .right-area li {
                font-size: 18px;
            }

            ul {
                margin-bottom: 14px;
            }
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
<nav class="navbar navbar-expand-lg header">
    <button class="btn btn-light" onclick="window.location.href='<%=request.getContextPath()%>/${requestScope.role}/dashboard';">
        <i class="fas fa-arrow-left"></i> Home
    </button>

    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                Profile
            </button>
            <div class="dropdown-menu" id="dropdownMenu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="setting">Setting</a>
                <a class="dropdown-item" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
<script>
    document.getElementById('dropdownMenuButton').addEventListener('click', function () {
        var menu = document.getElementById('dropdownMenu');
        if (menu) {
            menu.classList.toggle('show');
        }
    });

    // Đóng menu nếu nhấp ra ngoài
    document.addEventListener('click', function (event) {
        var menu = document.getElementById('dropdownMenu');
        if (menu && !menu.contains(event.target) && !document.getElementById('dropdownMenuButton').contains(event.target)) {
            menu.classList.remove('show');
        }
    });
</script>
<div class="container mb-4" style="margin-top: 20px">
    <div class="form-group row">
        <label for="search" class="col-sm-2 col-form-label">Search:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="search" id="search" oninput="searchTeacher()"
            placeholder="Enter teacher name or teacher code">
        </div>
    </div>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>Teacher ID</th>
            <th>Teacher Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="searchTableBody">
        <!-- Results will be appended here -->
        </tbody>
    </table>
    <input type="hidden" id="teacherId" name="teacherId">
</div>

<div class="container">
    <h1>Teacher Schedule</h1>
    <form id="weekForm" action="processDates" method="post">
        <div class="form-group">
            <label for="weekSelect">Select Week:</label>
            <select id="weekSelect" name="weekSelect" class="form-control" onchange="updateDates()">
                <option value="" disabled selected>Select Week</option>
                <!-- Weeks will be added here by JavaScript -->
            </select>
        </div>
        <input type="hidden" id="startDate" name="startDate">
        <input type="hidden" id="endDate" name="endDate">
        <input type="hidden" id="daysInWeek" name="daysInWeek">
    </form>
    <table id="weekTable" class="table table-bordered">
        <thead>
        <tr id="weekDaysHeader">
            <th></th>
            <!-- Days of the week will be added here by JavaScript -->
        </tr>
        </thead>
        <tbody id="weekTableBody">
        <!-- Table content will be loaded here by AJAX -->
        </tbody>
    </table>
    <div>
        <jsp:include page="../admin/changeSessionTeacher/changeTeacherSession.jsp" />
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function searchTeacher() {
        var search = document.getElementById("search").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/manager/schedule",
            type: "POST",
            data: {
                "search": search
            },
            success: function (data) {
                var teachers = data;
                var bodyTable = $("#searchTableBody");
                bodyTable.html("");
                var htmlValue = '';
                teachers.forEach(function (teacher) {
                    htmlValue += '<tr>';
                    htmlValue += '<td>' + teacher.tid + '</td>';
                    htmlValue += '<td>' + teacher.account.fullname + '</td>';
                    htmlValue += '<td><button type="button" class="btn btn-view" onclick="viewTeacherSchedule(\'' + teacher.tid + '\')">View</button></td>';
                    htmlValue += '</tr>';
                });
                bodyTable.html(htmlValue);
            }
        });
    }

    function viewTeacherSchedule(teacherId) {
        document.getElementById("teacherId").value = teacherId;
        updateDates();
    }

    function getWeeksInYear(year) {
        const weeks = [];
        let date = new Date(year, 0, 1);
        while (date.getDay() !== 1) {
            date.setDate(date.getDate() + 1);
        }
        while (date.getFullYear() === year) {
            let startOfWeek = new Date(date.getTime());
            let endOfWeek = new Date(date.getTime());
            endOfWeek.setDate(endOfWeek.getDate() + 6);
            if (endOfWeek.getFullYear() === year || (endOfWeek.getFullYear() > year && endOfWeek.getMonth() === 0)) {
                weeks.push({
                    start: formatDate(startOfWeek),
                    end: formatDate(endOfWeek)
                });
            }
            date.setDate(date.getDate() + 7);
        }
        return weeks;
    }

    function formatDate(date) {
        let d = date.getDate();
        let m = date.getMonth() + 1; // Months are zero-based
        let y = date.getFullYear();
        return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);
    }

    function populateWeeks() {
        const weekSelect = document.getElementById('weekSelect');
        const currentYear = new Date().getFullYear();
        const weeks = getWeeksInYear(currentYear);

        weeks.forEach(week => {
            const option = document.createElement('option');
            option.value = week.start + ',' + week.end;
            option.text = week.start + ' - ' + week.end;
            weekSelect.add(option);
        });

        // Set current week as default
        const today = new Date();
        const currentWeek = weeks.find(week => {
            const start = new Date(week.start);
            const end = new Date(week.end);
            return today >= start && today <= end;
        });

        if (currentWeek) {
            weekSelect.value = currentWeek.start + ',' + currentWeek.end;
            updateDates();
        }
    }

    function updateDates() {
        const weekSelect = document.getElementById('weekSelect');
        const selectedValue = weekSelect.value;
        if (selectedValue) {
            const dates = selectedValue.split(',');
            const startDate = new Date(dates[0]);
            const endDate = new Date(dates[1]);
            document.getElementById('startDate').value = dates[0];
            document.getElementById('endDate').value = dates[1];
            document.getElementById('daysInWeek').value = getDaysInWeek(startDate, endDate);
            updateWeekDaysHeader(startDate, endDate);
        }
        const days = document.getElementById('daysInWeek').value;
        const fday = document.getElementById('startDate').value;
        const lday = document.getElementById('endDate').value;
        const teacherId = document.getElementById('teacherId').value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadManagerSchedule",
            type: "GET",
            dataType: "JSON",
            data: {
                days: days,
                fday: fday,
                lday: lday,
                teacherId: teacherId
            },
            success: function (data) {
                var sessions = data.sessions;
                var slots = data.slots;
                var date = data.date;
                var bodyTable = $("#weekTableBody");
                bodyTable.html("");
                var htmlValue = '';
                slots.forEach(function (slot) {
                    htmlValue += "<tr><td>Slot " + slot.id + "<br>" + slot.startTime + " - " + slot.endTime + "</td>";
                    date.forEach(function (d) {
                        htmlValue += "<td>";
                        sessions.forEach(function (session) {
                            if (session.slot.id === slot.id && session.date === d) {
                                htmlValue += "" + session.group.name + " - " + session.group.course.code + " - " + session.room.detail + "<br>";
                                htmlValue += "<form action='viewManagerAttendance' method='GET'>";
                                htmlValue += "<input type='hidden' name='sesid' value='" + session.id + "'>";
                                    htmlValue += "<input type='submit' value='View' class='btn btn-warning'>";
                                htmlValue += "</form>";
                            }
                        });
                        htmlValue += "</td>";
                    })
                    htmlValue += "</tr>";
                })
                bodyTable.html(htmlValue);
            }
        });
    }

    function getDaysInWeek(startDate, endDate) {
        let dates = [];
        let currentDate = new Date(startDate);
        while (currentDate <= endDate) {
            dates.push(formatDate(currentDate));
            currentDate.setDate(currentDate.getDate() + 1);
        }
        return dates.join(',');
    }

    function updateWeekDaysHeader(startDate, endDate) {
        const weekDaysHeader = document.getElementById('weekDaysHeader');
        weekDaysHeader.innerHTML = '';
        const ts = document.createElement('th');
        weekDaysHeader.appendChild(ts);
        let currentDate = new Date(startDate);
        while (currentDate <= endDate) {
            const th = document.createElement('th');
            th.textContent = formatDate(currentDate);
            weekDaysHeader.appendChild(th);
            currentDate.setDate(currentDate.getDate() + 1);
        }
    }

    // Populate weeks on page load
    window.onload = populateWeeks;
</script>
<footer>
    <section class="footer-container">
        <div class="left-area">
            <h3>FOLLOW US</h3>
            <ul>
                <li><a href="">
                    <i class="fa-brands fa-square-instagram fa-2x"></i>
                </a></li>
                <li><a href="">
                    <i class="fa-brands fa-square-facebook fa-2x"></i>
                </a></li>
                <li><a href="">
                    <i class="fa-brands fa-linkedin fa-2x"></i>
                </a></li>
                <li><a href="">
                    <i class="fa-brands fa-x-twitter fa-2x"></i>
                </a></li>
            </ul>
        </div>

        <div class="right-area">
            <h3>CONTACT</h3>
            <ul>
                <li>Address: 123 FPT University Ha Noi</li>
                <li><a href="#">Mail: mss@fpt.edu.vn</a></li>
                <li><a href="#">Phone: 0123456789</a></li>
            </ul>
        </div>
    </section>

</footer>
</body>
</html>
