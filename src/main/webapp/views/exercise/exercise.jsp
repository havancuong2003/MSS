

<%--<jsp:include page="header.jsp" />--%>
<%--<jsp:include page="auth.jsp" />--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.Gson" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Exercise</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        #mess {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            color: #fff;
            text-align: center;
            width: 300px;
            margin: 20px auto;
            display: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-top: 15px; /* Điều chỉnh khoảng cách giữa các form-group */
        }
        .back-link {
            color: #FF6600;
            font-size: 15px;
            position: absolute;
            left: 0;
            top: 100px;
            /*top: 50%; !* Điều chỉnh giá trị này để căn giữa theo chiều dọc *!*/
            /*transform: translateY(-50%); !* Điều chỉnh để căn giữa theo chiều dọc *!*/
        }
        label {
            margin-bottom: 5px;
            font-weight: bold; /* Tùy chọn: làm đậm chữ cho label */
        }

        .form-control {
            margin-top: 5px; /* Điều chỉnh khoảng cách giữa label và input */
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px 0;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-container {
            display: flex;
            align-items: center;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 6px 12px;
            margin: 2px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-danger {
            color: #fff;
            background-color: #d9534f;
            border-color: #d43f3a;
        }

        .btn-warning {
            color: #fff;
            background-color: #f0ad4e;
            border-color: #eea236;
        }

        .btn i {
            margin-right: 5px;
        }
        .pagination-container {
            text-align: center;
            margin-top: 20px;
        }

        .pagination {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            margin: 0;
        }

        .pagination li {
            display: inline-block;
            margin: 0 2px;
        }

        .pagination li a {
            color: #FF6600;
            min-width: 30px;
            padding: 6px 12px;
            text-decoration: none;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 38px;
            box-sizing: border-box;
            transition: background-color 0.3s, color 0.3s;
        }

        .pagination li a:hover {
            background-color: #FF6600;
            color: #0056b3;
        }

        .pagination li.active a {
            background-color: #FF6600;
            color: white;
            border-color: #007bff;
        }

        .pagination li.disabled a {
            color: #ccc;
            cursor: not-allowed;
        }
        .custom-form-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            padding-right: 300px;
        }

        .custom-form {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 100%;
            max-width: 600px; /* Increase max-width for larger forms */
        }

        .custom-form select, .custom-form input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 80%; /* Increase width */
        }

        .custom-form button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 20%; /* Adjust width accordingly */
        }

        .custom-form button:hover {
            background-color: #0056b3;
        }
        .table tr th:first-child, .table tr td:first-child {
            width: 10%;
        }

        .table tr th:last-child, .table tr td:last-child {
            width: 15%;
        }

        .table tr th:nth-child(3), .table tr td:nth-child(3) {
            width: 15%;
        }
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        .back .bgimg {
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -1;
            top: 0;
            left: 0;
            object-fit: cover;
        }

        .container-fluid {
            padding-top: 50px;
        }

        .heading {
            color: #333;
            font-size: 2.5rem;
        }

        .btn-danger, .btn-primary {
            font-size: 1.5rem;
            padding: 10px 20px;
            margin: 10px;
        }

        .tbtn {
            width: 100%;
            text-align: center;
        }

        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .thead-dark th {
            background-color: #FF6600;
            color: #fff;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .jumbotron {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .text-right.heading {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 10px;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .row1 {
            margin-bottom: 20px;
        }

        .animated {
            transition: all 0.5s ease-in-out;
        }

        .slideInLeft {
            animation: slideInLeft 1s forwards;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .slideInRight {
            animation: slideInRight 1s forwards;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        .modal-dialog {
            max-width: 600px;
            margin: 1.75rem auto;
        }

        .modal-content {
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .card {
            border: none;
            border-radius: 8px;
        }

        .card-header {
            background-color: #FF6600;
            color: #fff;
            border-bottom: 2px solid #dee2e6;
            padding: 20px;
            text-align: center;
        }

        .card-header .custom-heading {
            margin: 0;
            font-size: 1.5rem;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: #fff;
        }

        .btn-success.bb:hover {
            background-color: #218838;
            border-color: #1e7e34;
            color: #fff;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .modal-header, .modal-body, .modal-footer {
            padding: 20px;
            border: none;
        }

        .modal-header {
            border-bottom: 1px solid #e9ecef;
        }

        .modal-footer {
            border-top: 1px solid #e9ecef;
            display: flex;
            justify-content: flex-end;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .modal-dialog {
                max-width: 100%;
                margin: 1rem;
            }

            .card-header, .card-body, .form-group, .btn {
                padding: 15px;
            }

            .form-control {
                font-size: 0.9rem;
            }

            .btn {
                font-size: 0.9rem;
                padding: 10px 15px;
            }
        }

        .card-body select {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ced4da;
            border-radius: 5px;
            margin-top: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card-body select:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .card-body select {
                font-size: 0.9rem;
                padding: 10px;
            }
        }

    </style>
</head>
<body>
<div class="back">
<%--    <img src="https://mega.com.vn/media/news/2707_background-pp-hoc-tap-lam-slide3.jpg" class="bgimg" type="jpg/jpeg">--%>
</div>

<div class="container-fluid text-center">
    <div class="row1">
        <div class="col-md-12">
<%--            <p class="text-right heading">--%>
<%--                <a class="btn btn-danger" href="Logout"><i--%>
<%--                        class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>--%>
<%--            </p>--%>
<%--            <h1>${mess}</h1>--%>
        </div>
    </div>
    <div class="row" style="margin-top: 15vh">
        <div>
            <a class="back-link" href="${pageContext.request.contextPath}/${role}/dashboard" style="color: #FF6600;font-size: 15px">
                <i class="fas fa-arrow-left"></i> Back to dashboard
            </a>
        </div>
        <div class="col animated slideInLeft">
            <a class="btn btn-primary tbtn" style="background-color: #FF6600" href="#createQuizModal" data-toggle="modal">
                <h1 class="q" style="text-align: center"><i class="fa fa-plus" aria-hidden="true"></i> Create Exercise</h1></a>
        </div>
        <div class="col animated slideInLeft">
            <a class="btn btn-primary tbtn" style="background-color: #FF6600" href="#randomQuizModal" data-toggle="modal">
                <h1 class="q"><i class="fa fa-plus" aria-hidden="true"></i> Random Exercise</h1></a>
        </div>
<%--        <div class="col animated slideInRight">--%>
<%--            <a class="btn btn-danger tbtn" href="#participateModal"--%>
<%--               data-toggle="modal">--%>
<%--                <h1 class="q">--%>
<%--                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>--%>
<%--                    Participate--%>
<%--                </h1>--%>
<%--            </a>--%>
<%--        </div>--%>
    </div>
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="custom-form-wrapper">
                    <form class="custom-form" action="create-exercise" method="get">
                        <input type="hidden" name="group_id" value="${group_id}">
                        <input type="hidden" name="course_id" value="${course_id}">
                        <select name="type_exercise">
                            <option value="0" ${type_exercise == "0" ? "selected" : ""} class="form-control">Choose all exercises</option>
                            <option value="1" ${type_exercise == "1" ? "selected" : ""}  class="form-control">Test</option>
                            <option value="2" ${type_exercise == "2" ? "selected" : ""} class="form-control">Pratice</option>
                        </select>
                        <button type="submit" class="custom-button" style="background-color: #FF6600">Select</button>
                    </form>
                </div>
                <div class="custom-form-wrapper">
                    <form class="custom-form" action="create-exercise" method="get">
                        <input type="hidden" name="group_id" value="${group_id}">
                        <input type="hidden" name="course_id" value="${course_id}">
                        <input type="text" placeholder="Search by exercise name..." name="search">
                        <button type="submit" class="custom-button" style="background-color: #FF6600">Search</button>
                    </form>
                </div>
                <div id="mess" style="display: none"></div>
                <table class="table table-hover table-light table-borderless"
                       style="width: 60%; margin: 0 auto;'">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">Exercise Name</th>
                        <th scope="col">Course</th>
                        <th scope="col">View</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <c:forEach var="o" items="${listExercise}">
                        <tbody>
                        <tr>
                            <td scope="row">${o.exerciseId}</td>
                            <td>${o.exerciseName}</td>
                            <td>${o.course.code}</td>
                            <td>
                                <a href="manage-question?exercise_id=${o.exerciseId}&group_id=${group_id}&course_id=${course_id}" class="btn">View</a>
                            </td>
                            <td>
                                <c:if test="${o.status == 0}">
                                    <h5 style="color: red">Closing</h5>
                                </c:if>
                                <c:if test="${o.status == 1}">
                                    <h5 style="color: green">Presenting</h5>
                                </c:if>
                            </td>
                            <td>
                                <div class="btn-container">
                                    <c:if test="${o.status == 0}">
                                        <a class="btn btn-danger" href="create-exercise?exercise_id=${o.exerciseId}&delete=1&group_id=${group_id}&course_id=${course_id}"  onclick="return confirm('Are you sure you want to delete this exercise?');"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
                                        <c:if test="${o.isRandom ==0}">
                                            <a class="btn btn-warning update-btn" href="#" data-exercise-id="${o.exerciseId}"  data-group-id="${o.group_id}" data-toggle="modal" data-target="#updateModalCreateQuiz"><i class="fa fa-pencil" aria-hidden="true"></i> Update</a>
                                        </c:if>
                                        <c:if test="${o.isRandom ==1}">
                                            <a class="btn btn-warning update-btn" href="#" data-exercise-id="${o.exerciseId}"  data-group-id="${o.group_id}" data-toggle="modal" data-target="#updateModalRandomQuiz"><i class="fa fa-pencil" aria-hidden="true"></i> Update</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${o.status == 1}">
                                        <a class="btn btn-danger" href="create-exercise?exercise_id=${o.exerciseId}&delete=1&group_id=${group_id}&course_id=${course_id}" onclick="return handleDeleteExercise(${o.status});">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                        </a>
                                        <c:if test="${o.isRandom == 0}">
                                            <a class="btn btn-warning update-btn" href="#" onclick="return handleUpdateExercise(${o.status});">
                                                <i class="fa fa-pencil" aria-hidden="true"></i> Update
                                            </a>
                                        </c:if>
                                        <c:if test="${o.isRandom == 1}">
                                            <a class="btn btn-warning update-btn" href="#" onclick="return handleUpdateExercise(${o.status});">
                                                <i class="fa fa-pencil" aria-hidden="true"></i> Update
                                            </a>
                                        </c:if>
                                    </c:if>

                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
                <div class="pagination-container">
                    <ul class="pagination">
                        <c:if test="${search != null}" >
                        <c:if test="${tag > 1}">
                        <li class="page-item"><a href="create-exercise?page=${tag-1}&group_id=${group_id}&course_id=${course_id}&search=${search}">Previous</a></li>
                        </c:if>
                        <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="create-exercise?page=${i}&group_id=${group_id}&course_id=${course_id}&search=${search}">${i}</a>
                        </li>
                        </c:forEach>
                        <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="create-exercise?page=${tag+1}&group_id=${group_id}&course_id=${course_id}&search=${search}" class="page-link">Next</a></li>
                        </c:if>
                        <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                        </c:if>
                        </c:if>

                        <c:if test="${search == null}" >
                        <c:if test="${tag > 1}">
                        <li class="page-item"><a href="create-exercise?page=${tag-1}&group_id=${group_id}&course_id=${course_id}&type_exercise=${type_exercise}">Previous</a></li>
                        </c:if>
                        <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="create-exercise?page=${i}&group_id=${group_id}&course_id=${course_id}&type_exercise=${type_exercise}">${i}</a>
                        </li>
                        </c:forEach>
                        <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="create-exercise?page=${tag+1}&group_id=${group_id}&course_id=${course_id}&type_exercise=${type_exercise}" class="page-link">Next</a></li>
                        </c:if>
                        <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                        </c:if>
                        </c:if>
                        <ul/>
                        <div/>
                </div>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    function showMessage(message) {
        var messageDiv = document.getElementById('mess');
        if (message) {
            messageDiv.textContent = message;
            messageDiv.style.backgroundColor = '#28a745'; // Thêm màu nền khi có thông báo
            messageDiv.style.display = 'block';

            // Ẩn thông báo sau 3 giây
            setTimeout(function() {
                messageDiv.style.display = 'none';
                messageDiv.style.backgroundColor = ''; // Loại bỏ màu nền khi ẩn thông báo
            }, 3000);
        } else {
            messageDiv.style.display = 'none';
            messageDiv.style.backgroundColor = ''; // Loại bỏ màu nền nếu không có thông báo
        }
    }

    // Gọi hàm showMessage với nội dung thông báo
    showMessage('${mess}');
</script>
<script>
    var exerciseNames = <%= request.getAttribute("exerciseNames") %>;
    function isValidInteger(value) {
        return /^-?\d+$/.test(value);
    }
    function isValidFloat(value) {
        return /^-?\d+(\.\d+)?$/.test(value);
    }
    function toggleGradeCategory() {
        gradeCategoryError.innerText = "";
    }
    function toggleUpdateGradeCategory() {
        updateGradeCategoryError.innerText = "";
    }
    function toggleUpdateRandomGradeCategory() {
        updateRandom_gradeCategoryError.innerText = "";
    }
    function toggleTypeExercise() {
        var exerciseType = document.getElementById('exerciseType');
        var gradeCategory = document.getElementById('gradeCategory');
        var gradeCategoryForm = document.getElementById('gradeCategoryForm');

        if (exerciseType.value === '1') {
            gradeCategory.style.display = 'block';
        } else {
            gradeCategory.style.display = 'none';
            isDisplay = false
        }
        if (exerciseType.value === '1') {
            gradeCategoryForm.style.display = 'block';
        } else {
            gradeCategoryForm.style.display = 'none';
            isDisplay = false
        }
        exerciseTypeError.innerText = "";
    }
    function toggleUpdateTypeExercise() {
        var exerciseType = document.getElementById('updateExerciseType');
        var gradeCategory = document.getElementById('updateGradeCategory');
        var gradeCategoryForm = document.getElementById('updateGradeCategoryForm');
        if (exerciseType.value === '1') {
            gradeCategory.style.display = 'block';
        } else {
            gradeCategory.style.display = 'none';
            isDisplay = false
        }
        if (exerciseType.value === '1') {
            gradeCategoryForm.style.display = 'block';
        } else {
            gradeCategoryForm.style.display = 'none';
            isDisplay = false
        }
        updateExerciseTypeError.innerText = "";
    }
    function toggleUpdateRandomTypeExercise() {
        var exerciseType = document.getElementById('updateRandom_exerciseType');
        var gradeCategory = document.getElementById('updateRandom_gradeCategory');

        if (exerciseType.value === '1') {
            gradeCategory.style.display = 'block';
        } else {
            gradeCategory.style.display = 'none';
            isDisplay = false
        }
        updateExerciseTypeError.innerText = "";
    }
    <%
        int basicBankQuestion = (Integer) request.getAttribute("basicBankQuestion");
        int lowBankQuestion = (Integer) request.getAttribute("lowBankQuestion");
        int highBankQuestion = (Integer) request.getAttribute("highBankQuestion");
    %>
    function validateForm() {
        var isValid = true;

        // Clear previous error messages
        document.getElementById('exerciseNameError').innerText = "";
        // document.getElementById('numQuestionsError').innerText = "";

        document.getElementById('exerciseTimeError').innerText = "";
        document.getElementById('basicQuestionError').innerText = "";
        document.getElementById('lowQuestionError').innerText = "";
        document.getElementById('highQuestionError').innerText = "";
        // Get form values
        var exerciseName = document.getElementById('exerciseName').value;
        // var numQuestions = document.getElementById('numQuestions').value;
        var basicQuestion = document.getElementById('basicQuestion').value;
        var lowQuestion = document.getElementById('lowQuestion').value;
        var highQuestion = document.getElementById('highQuestion').value;
        var exerciseTime = document.getElementById('exerciseTime').value;
        var exerciseType = document.getElementById('exerciseType').value;
        var gradeCategory = document.getElementById('gradeCategory').value;
        // Validate form values
        if (!exerciseName) {
            document.getElementById('exerciseNameError').innerText = "Please enter the Quiz Name.";
            isValid = false;
        } else if(exerciseNames.includes(exerciseName)){
            document.getElementById('exerciseNameError').innerText = "Quiz name already exists. Please choose another name.";
            isValid = false;
        }
        // if (!numQuestions) {
        //     document.getElementById('numQuestionsError').innerText = "Please enter the Number of Questions.";
        //     isValid = false;
        // } else if (!isValidInteger(numQuestions) || parseInt(numQuestions) <0) {
        //     document.getElementById('numQuestionsError').innerText = "Number of questions must be an positive integer.";
        //     isValid = false;
        // } else if(parseInt(numQuestions) == 0){
        //     document.getElementById('numQuestionsError').innerText = "Number of questions must not equal 0.";
        //     isValid = false;
        // }
        //basic
        if (!basicQuestion) {
            document.getElementById('basicQuestionError').innerText = "Please enter the Number of basic questions.";
            isValid = false;
        } else if (!isValidInteger(basicQuestion) || parseInt(basicQuestion) <0) {
            document.getElementById('basicQuestionError').innerText = "Basic questions must be an positive integer.";
            isValid = false;
        }
        // low
        if (!lowQuestion) {
            document.getElementById('lowQuestionError').innerText = "Please enter the Number of low application questions.";
            isValid = false;
        } else if (!isValidInteger(lowQuestion) || parseInt(lowQuestion) <0) {
            document.getElementById('lowQuestionError').innerText = "Low application questions must be an positive integer.";
            isValid = false;
        }
        //high
        if (!highQuestion) {
            document.getElementById('highQuestionError').innerText = "Please enter the Number of high application questions.";
            isValid = false;
        } else if (!isValidInteger(highQuestion) || parseInt(highQuestion) <0) {
            document.getElementById('highQuestionError').innerText = "High application questions must be an positive integer.";
            isValid = false;
        }
        if((parseInt(basicQuestion) + parseInt(lowQuestion) + parseInt(highQuestion)) == 0){
            document.getElementById('highQuestionError').innerText = "Number questions of exercise must not equal 0";
            isValid = false;
        }
        if (!exerciseTime) {
            document.getElementById('exerciseTimeError').innerText = "Please enter the Exercise time.";
            isValid = false;
        } else if (!isValidFloat(exerciseTime)) {
            document.getElementById('exerciseTimeError').innerText = "Exercise time must be a floating-point number.";
            isValid = false;
        } else if (parseFloat(exerciseTime)==0 || parseFloat(exerciseTime) <0){
            document.getElementById('exerciseTimeError').innerText = "Exercise time must be more than 0";
            isValid = false;
        }
        if (exerciseType == "0") {
            document.getElementById('exerciseTypeError').innerText = "Please choose the type of exercise.";
            isValid = false;
        }
        if(exerciseType == "1" && gradeCategory == "0"){
            document.getElementById('gradeCategoryError').innerText = "Please choose the type of grade";
            isValid = false;
        }
        return isValid;
    }

    function validateUpdateForm() {
        var isValid = true;

        // Clear previous error messages
        document.getElementById('updateExerciseNameError').innerText = "";
        document.getElementById('updateNumQuestionsError').innerText = "";
        document.getElementById('updateExerciseTimeError').innerText = "";
        // Get form values
        var exerciseName = document.getElementById('updateExerciseName').value;
        var numQuestions = document.getElementById('updateNumQuestions').value;
        var exerciseTime = document.getElementById('updateExerciseTime').value;
        var exerciseType = document.getElementById('updateExerciseType').value;
        var gradeCategory = document.getElementById('updateGradeCategory').value;
        var currentName = document.getElementById('currentExerciseName').value;
        // Validate form values
        if (!exerciseName) {
            document.getElementById('updateExerciseNameError').innerText = "Please enter the Quiz Name.";
            isValid = false;
        } else if(exerciseNames.includes(exerciseName) && !exerciseNames.equals(currentName)){
            document.getElementById('updateExerciseNameError').innerText = "Quiz name already exists. Please choose another name.";
            isValid = false;
        }
        if (!numQuestions) {
            document.getElementById('updateNumQuestionsError').innerText = "Please enter the Number of Questions.";
            isValid = false;
        } else if (!isValidInteger(numQuestions) || parseInt(numQuestions) <0) {
            document.getElementById('updateNumQuestionsError').innerText = "Number of questions must be an positive integer.";
            isValid = false;
        }
        if (!exerciseTime) {
            document.getElementById('updateExerciseTimeError').innerText = "Please enter the Exercise time.";
            isValid = false;
        } else if (!isValidFloat(exerciseTime)) {
            document.getElementById('updateExerciseTimeError').innerText = "Exercise time must be a floating-point number.";
            isValid = false;
        } else if(parseFloat(exerciseTime)==0 || parseFloat(exerciseTime) < 0) {
            document.getElementById('updateExerciseTimeError').innerText = "Exercise time must be more than 0";
            isValid = false;
        }
        if (exerciseType == "0") {
            document.getElementById('updateExerciseTypeError').innerText = "Please choose the type of exercise.";
            isValid = false;
        }
        if(exerciseType == "1" && gradeCategory == "0"){
            document.getElementById('updateGradeCategoryError').innerText = "Please choose the type of grade";
            isValid = false;
        }
        return isValid;
    }
    <%--var exerciseNames = <%= request.getAttribute("exerciseNames") %>;--%>
    function toggleRandomGradeCategory() {
        document.getElementById('random_gradeCategoryError').innerText = "";
    }

    function toggleRandomTypeExercise() {
        var exerciseType = document.getElementById('random_exerciseType');
        var gradeCategory = document.getElementById('random_gradeCategory');
        var gradeCategoryForm = document.getElementById('random_gradeCategoryForm');
        if (exerciseType.value === '1') {
            gradeCategory.style.display = 'block';
        } else {
            gradeCategory.style.display = 'none';
        }
        if (exerciseType.value === '1') {
            gradeCategoryForm.style.display = 'block';
        } else {
            gradeCategoryForm.style.display = 'none';
        }
        document.getElementById('random_exerciseTypeError').innerText = "";
    }

    function validateRandomForm() {
        var isValid = true;
        var availableBasicQuestions = <%= basicBankQuestion %>;
        var availableLowQuestions = <%= lowBankQuestion %>;
        var availableHighQuestions = <%= highBankQuestion %>;
        // Clear previous error messages
        document.getElementById('random_exerciseNameError').innerText = "";
        document.getElementById('random_basicQuestionError').innerText = "";
        document.getElementById('random_lowQuestionError').innerText = "";
        document.getElementById('random_highQuestionError').innerText = "";
        document.getElementById('random_exerciseTimeError').innerText = "";
        document.getElementById('random_exerciseTypeError').innerText = "";
        document.getElementById('random_gradeCategoryError').innerText = "";

        // Get form values
        var exerciseName = document.getElementById('random_exerciseName').value;
        var basicQuestion = document.getElementById('random_basicQuestion').value;
        var lowQuestion = document.getElementById('random_lowQuestion').value;
        var highQuestion = document.getElementById('random_highQuestion').value;
        var exerciseTime = document.getElementById('random_exerciseTime').value;
        var exerciseType = document.getElementById('random_exerciseType').value;
        var gradeCategory = document.getElementById('random_gradeCategory').value;

        // Validate form values
        if (!exerciseName) {
            document.getElementById('random_exerciseNameError').innerText = "Please enter the Quiz Name.";
            isValid = false;
        } else if (exerciseNames.includes(exerciseName)) {
            document.getElementById('random_exerciseNameError').innerText = "Quiz name already exists. Please choose another name.";
            isValid = false;
        }
        //basic
        if (!basicQuestion) {
            document.getElementById('random_basicQuestionError').innerText = "Please enter the Number of basic questions.";
            isValid = false;
        }  else if (basicQuestion > availableBasicQuestions) {
            document.getElementById('random_basicQuestionError').innerText = "Exceeds available basic questions(have " + availableBasicQuestions + " basic questions in bank)";
            isValid = false;
        } else if (!isValidInteger(basicQuestion) || parseInt(basicQuestion) <0) {
            document.getElementById('random_basicQuestionError').innerText = "Basic questions must be an positive integer.";
            isValid = false;
        }
        // low
        if (!lowQuestion) {
            document.getElementById('random_lowQuestionError').innerText = "Please enter the Number of low application questions.";
            isValid = false;
        }  else if (lowQuestion > availableLowQuestions) {
            document.getElementById('random_lowQuestionError').innerText = "Exceeds available low questions(have " + availableLowQuestions + " low questions in bank)";
            isValid = false;
        } else if (!isValidInteger(lowQuestion) || parseInt(lowQuestion) <0) {
            document.getElementById('random_lowQuestionError').innerText = "Low application questions must be an positive integer.";
            isValid = false;
        }
        //high
        if (!highQuestion) {
            document.getElementById('random_highQuestionError').innerText = "Please enter the Number of high application questions.";
            isValid = false;
        }  else if (highQuestion > availableHighQuestions) {
            document.getElementById('random_highQuestionError').innerText = "Exceeds available high questions(have " + availableHighQuestions + " high questions in bank)";
            isValid = false;
        } else if (!isValidInteger(highQuestion) || parseInt(highQuestion) <0) {
            document.getElementById('random_highQuestionError').innerText = "High application questions must be an positive integer.";
            isValid = false;
        }
        if((parseInt(basicQuestion) + parseInt(lowQuestion) + parseInt(highQuestion)) == 0){
            document.getElementById('random_highQuestionError').innerText = "Number questions of exercise must not equal 0";
            isValid = false;
        }
        if (!exerciseTime) {
            document.getElementById('random_exerciseTimeError').innerText = "Please enter the Exercise time.";
            isValid = false;
        } else if (!isValidFloat(exerciseTime)) {
            document.getElementById('random_exerciseTimeError').innerText = "Exercise time must be a floating-point number.";
            isValid = false;
        } else if(parseFloat(exerciseTime) == 0 || parseFloat(exerciseTime) < 0){
            document.getElementById('random_exerciseTimeError').innerText = "Exercise time must be more than 0";
            isValid = false;
        }
        if (exerciseType == "0") {
            document.getElementById('random_exerciseTypeError').innerText = "Please choose the type of exercise.";
            isValid = false;
        }
        if (exerciseType == "1" && gradeCategory == "0") {
            document.getElementById('random_gradeCategoryError').innerText = "Please choose the type of grade.";
            isValid = false;
        }
        return isValid;
    }

    function validateUpdateRandomForm() {
        var isValid = true;
        var availableBasicQuestions = <%= basicBankQuestion %>;
        var availableLowQuestions = <%= lowBankQuestion %>;
        var availableHighQuestions = <%= highBankQuestion %>;
        // Clear previous error messages
        document.getElementById('updateRandom_exerciseNameError').innerText = "";
        document.getElementById('updateRandom_basicQuestionError').innerText = "";
        document.getElementById('updateRandom_lowQuestionError').innerText = "";
        document.getElementById('updateRandom_highQuestionError').innerText = "";
        document.getElementById('updateRandom_exerciseTimeError').innerText = "";
        document.getElementById('updateRandom_exerciseTypeError').innerText = "";
        document.getElementById('updateRandom_gradeCategoryError').innerText = "";

        // Get form values
        var exerciseName = document.getElementById('updateRandom_exerciseName').value;
        var basicQuestion = document.getElementById('updateRandom_basicQuestion').value;
        var lowQuestion = document.getElementById('updateRandom_lowQuestion').value;
        var highQuestion = document.getElementById('updateRandom_highQuestion').value;
        var exerciseTime = document.getElementById('updateRandom_exerciseTime').value;
        var exerciseType = document.getElementById('updateRandom_exerciseType').value;
        var gradeCategory = document.getElementById('updateRandom_gradeCategory').value;
        var currentRandomName = document.getElementById('currentRandomExerciseName').value;
        // Validate form values
        if (!exerciseName) {
            document.getElementById('updateRandom_exerciseNameError').innerText = "Please enter the Quiz Name.";
            isValid = false;
        } else if (exerciseNames.includes(exerciseName) && !exerciseNames.equals(currentRandomName)) {
            document.getElementById('updateRandom_exerciseNameError').innerText = "Quiz name already exists. Please choose another name.";
            isValid = false;
        }
        //basic
        if (!basicQuestion) {
            document.getElementById('updateRandom_basicQuestionError').innerText = "Please enter the Number of basic questions.";
            isValid = false;
        }  else if (basicQuestion > availableBasicQuestions) {
            document.getElementById('updateRandom_basicQuestionError').innerText = "Exceeds available basic questions(have " + availableBasicQuestions + " basic questions in bank)";
            isValid = false;
        } else if (!isValidInteger(basicQuestion)) {
            document.getElementById('updateRandom_basicQuestionError').innerText = "Basic questions must be an integer.";
            isValid = false;
        }
        // low
        if (!lowQuestion) {
            document.getElementById('updateRandom_lowQuestionError').innerText = "Please enter the Number of low application questions.";
            isValid = false;
        }  else if (lowQuestion > availableLowQuestions) {
            document.getElementById('updateRandom_lowQuestionError').innerText = "Exceeds available low questions(have " + availableLowQuestions + " low questions in bank)";
            isValid = false;
        } else if (!isValidInteger(lowQuestion)) {
            document.getElementById('updateRandom_lowQuestionError').innerText = "Low application questions must be an integer.";
            isValid = false;
        }
        //high
        if (!highQuestion) {
            document.getElementById('updateRandom_highQuestionError').innerText = "Please enter the Number of high application questions.";
            isValid = false;
        }  else if (highQuestion > availableHighQuestions) {
            document.getElementById('updateRandom_highQuestionError').innerText = "Exceeds available high questions(have " + availableHighQuestions + " high questions in bank)";
            isValid = false;
        } else if (!isValidInteger(highQuestion)) {
            document.getElementById('updateRandom_highQuestionError').innerText = "High application questions must be an integer.";
            isValid = false;
        }
        if (!exerciseTime) {
            document.getElementById('updateRandom_exerciseTimeError').innerText = "Please enter the Exercise time.";
            isValid = false;
        } else if (!isValidFloat(exerciseTime)) {
            document.getElementById('updateRandom_exerciseTimeError').innerText = "Exercise time must be a floating-point number.";
            isValid = false;
        } else if(parseFloat(exerciseTime) == 0 || parseFloat(exerciseTime) <0){
            document.getElementById('updateRandom_exerciseTimeError').innerText = "Exercise time must be more than 0";
            isValid = false;
        }
        if (exerciseType == "0") {
            document.getElementById('updateRandom_exerciseTypeError').innerText = "Please choose the type of exercise.";
            isValid = false;
        }
        if (exerciseType == "1" && gradeCategory == "0") {
            document.getElementById('updateRandom_gradeCategoryError').innerText = "Please choose the type of grade.";
            isValid = false;
        }
        return isValid;
    }
</script>
<script>
    $(document).ready(function() {
        $('.update-btn').on('click', function() {
            var exerciseId = $(this).data('exercise-id');
            var groupId = $(this).data('group-id');
            $.ajax({
                url: 'create-exercise',
                method: 'POST',
                data: { exerciseId: exerciseId,
                        groupId : groupId,
                        status: 'view'},
                success: function(response) {
                    // Assuming the response is a JSON object with the exercise details
                    console.log(response.isRandom);
                    if(response.isRandom == 0){
                        $('#updateExerciseName').val(response.exercise_name);
                        $('#updateBasicQuestion').val(response.basic_question);
                        $('#updateLowQuestion').val(response.low_question);
                        $('#updateHighQuestion').val(response.high_question);

                        $('#updateExerciseTime').val(response.exercise_time);
                        $('#updateExerciseType').val(response.exercise_type);
                        $('#currentExerciseName').val(response.exercise_name);
                        $('#exercise_id').val(response.exercise_id);
                        if(response.exercise_type == 1) {
                            // Hiển thị và điền dữ liệu cho thẻ select
                            $('#updateGradeCategory').empty(); // Xóa các tùy chọn cũ
                            $.each(response.listGradeCategory, function (index, item) {
                                $('#updateGradeCategory').append('<option value="' + item.id + '">' + item.name + '</option>');
                            });

                            // Chọn giá trị trong thẻ select (nếu cần thiết)
                            $('#updateGradeCategory').val(response.grade_category);

                            // Hiển thị thẻ select sau khi đã điền dữ liệu
                            $('#updateGradeCategory').show();
                            // Handle grade category visibility and value if necessary
                            // Additional code to populate and handle errors if necessary
                        }
                    } else {
                        $('#updateRandom_exerciseName').val(response.exercise_name);
                        $('#updateRandom_exerciseTime').val(response.exercise_time);
                        $('#updateRandom_basicQuestion').val(response.basic_question);
                        $('#updateRandom_lowQuestion').val(response.low_question);
                        $('#updateRandom_highQuestion').val(response.high_question);
                        $('#updateRandom_exerciseType').val(response.exercise_type);
                        $('#currentRandomExerciseName').val(response.exercise_name);
                        $('#random_exercise_id').val(response.exercise_id);
                        console.log(response.listGradeCategory);
                        if(response.exercise_type == 1) {
                            // Hiển thị và điền dữ liệu cho thẻ select
                            $('#updateRandom_gradeCategory').empty(); // Xóa các tùy chọn cũ
                            $.each(response.listGradeCategory, function (index, item) {
                                $('#updateRandom_gradeCategory').append('<option value="' + item.id + '">' + item.name + '</option>');
                            });

                            // Chọn giá trị trong thẻ select (nếu cần thiết)
                            $('#updateRandom_gradeCategory').val(response.grade_category);

                            // Hiển thị thẻ select sau khi đã điền dữ liệu
                            $('#updateRandom_gradeCategory').show();
                            // Handle grade category visibility and value if necessary
                            // Additional code to populate and handle errors if necessary
                        }
                    }
                },
                error: function(xhr, status, error) {
                    console.error('An error occurred:', error);
                }
            });
        });
    });
</script>
<script>
    function handleDeleteExercise(status) {
        if (status === 1) {
            alert("The test is currently being presented. You cannot delete the exercise at this time.");
            return false; // Ngăn không cho thực hiện hành động xóa
        }
        return confirm('Are you sure you want to delete this exercise?'); // Hiển thị thông báo xác nhận xóa
    }

    function handleUpdateExercise(status) {
        if (status === 1) {
            alert("The test is currently being presented. You cannot update the exercise at this time.");
            return false; // Ngăn không cho mở modal để cập nhật bài kiểm tra
        }
        return true; // Cho phép mở modal
    }
</script>

</body>

<!-- Create Modal HTML -->
<div id="createQuizModal" class="modal fade" style="z-index: 9999;"
     role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="post" action="create-exercise" onsubmit="return validateForm()">
                    <div class="card-header">
                        <h2 class="custom-heading">Exercise</h2>
                    </div>
                    <input type="hidden" name="group_id" value="${group_id}">
                    <input type="hidden" name="course_id" value="${course_id}">
                    <div class="card-body">
                        <div class="form-group">
                            <input style="margin-top: 30px" type="hidden" name="teacher_id" value="${teacher.tid}">
                            <div>
                                <label style="display: block;text-align: left">Exercise Name:</label>
                                <input id="exerciseName" style="margin-top: 5px;margin-bottom: 20px" type="text" name="excercise_name" class="form-control"/>
                                <div  id="exerciseNameError" class="text-danger">
                            </div>
                            </div>
<%--                            <div>--%>
<%--                                <label style="display: block;text-align: left">Number of Questions:</label>--%>
<%--                                <input id="numQuestions" style="margin-top: 5px;margin-bottom: 20px" type="text" name="question_number" class="form-control">--%>
<%--                                <div  id="numQuestionsError" class="text-danger"></div>--%>
<%--                            </div>--%>
                            <div>
                                <label style="display: block;text-align: left">Number of Basic Questions:</label>
                                <input id="basicQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="basicQuestion" class="form-control">
                                <div id="basicQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of Low Application Questions:</label>
                                <input id="lowQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="lowQuestion" class="form-control">
                                <div id="lowQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of High Application Questions:</label>
                                <input id="highQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="highQuestion" class="form-control">
                                <div id="highQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Time:</label>
                                <input id="exerciseTime" style="margin-top: 5px;margin-bottom: 20px" type="text" name="exercise_time" class="form-control" placeholder="Time is measured in minutes">
                                <div id="exerciseTimeError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Type:</label>
                                <select id="exerciseType" name="exercise_type" style="margin-top: 5px;margin-bottom: 20px" onchange="toggleTypeExercise()">
                                    <option value="0">Choose type of exercise</option>
                                    <option value="1">Test</option>
                                    <option value="2">Pratice</option>
                                </select>
                                <div id="exerciseTypeError" class="text-danger"></div>
                            </div>
                            <div id="gradeCategoryForm" style="display: none">
                                <label style="display: block;text-align: left">Grade Category:</label>
                                <select id="gradeCategory" name="grade_category" style="display: none" onchange="toggleGradeCategory()">
                                    <option value="0">Choose grade category</option>
                                    <c:forEach var="o" items="${listGradeCategory}">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                                <div id="gradeCategoryError" class="text-danger"></div>
                            </div>


                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Create"
                                   class="btn btn-success bb" style="background-color: #FF6600">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Update create quiz Modal HTML -->
<div id="updateModalCreateQuiz" class="modal fade" style="z-index: 9999;" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="post" action="create-exercise" onsubmit="return validateUpdateForm()">
                    <div class="card-header">
                        <h2 class="custom-heading">Update Exercise</h2>
                    </div>
                    <input type="hidden" name="status" value="update">
                    <input type="hidden" name="group_id" value="${group_id}">
                    <input type="hidden" name="course_id" value="${course_id}">
                    <input type="hidden" id="exercise_id" name="exercise_id">
                    <div class="card-body">
                        <div class="form-group">
                            <input style="margin-top: 30px" type="hidden" name="teacher_id" value="${teacher.tid}">
                            <input type="hidden" id="currentExerciseName" name="currentExerciseName">
                            <div>
                                <label style="display: block;text-align: left">Exercise Name:</label>
                                <input id="updateExerciseName" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_exercise_name" class="form-control" placeholder="Exercise Name"/>
                                <div id="updateExerciseNameError" class="text-danger"></div>
                            </div>
<%--                           <div>--%>
<%--                               <label style="display: block;text-align: left">Number of Questions:</label>--%>
<%--                               <input id="updateNumQuestions" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_question_number" class="form-control" placeholder="Number of Questions" readonly>--%>
<%--                               <div id="updateNumQuestionsError" class="text-danger"></div>--%>
<%--                           </div>--%>
                            <div>
                                <label style="display: block;text-align: left">Number of Basic Questions:</label>
                                <input id="updateBasicQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_basicQuestion" class="form-control" readonly>
                                <div id="updatebasicQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of Low Application Questions:</label>
                                <input id="updateLowQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_lowQuestion" class="form-control" readonly>
                                <div id="updatelowQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of High Application Questions:</label>
                                <input id="updateHighQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_highQuestion" class="form-control" readonly>
                                <div id="updatehighQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Time:</label>
                                <input id="updateExerciseTime" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_exercise_time" class="form-control" placeholder="Time is measured in minutes">
                                <div id="updateExerciseTimeError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Type:</label>
                                <select id="updateExerciseType" name="update_exercise_type" style="margin-top: 10px" onchange="toggleUpdateTypeExercise()">
                                    <option value="0">Choose type of exercise</option>
                                    <option value="1">Test</option>
                                    <option value="2">Practice</option>
                                </select>
                                <div id="updateExerciseTypeError" class="text-danger"></div>
                            </div>
                           <div id="updateGradeCategoryForm">
                               <select id="updateGradeCategory" name="update_grade_category" style="display: none" onchange="toggleUpdateGradeCategory()">
                                   <option value="0">Choose grade category</option>
                                   <c:forEach var="o" items="${listGradeCategory}">
                                       <option value="${o.id}" >${o.name}</option>
                                   </c:forEach>
                               </select>
                               <div id="updateGradeCategoryError" class="text-danger"></div>
                           </div>

                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Update" style="background-color: #FF6600" class="btn btn-success bb">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Random Modal HTML -->
<div id="randomQuizModal" class="modal fade" style="z-index: 9999;" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="post" action="create-exercise" onsubmit="return validateRandomForm()">
                    <input type="hidden" name="random" value="1">
                    <input type="hidden" name="group_id" value="${group_id}">
                    <input type="hidden" name="course_id" value="${course_id}">
                    <div class="card-header">
                        <h2 class="custom-heading">Random Exercise</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div>
                                <label style="display: block;text-align: left">Exercise Name:</label>
                                <input id="random_exerciseName" style="margin-bottom: 20px" type="text" name="random_exerciseName" class="form-control" />
                                <div id="random_exerciseNameError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of Basic Questions:</label>
                                <input id="random_basicQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="random_basicQuestion" class="form-control">
                                <div id="random_basicQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of Low Application Questions:</label>
                                <input id="random_lowQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="random_lowQuestion" class="form-control">
                                <div id="random_lowQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of High Application Questions:</label>
                                <input id="random_highQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="random_highQuestion" class="form-control">
                                <div id="random_highQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Time:</label>
                                <input id="random_exerciseTime" style="margin-top: 10px;margin-bottom: 20px" type="text" name="random_exerciseTime" class="form-control" placeholder="Time is measured in minutes">
                                <div id="random_exerciseTimeError" class="text-danger"></div>
                            </div>
                           <div>
                               <label style="display: block;text-align: left">Exercise Type:</label>
                               <select id="random_exerciseType" name="random_exerciseType" style="margin-top: 10px;margin-bottom: 20px" onchange="toggleRandomTypeExercise()">
                                   <option value="0">Choose type of exercise</option>
                                   <option value="1">Test</option>
                                   <option value="2">Practice</option>
                               </select>
                               <div id="random_exerciseTypeError" class="text-danger"></div>
                           </div>
                            <div id="random_gradeCategoryForm" style="display: none">
                                <label style="display: block;text-align: left">Grade Category:</label>
                                <select id="random_gradeCategory" name="random_gradeCategory" style="display: none; margin-top: 10px;" onchange="toggleRandomGradeCategory()">
                                    <option value="0">Choose grade category</option>
                                    <c:forEach var="o" items="${listGradeCategory}">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                                <div id="random_gradeCategoryError" class="text-danger"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Create" class="btn btn-success bb" style="background-color: #FF6600">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- update Random Modal HTML -->
<div id="updateModalRandomQuiz" class="modal fade" style="z-index: 9999;" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="post" action="create-exercise" onsubmit="return validateUpdateRandomForm()">
                    <input type="hidden" name="random" value="1">
                    <div class="card-header">
                        <h2 class="custom-heading">Update Random Quiz</h2>
                    </div>
                    <input type="hidden" name="status" value="update">
                    <input type="hidden" name="group_id" value="${group_id}">
                    <input type="hidden" name="course_id" value="${course_id}">

                    <input type="hidden" id="random_exercise_id" name="exercise_id">
                    <div class="card-body">
                        <div class="form-group">
                            <input type="hidden" id="currentRandomExerciseName" name="currentRandomExerciseName">
                            <div>
                                <label style="display: block;text-align: left">Exercise Name:</label>
                                <input id="updateRandom_exerciseName" type="text" name="update_random_exerciseName" class="form-control" placeholder="Quiz Name" />
                                <div id="updateRandom_exerciseNameError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of Basic Questions:</label>
                                <input id="updateRandom_basicQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_random_basicQuestion" class="form-control" readonly>
                                <div id="updateRandom_basicQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of Low Application Questions:</label>
                                <input id="updateRandom_lowQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_random_lowQuestion" class="form-control" readonly>
                                <div id="updateRandom_lowQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Number of High Application Questions:</label>
                                <input id="updateRandom_highQuestion" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_random_highQuestion" class="form-control" readonly>
                                <div id="updateRandom_highQuestionError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Time:</label>
                                <input id="updateRandom_exerciseTime" style="margin-top: 10px;margin-bottom: 20px" type="text" name="update_random_exerciseTime" class="form-control" placeholder="Time is measured in minutes">
                                <div id="updateRandom_exerciseTimeError" class="text-danger"></div>
                            </div>
                            <div>
                                <label style="display: block;text-align: left">Exercise Type:</label>
                                <select id="updateRandom_exerciseType" name="update_random_exerciseType" style="margin-top: 10px" onchange="toggleUpdateRandomTypeExercise()">
                                    <option value="0">Choose type of exercise</option>
                                    <option value="1">Test</option>
                                    <option value="2">Practice</option>
                                </select>
                                <div id="updateRandom_exerciseTypeError" class="text-danger"></div>
                            </div>
                            <select id="updateRandom_gradeCategory" name="update_random_gradeCategory" style="display: none; margin-top: 30px;" onchange="toggleUpdateRandomGradeCategory()">
                                <option value="0">Choose grade category</option>
                                <c:forEach var="o" items="${listGradeCategory}">
                                    <option value="${o.id}">${o.name}</option>
                                </c:forEach>
                            </select>
                            <div id="updateRandom_gradeCategoryError" class="text-danger"></div>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Update" style="background-color: #FF6600" class="btn btn-success bb">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Participate Modal HTML -->
<div id="participateModal" class="modal fade" style="z-index: 9999;"
     role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="get">
                    <div class="card-header">
                        <h2 class="custom-heading">Participate</h2>
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <input type="text" name="id" class="form-control"
                                   placeholder="Quiz ID" required />
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Participate"
                                   class="btn btn-success bb">
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

</html>