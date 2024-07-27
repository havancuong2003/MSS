<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }   html, body {
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

        /* CSS Styles for Modal */
        .modal {
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
            width: 50%;
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
            <li><a href="groupList"><i class="fas fa-chalkboard-teacher"></i> View All Classes</a></li>
            <li><a href="RegisterCourse"><i class="fas fa-book"></i> Register Course</a></li>
            <li><a href="viewCurriculum"><i class="fas fa-graduation-cap"></i> View Curriculum</a></li>
            <li><a href="send-application"><i class="fas fa-paper-plane"></i> Send application</a></li>
            <li><a href="changeGroup"><i class="fas fa-exchange-alt"></i> Swap Class</a></li>
            <li><a href="#" onclick="showModal('scheduleModal')"><i class="fas fa-calendar-alt"></i> Education</a></li>
        </ul>
    </nav>
</div>
<!-- Modal for Education -->
<div id="scheduleModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('scheduleModal')">&times;</span>
        <h2>Education</h2>
        <div class="modal-buttons">
            <a href="schedule">View Schedule</a>
            <a href="attendancereport">View Attendance Report</a>
            <a href="viewgrade">View Grades Report</a>

        </div>
    </div>
</div>
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
<jsp:include page="../common/footer.jsp" />
</body>
</html>


