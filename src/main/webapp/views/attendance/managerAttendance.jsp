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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/app-ajax.js"></script>
    <!-- Custom CSS -->
    <style>
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
            /*color: white;*/
        }
        th{
            color: white;
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
<div class="container">
    <h2>Attendance</h2>
    <form action="<%=request.getContextPath()%>/manager/viewManagerAttendance" method="post">
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
                            <input type="radio" id="present_yes_${a.student.id}" name="present${a.student.id}"
                                   value="yes"
                                   <c:if test="${a.present}">checked</c:if> >
                            <label for="present_yes_${a.student.id}" class="form-check-label">Present</label>

                            <input type="radio" id="present_no_${a.student.id}" name="present${a.student.id}" value="no"
                                   <c:if test="${!a.present}">checked</c:if> >
                            <label for="present_no_${a.student.id}" class="form-check-label">Absent</label>
                        </div>
                    </td>
                    <td>
                        <input type="text" name="description${a.student.id}" value="${a.description}"
                               class="form-control" >
                    </td>
                    <td>${a.date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button type="submit" class="btn btn-primary" >Submit</button>${requestScope.ms}

    </form>
</div>
<jsp:include page="../common/footer.jsp" />

</body>
</html>
