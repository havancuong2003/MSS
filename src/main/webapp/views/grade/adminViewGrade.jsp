<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/4/2024
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        input[type="text"], input[type="hidden"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #007bff;
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background: #fff;
            margin: 5px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-left: 4px solid #007bff;
            transition: background 0.3s;
        }

        ul li a {
            text-decoration: none;
            color: #007bff;
        }

        ul li:hover {
            background: #f0f0f5;
        }

        ul li a:hover {
            text-decoration: underline;
        }

        #studentGrade, #teacherGrade {
            background: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        #gradesTableContainer {
            overflow-x: auto;
        }

        input[type="button"], button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="button"]:hover, button:hover {
            background-color: #0056b3;
        }

        #teacherGrade table, #teacherGrade th, #teacherGrade td {
            text-align: center;
            vertical-align: middle;
        }

        #teacherGrade input[type="text"] {
            text-align: center;
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

        .total-row {
            font-weight: bold;
            /*background-color: #e3f2fd;*/
            /*color: #0d47a1;*/
        }

        .total-row td {
            padding: 10px;
            border: 1px solid #dee2e6;
        }

        .total-label {
            text-align: left;
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
<nav class="navbar navbar-expand-lg header">
    <button class="btn btn-light"
            onclick="window.location.href='<%=request.getContextPath()%>/${requestScope.role}/dashboard';">
        <i class="fas fa-arrow-left"></i> Home
    </button>

    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" aria-haspopup="true"
                    aria-expanded="false">
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
<input type="text" name="search" id="search" placeholder="Enter id or name of user..." oninput="getSearch()"/>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Role</th>
        <th>Action</th>
    </tr>
    <tbody id="searchTable">

    </tbody>
</table>
<h1>Semester List</h1>
<ul id="semesterList">

</ul>
<input type="hidden" id="semesterId" name="semesterId" value="">
<h2>Group List</h2>
<div id="groupsList">
</div>
<input type="hidden" id="gid" name="gid" value="">
<div id="studentGrade" style="display:none;">
    <table>
        <thead>
        <tr>
            <th>Category</th>
            <th>Grade Item</th>
            <th>Weight</th>
            <th>Grade</th>
        </tr>
        </thead>
        <tbody id="gradesTableBody">
        <!-- Bảng điểm sẽ được điền vào đây -->
        </tbody>
    </table>
</div>
<div id="teacherGrade" style="display:none;">
    <form id="gradesForm">
        <div id="gradesTableContainer">
            <table id="gradesTable">
                <!-- Grades table will be populated here -->
            </table>
        </div>
    </form>
</div>
<jsp:include page="../common/footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function getSearch() {
        const search = document.getElementById("search").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadSearchGrade",
            type: "GET",
            dataType: "JSON",
            data: {
                search: search
            },
            success: function (data) {
                console.log(data.role);
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
        getGrade();
    }

    function getSemester() {
        const search = document.getElementById("search").value;
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/loadSearchGrade",
                type: "GET",
                dataType: "JSON",
                data: {
                    search: search
                },
                success: function (data) {
                    var semester = data.semester;
                    var list = document.getElementById("semesterList");
                    list.innerHTML = "";
                    semester.forEach(function (s) {
                        list.innerHTML += '<li><a href="javascript:setSemesterId(' + s.id + ')" >' + s.detail + '</a></li>';
                    });
                }
            }
        )
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

    function getGrade() {
        const search = document.getElementById("search").value;
        const ses = document.getElementById("semesterId").value;
        const gid = document.getElementById("gid").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadSearchGrade",
            type: "GET",
            dataType: "JSON",
            data: {
                sesid: ses,
                gid: gid,
                search: search
            },
            success: function (data) {
                var marks = data.marks;
                var total = data.total;
                console.log(marks);
                if (data.role === "student") {
                    displayGrades(marks, total);
                } else {
                    generateTable(marks);
                }
            }
        });
    }

    function displayGrades(marks, total) {
        var tableBody = document.getElementById("gradesTableBody");
        tableBody.innerHTML = "";

        var lastCategoryId = null;
        marks.forEach(function (record, index) {
            var row = document.createElement("tr");

            // Kiểm tra nếu category id khác với category id cuối cùng
            if (lastCategoryId !== record.gradeItem.category.id) {
                var categoryCell = document.createElement("td");
                categoryCell.rowSpan = marks.filter(item => item.gradeItem.category.id === record.gradeItem.category.id).length;
                categoryCell.textContent = record.gradeItem.category.categoryName;
                row.appendChild(categoryCell);
                lastCategoryId = record.gradeItem.category.id;
            }

            var itemCell = document.createElement("td");
            itemCell.textContent = record.gradeItem.item;
            row.appendChild(itemCell);

            var weightCell = document.createElement("td");
            weightCell.textContent = record.gradeItem.weight + "%";
            row.appendChild(weightCell);

            var gradeCell = document.createElement("td");
            gradeCell.textContent = record.grade;
            row.appendChild(gradeCell);

            tableBody.appendChild(row);

        });
        // Thêm hàng tổng kết vào bảng
        var totalRow = document.createElement("tr");
        totalRow.className = "total-row";

        var totalLabelCell = document.createElement("td");
        totalLabelCell.colSpan = 1;
        totalLabelCell.textContent = "Summary";
        totalLabelCell.className = "total-label";
        totalRow.appendChild(totalLabelCell);

        var averageMarkCell = document.createElement("td");
        averageMarkCell.textContent = "Average Mark: " + total.avarage_mark;
        totalRow.appendChild(averageMarkCell);

        var reasonCell = document.createElement("td");
        reasonCell.textContent = "Reason: " + total.reason;
        totalRow.appendChild(reasonCell);

        var statusCell = document.createElement("td");
        statusCell.textContent = "Status: " + (total.pass ? "Passed" : "Failed");
        totalRow.appendChild(statusCell);

        tableBody.appendChild(totalRow);
    }

    function generateTable(marks) {
        // Group grade items by category
        var categories = {};
        var gid = document.getElementById("gid").value;
        marks.forEach(function (mark) {
            var category = mark.gradeItem.category.categoryName;
            if (!categories[category]) {
                categories[category] = [];
            }
            if (!categories[category].some(item => item.item === mark.gradeItem.item)) {
                categories[category].push({
                    item: mark.gradeItem.item,
                    weight: mark.gradeItem.weight
                });
            }
        });

        // Create table header
        var tableHeader = '<tr><th>Student ID</th><th>Student Name</th>';
        for (var category in categories) {
            tableHeader += '<th colspan="' + categories[category].length + '">' + category + '</th>';
        }
        tableHeader += '</tr><tr><th></th><th></th>';
        for (var category in categories) {
            categories[category].forEach(function (gradeItem) {
                tableHeader += '<th>' + gradeItem.item + ' (' + gradeItem.weight + '%)</th>';
            });
        }
        tableHeader += '</tr>';

        // Create table body
        var tableBody = '';
        var students = {};
        marks.forEach(function (mark) {
            if (!students[mark.student.id]) {
                students[mark.student.id] = {
                    fullname: mark.student.account.fullname,
                    grades: {}
                };
            }
            students[mark.student.id].grades[mark.gradeItem.item] = mark.grade;
        });

        for (var studentId in students) {
            tableBody += '<tr><td>' + studentId + '</td><td>' + students[studentId].fullname + '</td>';
            for (var category in categories) {
                categories[category].forEach(function (gradeItem) {
                    var grade = students[studentId].grades[gradeItem.item];
                    grade = (grade === 0 || grade) ? grade : '';
                    tableBody += '<td><input type="text" name="marks-' + studentId + '-' + gradeItem.item + '-' + gid + '" value="' + grade + '" disabled></td>';
                });
            }
            tableBody += '</tr>';
        }

        // Insert table header and body into the table
        document.getElementById('gradesTable').innerHTML = '<thead>' + tableHeader + '</thead><tbody>' + tableBody + '</tbody>';
    }
</script>
</body>
</html>
