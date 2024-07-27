<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <!-- Thêm Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;

        }
        html, body {
            height: 100%;
            margin: 0;
        }

        .container-feedback {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-height: calc(100vh - 450px);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        nav {
            margin-top: 30px;
            text-align: center;
        }

        ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
            margin: 0;
        }

        li {
            display: inline-block;
            margin: 0 10px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }


        .listFeature {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 10px;
            justify-content: center;
        }

        .listFeature ul {
            list-style-type: none;
            padding: 0;
        }

        .listFeature li {
            text-align: center;
            background-color: #f1f1f1;
            padding: 15px;
            border-radius: 5px;
            margin: 20px;
        }

        .listFeature li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .listFeature li a:hover {
            color: #007bff;
        }



        .welcome h2 {
            margin: 0;
            padding: 0;
        }


        .modal-body {
            padding: 20px;
        }

        #listGroup {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            background-color: #f8f9fa;
            color: #495057;
            margin-bottom: 10px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="none" stroke="gray" stroke-width=".5" d="M2 0L0 2h4z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px 10px;
        }

        #listGroup:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        /* CSS Styles for Modal */
        .modall {
            display: none; /* Ensure modal is hidden by default */
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5); /* Black w/ opacity */
            justify-content: center;
            align-items: center;

        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;

            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .modal-content h2 {
            margin-top: 0;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .modal-buttons a {
            display: block;
            padding: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .modal-buttons a:hover {
            background-color: #0056b3;
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
</head>
<body>
<h1 style="text-align: center">Hello ${account.fullname}</h1>
<nav class="navbar navbar-expand-lg header">


    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                Profile
            </button>
            <div class="dropdown-menu" id="dropdownMenu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="../load-profile">Setting</a>
                <a class="dropdown-item" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
<div class="container container-feedback">
    <nav>
        <ul class="listFeature">

            <li><a href="#" onclick="showModal('scheduleModal')"><i class="fas fa-calendar-alt"></i> Education</a></li>
            <li><a href="#manageExerciseModal" data-toggle="modal"><i class="fas fa-tasks"></i> Manage Exercise</a></li>
        </ul>
    </nav>
</div>

<!-- Modal for Education -->
<div id="scheduleModal" class="modall">
    <div class="modal-content">
        <span class="close" onclick="closeModal('scheduleModal')">&times;</span>
        <h2>Education</h2>
        <div class="modal-buttons">
            <a href="schedule"><i class="fas fa-calendar"></i> View Schedule</a>
            <a href="attendancereport"><i class="fas fa-check"></i> View Attendance Report</a>
            <a href="viewstudentgrade"><i class="fas fa-tasks"></i> View Grade Report</a>
            <a href="takegrade"><i class="fas fa-graduation-cap"></i> Take Grade</a>
        </div>
    </div>
</div>

<!-- Modal for Manage Exercise -->
<div class="modal fade" id="manageExerciseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Manage Exercise</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="create-exercise" method="get" onsubmit="return validateForm()">
                <div class="modal-body">
                    <!-- Nội dung modal -->
                    <input type="hidden" name="course_id" id="course_id" value="">
                    <select name="group_id" id="listGroup" onchange="updateCourseId()">
                        <option value="0" data-course-id="">Please choose class</option>
                        <c:forEach var="o" items="${listGroup}">
                            <option value="${o.id}" data-course-id="${o.course.id}">${o.name}</option>
                        </c:forEach>
                    </select>
                    <div id="error-message" style="color: red" class="error"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn" style="background-color: #FF6600; color: whitesmoke">Go to manage exercises</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>

<script>
    function updateCourseId() {
        var select = document.getElementById("listGroup");
        var selectedOption = select.options[select.selectedIndex];
        var courseId = selectedOption.getAttribute("data-course-id");
        console.log(courseId);
        document.getElementById("course_id").value = courseId;
    }
    function validateForm() {
        var select = document.getElementById("listGroup");
        var errorMessage = document.getElementById("error-message");
        if (select.value == "0") {
            errorMessage.textContent = "Please select a class";
            return false;
        }
        errorMessage.textContent = "";
        return true;
    }
</script>

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
<script>
    function showModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    // Close modal when clicking outside of it
    window.onclick = function(event) {
        if (event.target.classList.contains('modal')) {
            event.target.style.display = 'none';
        }
    };


</script>
</html>
