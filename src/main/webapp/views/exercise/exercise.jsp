

<%--<jsp:include page="header.jsp" />--%>
<%--<jsp:include page="auth.jsp" />--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.Gson" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Exercise</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
            background-color: #343a40;
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
            background-color: #343a40;
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
    <img src="https://mega.com.vn/media/news/2707_background-pp-hoc-tap-lam-slide3.jpg" class="bgimg" type="jpg/jpeg">
</div>

<div class="container-fluid text-center">
    <div class="row1">
        <div class="col-md-12">
            <p class="text-right heading">
                <a class="btn btn-danger" href="Logout"><i
                        class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
            </p>
            <h1 class="heading">Welcome,!</h1>

        </div>
    </div>
    <div class="row" style="margin-top: 15vh">

        <div class="col animated slideInLeft">
            <a class="btn btn-primary tbtn" href="#createQuizModal"
               data-toggle="modal">
                <h1 class="q"><i class="fa fa-plus" aria-hidden="true"></i> Create Quiz</h1></a>
        </div>
        <div class="col animated slideInLeft">
            <a class="btn btn-primary tbtn" href="#randomQuizModal"
               data-toggle="modal">
                <h1 class="q"><i class="fa fa-plus" aria-hidden="true"></i> Random Quiz</h1></a>
        </div>
        <div class="col animated slideInRight">
            <a class="btn btn-danger tbtn" href="#participateModal"
               data-toggle="modal">
                <h1 class="q">
                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                    Participate
                </h1>
            </a>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-12">
            <table class="table table-hover table-light table-borderless"
                   style="width: 60%; margin: 0 auto;'">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Quiz Name</th>
                    <th scope="col">Course</th>
                    <th scope="col">View</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <c:forEach var="o" items="${listExercise}">
                    <tbody>
                    <tr>
                        <td scope="row">${o.exerciseId}</td>
                        <td>${o.exerciseName}</td>
                        <td>${o.course.code}</td>
                        <td>
                            <c:if test="${o.isRandom == 0}">
                                <a href="manage-question?exercise_id=${o.exerciseId}">View</a>
                            </c:if>
                            <c:if test="${o.isRandom == 1}">
                                <a href="manage-question?exercise_id=${o.exerciseId}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}"></a>
                            </c:if>
                        </td>
                        <td><a class="btn btn-danger"
                               href="#"><i class="fa fa-trash"
                                           aria-hidden="true"></i> Delete</a></td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

<div class="jumbotron"><h2>You haven't created any quiz yet!</h2></div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
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
    function toggleTypeExercise() {
        var exerciseType = document.getElementById('exerciseType');
        var gradeCategory = document.getElementById('gradeCategory');

        if (exerciseType.value === '1') {
            gradeCategory.style.display = 'block';
        } else {
            gradeCategory.style.display = 'none';
            isDisplay = false
        }
        exerciseTypeError.innerText = "";
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
        document.getElementById('numQuestionsError').innerText = "";
        document.getElementById('exerciseTimeError').innerText = "";
        // Get form values
        var exerciseName = document.getElementById('exerciseName').value;
        var numQuestions = document.getElementById('numQuestions').value;
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
        if (!numQuestions) {
            document.getElementById('numQuestionsError').innerText = "Please enter the Number of Questions.";
            isValid = false;
        } else if (!isValidInteger(numQuestions)) {
            document.getElementById('numQuestionsError').innerText = "Number of questions must be an integer.";
            isValid = false;
        }
        if (!exerciseTime) {
            document.getElementById('exerciseTimeError').innerText = "Please enter the Exercise time.";
            isValid = false;
        } else if (!isValidFloat(exerciseTime)) {
            document.getElementById('exerciseTimeError').innerText = "Exercise time must be a floating-point number.";
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

    <%--var exerciseNames = <%= request.getAttribute("exerciseNames") %>;--%>
    function toggleRandomGradeCategory() {
        document.getElementById('random_gradeCategoryError').innerText = "";
    }

    function toggleRandomTypeExercise() {
        var exerciseType = document.getElementById('random_exerciseType');
        var gradeCategory = document.getElementById('random_gradeCategory');

        if (exerciseType.value === '1') {
            gradeCategory.style.display = 'block';
        } else {
            gradeCategory.style.display = 'none';
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
        } else if (!isValidInteger(basicQuestion)) {
            document.getElementById('random_basicQuestionError').innerText = "Basic questions must be an integer.";
            isValid = false;
        }
        // low
        if (!lowQuestion) {
            document.getElementById('random_lowQuestionError').innerText = "Please enter the Number of low application questions.";
            isValid = false;
        }  else if (lowQuestion > availableLowQuestions) {
            document.getElementById('random_lowQuestionError').innerText = "Exceeds available low questions(have " + availableLowQuestions + " low questions in bank)";
            isValid = false;
        } else if (!isValidInteger(lowQuestion)) {
            document.getElementById('random_lowQuestionError').innerText = "Low application questions must be an integer.";
            isValid = false;
        }
        //high
        if (!highQuestion) {
            document.getElementById('random_highQuestionError').innerText = "Please enter the Number of high application questions.";
            isValid = false;
        }  else if (highQuestion > availableHighQuestions) {
            document.getElementById('random_highQuestionError').innerText = "Exceeds available high questions(have " + availableHighQuestions + " high questions in bank)";
            isValid = false;
        } else if (!isValidInteger(highQuestion)) {
            document.getElementById('random_highQuestionError').innerText = "High application questions must be an integer.";
            isValid = false;
        }
        if (!exerciseTime) {
            document.getElementById('random_exerciseTimeError').innerText = "Please enter the Exercise time.";
            isValid = false;
        } else if (!isValidFloat(exerciseTime)) {
            document.getElementById('random_exerciseTimeError').innerText = "Exercise time must be a floating-point number.";
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
</script>
</body>

<!-- Create Modal HTML -->
<div id="createQuizModal" class="modal fade" style="z-index: 9999;"
     role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="post" action="" onsubmit="return validateForm()">
                    <div class="card-header">
                        <h2 class="custom-heading">Quiz</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input style="margin-top: 30px" type="hidden" name="teacher_id" value="${teacher.tid}">
                            <input id="exerciseName" style="margin-top: 30px" type="text" name="excercise_name" class="form-control" placeholder="Quiz Name"/>
                            <div  id="exerciseNameError" class="text-danger"></div>
                            <input id="numQuestions" style="margin-top: 30px" type="text" name="question_number" class="form-control" placeholder="Number of Questions">
                            <div  id="numQuestionsError" class="text-danger"></div>
                            <input id="exerciseTime" style="margin-top: 30px" type="text" name="exercise_time" class="form-control" placeholder="Exercise time">
                            <div id="exerciseTimeError" class="text-danger"></div>
                            <select id="exerciseType" name="exercise_type" style="margin-top: 30px" onchange="toggleTypeExercise()">
                                <option value="0">Choose type of exercise</option>
                                <option value="1">Test</option>
                                <option value="2">Pratice</option>
                            </select>
                            <div id="exerciseTypeError" class="text-danger"></div>
                            <select id="gradeCategory" name="grade_category" style="display: none" onchange="toggleGradeCategory()">
                                <option value="0">Choose grade category</option>
                                <c:forEach var="o" items="${listGradeCategory}">
                                    <option value="${o.id}">${o.name}</option>
                                </c:forEach>
                            </select>
                            <div id="gradeCategoryError" class="text-danger"></div>

                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Create"
                                   class="btn btn-success bb">
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
                    <div class="card-header">
                        <h2 class="custom-heading">Participate</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input id="random_exerciseName" type="text" name="random_exerciseName" class="form-control" placeholder="Quiz Name" />
                            <div id="random_exerciseNameError" class="text-danger"></div>
                            <input id="random_basicQuestion" style="margin-top: 30px" type="text" name="random_basicQuestion" class="form-control" placeholder="Number of basic question">
                            <div id="random_basicQuestionError" class="text-danger"></div>
                            <input id="random_lowQuestion" style="margin-top: 30px" type="text" name="random_lowQuestion" class="form-control" placeholder="Number of low application question">
                            <div id="random_lowQuestionError" class="text-danger"></div>
                            <input id="random_highQuestion" style="margin-top: 30px" type="text" name="random_highQuestion" class="form-control" placeholder="Number of high application question">
                            <div id="random_highQuestionError" class="text-danger"></div>
                            <input id="random_exerciseTime" style="margin-top: 30px" type="text" name="random_exerciseTime" class="form-control" placeholder="Exercise time">
                            <div id="random_exerciseTimeError" class="text-danger"></div>
                            <select id="random_exerciseType" name="random_exerciseType" style="margin-top: 30px" onchange="toggleRandomTypeExercise()">
                                <option value="0">Choose type of exercise</option>
                                <option value="1">Test</option>
                                <option value="2">Practice</option>
                            </select>
                            <div id="random_exerciseTypeError" class="text-danger"></div>
                            <select id="random_gradeCategory" name="grade_category" style="display: none; margin-top: 30px;" onchange="toggleRandomGradeCategory()">
                                <option value="0">Choose grade category</option>
                                <c:forEach var="o" items="${listGradeCategory}">
                                    <option value="${o.id}">${o.name}</option>
                                </c:forEach>
                            </select>
                            <div id="random_gradeCategoryError" class="text-danger"></div>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Create" class="btn btn-success bb">
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