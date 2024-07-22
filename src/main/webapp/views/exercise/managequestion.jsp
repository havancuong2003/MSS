<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/19/2024
  Time: 1:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #FF6600;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: rotate(45deg);
            z-index: 3;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal-header {
            background-color: #0056b3;
            height: 50px;
        }

        .modal-header h4 {
            color: white;
            padding-top: 10px;
        }

        .modal-footer {
            display: flex;
            justify-content: center;
        }

        .form-group input {
            margin-bottom: 15px;
        }

        .custom-button {
            margin-right: 10px;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-group {
            width: 100%;
            max-width: 400px;
            margin: 10px 0;
        }

        .form-control {
            width: 100%;
        }

        /* Ensure the form has a consistent layout */
        form {
            width: 100%;
            padding: 0px;
        }

        /* Ensure buttons and inputs are centered and consistent */
        .form-container .btn, .form-container .form-control {
            width: 100%;
            max-width: 400px;
        }

        .form-container .btn {
            margin-top: 10px;
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

        /* Ensure the form does not overlap on small screens */
        @media (max-width: 600px) {
            .form-container {
                width: 100%;
            }

            form {
                flex-direction: column;
                align-items: stretch;
            }

            form select, form input, form button {
                width: 100%;
            }
        }
        @media (max-width: 600px) {
            .custom-form {
                flex-direction: column;
                align-items: stretch;
            }

            .custom-form select, .custom-form input, .custom-form button {
                width: 100%;
            }
        }

        /* Custom styles for the form wrappers */
        .custom-form-wrapper {
            flex: 1;
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
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
        .form-group.row {
            display: flex;
            justify-content: space-between;
        }

        .form-group.row .btn {
            flex: 1;
            margin: 0 5px;
        }

        .form-group.row .btn:first-child {
            margin-left: 0;
        }

        .form-group.row .btn:last-child {
            margin-right: 0;
        }
        select.form-control {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-color: #fff;
            padding: 10px;
            font-size: 14px;
            line-height: 1.5; /* Ensure proper line height */
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }
        .button-wrapper {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 20px; /* Adjust gap as needed */
            margin-top: 20px;
        }

        .button-wrapper button {
            padding: 10px 20px;
            font-size: 14px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button-wrapper button a {
            color: white;
            text-decoration: none;
        }

        .button-wrapper button:hover {
            background-color: #0056b3;
        }

        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-family: Arial, sans-serif;
            font-size: 16px;
        }
        .success-message {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }
        .error-message {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }
        .note {
            background-color: #fef3c7; /* Màu nền vàng nhạt */
            border-left: 4px solid #f59e0b; /* Đường viền trái màu vàng đậm */
            color: #92400e; /* Màu chữ vàng đậm */
            padding: 16px; /* Khoảng đệm bên trong */
            margin: 16px 0; /* Khoảng cách trên và dưới */
            border-radius: 4px; /* Bo góc */
        }

        .note p {
            margin: 0;
        }

        .note .font-bold {
            font-weight: bold; /* Chữ in đậm */
        }
        #messageContainer {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            color: white;
        }

        #mess_constructor {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            color: white;
            background-color: red;
        }

        #mess_constructor_success {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            color: white;
            background-color: #28a745;
        }

    </style>
</head>
<body>
<div class="container" style="margin-top: 70px">
    <div class="custom-form-wrapper">
        <form class="custom-form" action="manage-question" method="get">
            <input type="hidden" name="exercise_id" value="${exercise_id}">
            <input type="hidden" name="group_id" value="${group_id}">
            <input type="hidden" name="course_id" value="${course_id}">
            <select name="type_question">
                <option value="0" class="form-control">Choose type question</option>
                <option value="1" ${type_question == "1" ? "selected" : ""} class="form-control">Basic Question</option>
                <option value="2" ${type_question == "2" ? "selected" : ""} class="form-control">Low Application Question</option>
                <option value="3" ${type_question == "3" ? "selected" : ""} class="form-control">High Application Question</option>
            </select>
            <button type="submit" class="custom-button" style="background-color: #FF6600">Select</button>
        </form>
    </div>
    <div class="custom-form-wrapper">
        <form class="custom-form" action="manage-question" method="get">
            <input type="hidden" name="exercise_id" value="${exercise_id}">
            <input type="hidden" name="group_id" value="${group_id}">
            <input type="hidden" name="course_id" value="${course_id}">
            <input type="text" placeholder="Search by question..." name="search">
            <button type="submit" class="custom-button" style="background-color: #FF6600">Search</button>
        </form>
    </div>
    <div id="messageContainer"></div>
    <c:if test="${mess_constructor != null}">
        <div id="mess_constructor">${mess_constructor}</div>
    </c:if>
    <c:if test="${mess_constructor_success != null}">
        <div id="mess_constructor_success">${mess_constructor_success}</div>
    </c:if>
    <form action="manage-question" id="questionForm" method="post">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Question</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <c:if test="${exercise_status == 0}">
                            <c:if test="${listQuestionSize == numQuestion}">
                                <form action="manage-question" method="post">
                                    <input type="hidden" name="exercise_id" value="${exercise_id}">
                                    <input type="hidden" name="status" value="prevent">
                                    <button type="submit" class="btn btn-success"  onclick="confirmSubmission(event)">
                                        <i class="material-icons">assignment</i> <span>Present</span>
                                    </button>
                                </form>
                            </c:if>
                            <c:if test="${listQuestionSize < numQuestion}">
                                <form action="manage-question" method="post">
                                    <input type="hidden" name="exercise_id" value="${exercise_id}">
                                    <input type="hidden" name="status" value="prevent">
                                    <button type="submit" class="btn btn-success" onclick="checkQuestions(event)">
                                        <i class="material-icons">assignment</i> <span>Present</span>
                                    </button>
                                </form>
                            </c:if>
                        </c:if>

                        <c:if test="${exercise_status == 1}">
                            <form action="manage-question" method="post">
                                <input type="hidden" name="exercise_id" value="${exercise_id}">
                                <input type="hidden" name="status" value="close">
                                <button type="submit" class="btn btn-success"  onclick="confirmClose(event)">
                                    <i class="material-icons">check_circle</i> <span>Close</span>
                                </button>
                            </form>
                        </c:if>

                        <c:if test="${isRandom != 1}">
                            <c:if test="${listQuestionSize < numQuestion}">
                                <a href="select-question-bank?exercise_id=${exercise_id}&numQuestion=${numQuestion}&group_id=${group_id}&course_id=${course_id}" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Get Questions From Bank</span></a>
                                <a href="#addQuestionModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Question</span></a>
                            </c:if>
                            <c:if test="${listQuestionSize >= numQuestion}">
                                <a href="select-question-bank?exercise_id=${exercise_id}" onclick="showAlertAndPreventDefault(event,'The exercise have enough questions')"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Get Questions From Bank</span></a>
                                <a onclick="showAlertAndPreventDefault(event,'The exercise have enough questions')"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Question</span></a>
                            </c:if>
                        </c:if>

                        <c:if test="${isRandom == 1}">
                            <c:if test="${listQuestionSize < numQuestion}">
                                <a href="select-question-bank?exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Get Questions From Bank</span></a>
                                <a href="#addQuestionModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Question</span></a>
                            </c:if>
                            <c:if test="${listQuestionSize >= numQuestion}">
                                <a href="select-question-bank?exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}" onclick="showAlertAndPreventDefault(event,'The exercise have enough questions')"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Get Questions From Bank</span></a>
                                <a onclick="showAlertAndPreventDefault(event,'The exercise have enough questions')"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Question</span></a>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <div class="note">
                    <p class="font-bold">Note</p>
                    <p>The select button is disabled because it already exists in the question bank or coincides with a question waiting to be approved.</p>
                </div>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Type Question</th>
                    <th>Action</th>
                    <th>Select</th>
                </tr>
                </thead>
                <c:forEach var="o" items="${listQuestion}">
                    <tbody>
                    <tr>
                        <td>${o.question_id}</td>
                        <td>${o.question}</td>
                        <c:if test="${o.type_question == 1}">
                            <td>Basic Question</td>
                        </c:if>
                        <c:if test="${o.type_question == 2}">
                            <td>Low Application Question</td>
                        </c:if>
                        <c:if test="${o.type_question == 3}">
                            <td>High Application Question</td>
                        </c:if>
                        <td>
                            <a href="#updateModal"  class="edit" data-toggle="modal" data-question-id="${o.question_id}"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="manage-question?question_id=${o.question_id}&delete=1&exercise_id=${exercise_id}&group_id=${group_id}&course_id=${course_id}" onclick="return confirm('Are you sure you want to delete this question?');" class="delete" data-toggle="tooltip" title="Delete"><i class="material-icons">&#xE872;</i></a>
                        </td>
                        <c:if test="${o.status == 0}">
                            <td style="text-align: center">
                                <input type="checkbox" name="choose" value="${o.question_id}" style="width: 18px; height: 18px; cursor: pointer;">
                            </td>
                        </c:if>
                        <c:if test="${o.status == 1 || o.status == 2}">
                            <td style="text-align: center">
                                <input type="checkbox" name="choose" value="${o.question_id}" style="width: 18px; height: 18px; cursor: pointer;" disabled>
                            </td>
                        </c:if>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
            <div>
                <div class="button-wrapper" style="margin-top: 20px">
                    <c:if test="${listQuestion.size() != 0}" >
                        <button id="publicQuestionButton" >Public question for bank</button>
                    </c:if>
                    <input type="hidden" name="exercise_id" value="${exercise_id}">
                    <input type="hidden" name="status" value="public">
                    <input type="hidden" name="page" value="${tag}">
                </div>
                <div>
                    <a class="back-link" href="create-exercise?group_id=${group_id}&course_id=${course_id}" style="color: #FF6600;font-size: 15px">
                        <i class="fas fa-arrow-left"></i> Back to manage exercise
                    </a>
                </div>
            </div>
            <div class="pagination-container">
                <ul class="pagination">
                    <c:if test="${search != null}" >
                        <c:if test="${tag > 1}">
                        <li class="page-item"><a href="manage-question?page=${tag-1}&exercise_id=${exercise_id}&search=${search}&group_id=${group_id}&course_id=${course_id}">Previous</a></li>
                        </c:if>
                        <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="manage-question?page=${i}&exercise_id=${exercise_id}&search=${search}&group_id=${group_id}&course_id=${course_id}">${i}</a>
                        </li>
                        </c:forEach>
                        <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="manage-question?page=${tag+1}&exercise_id=${exercise_id}&search=${search}&group_id=${group_id}&course_id=${course_id}" class="page-link">Next</a></li>
                        </c:if>
                        <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                        </c:if>
                    </c:if>

                    <c:if test="${search == null}" >
                        <c:if test="${tag > 1}">
                        <li class="page-item"><a href="manage-question?page=${tag-1}&exercise_id=${exercise_id}&type_question=${type_question}&group_id=${group_id}&course_id=${course_id}">Previous</a></li>
                        </c:if>
                        <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="manage-question?page=${i}&exercise_id=${exercise_id}&type_question=${type_question}&group_id=${group_id}&course_id=${course_id}">${i}</a>
                        </li>
                        </c:forEach>
                        <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="manage-question?page=${tag+1}&exercise_id=${exercise_id}&type_question=${type_question}&group_id=${group_id}&course_id=${course_id}" class="page-link">Next</a></li>
                        </c:if>
                        <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                        </c:if>
                    </c:if>
                    <ul/>
                    <div/>
            </div>
        </div>
    </form>


</div>
<div id="addQuestionModal" class="modal fade">
    <div class="modal-dialog custom-dialog">
        <div class="modal-content custom-content" style="text-align: center;">
            <form id="create-question-form" action="manage-question" method="post" onsubmit="return validateForm()">
                <input type="hidden" value="${exercise_id}" name="exercise_id">
                <input type="hidden" value="${tag}" name="page">
                <input type="hidden" value="${type_question}" name="type_question">
                <input type="hidden" name="status" value="add">
                <input type="hidden" name="group_id" value="${group_id}">
                <input type="hidden" name="course_id" value="${course_id}">
                <c:if test="${searchExist == 1}">
                    <input type="hidden" value="${search}" name="search">
                </c:if>
                <input type="hidden" id="optionCount" value="2" name="optionCount">
                <input type="hidden" id="correctAnswerCount" value="1" name="correctAnswerCount">
                <input type="hidden" id="share_question_input" name="share_question" value="0">
                <div class="modal-body">
                    <div  class="form-container">
                        <div class="form-group">
                            <select name="type_question_modal"  id="type_question_modal" class="form-control">
                                <option value="0" class="form-control">Choose type question</option>
                                <option value="1" ${type_question_modal == "1" ? "selected" : ""} class="form-control">Basic Question</option>
                                <option value="2" ${type_question_modal == "2" ? "selected" : ""} class="form-control">Low Application Question</option>
                                <option value="3" ${type_question_modal == "3" ? "selected" : ""} class="form-control">High Application Question</option>
                            </select>
                        </div>
                        <div id="type-question-error" class="error-message"></div>

                        <div class="form-group">
                            <input name="question" type="text" id="question" class="form-control" value="${question}" placeholder="Question..." >
                        </div>
                        <div id="question-error" class="error-message"></div>
                        <div class="form-group">
                            <input name="option1" type="text" class="form-control" value="${option[0]}" placeholder="Option A..." >
                        </div>
                        <div class="form-group">
                            <input name="option2" type="text" class="form-control" value="${option[1]}" placeholder="Option B..." >
                        </div>
                        <div id="additional-options" style="width: 100%; display: flex;justify-content: center; flex-wrap: wrap">
                        </div>
                        <div id="option-error" class="error-message"></div>
                        <div class="form-group row">
                            <button type="button" id="add-option" class="btn btn-secondary col-md-6">Add more option</button>
                            <button type="button" id="remove-option" class="btn btn-danger col-md-6">Remove option</button>
                        </div>
                        <div class="form-group">
                            <input name="correct_answer1" type="text" value="${correct_answer[0]}" class="form-control" placeholder="Answer...">
                        </div>
                        <div id="multiple-choice-options" style="width: 100%; display: flex;justify-content: center; flex-wrap: wrap">
                        </div>
                        <div id="correct-answer-error" class="error-message"></div>
                        <div id="correct-answer-error-multiple" class="error-message"></div>
                        <div class="form-group row">
                            <button type="button" id="add-multiple-choice" class="btn btn-secondary col-md-6">Add more answer</button>
                            <button type="button" id="remove-multiple-choice" class="btn btn-danger col-md-6">Remove answer</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="button-group">
                    <button type="button" class="custom-button btn btn-success" onclick="location.href = '#'">Cancel</button>
                    <input type="submit" class="btn btn-success" value="Add">
                    <%--                    <input type="submit" class="btn btn-success" value="Share to question bank" onclick="shareQuestion()">--%>
                </div>
            </form>
        </div>
    </div>
</div>
<%--Update modal--%>
<div id="updateModal" class="modal fade">
    <div class="modal-dialog custom-dialog">
        <div class="modal-content custom-content" style="text-align: center;">
            <form id="update-question-form" action="manage-question" method="post" onsubmit="return validateFormUpdate()">
                <input type="hidden" value="${exercise_id}" name="exercise_id">
                <input type="hidden" value="${tag}" name="page">
                <input type="hidden" value="${type_question}" name="type_question">
                <input type="hidden" id="update_question_id" name="question_id">
                <input type="hidden" name="status" value="update">
                <input type="hidden" name="group_id" value="${group_id}">
                <input type="hidden" name="course_id" value="${course_id}">
                <input type="hidden" id="optionCountUpdate" value="2" name="optionCountUpdate">
                <input type="hidden" id="correctAnswerCountUpdate" value="1" name="correctAnswerCountUpdate">
                <c:if test="${searchExist == 1}">
                    <input type="hidden" value="${search}" name="search">
                </c:if>
                <input type="hidden" id="share_question_input" name="share_question" value="0">
                <div class="modal-body">
                    <div  class="form-container">
                        <div class="form-group">
                            <select name="update_type_question_modal"  id="update_type_question_modal" class="form-control">
                                <option value="0" class="form-control">Choose type question</option>
                                <option value="1" ${type_question_modal == "1" ? "selected" : ""} class="form-control">Basic Question</option>
                                <option value="2" ${type_question_modal == "2" ? "selected" : ""} class="form-control">Low Application Question</option>
                                <option value="3" ${type_question_modal == "3" ? "selected" : ""} class="form-control">High Application Question</option>
                            </select>
                        </div>
                        <div id="update_type-question-error" class="error-message"></div>

                        <div class="form-group">
                            <input name="question" type="text" id="update_question" class="form-control" value="${question}" placeholder="Question..." >
                        </div>
                        <div class="form-group">
                            <input type="hidden" id="originQuestion" class="form-control" >
                        </div>
                        <div id="update_question-error" class="error-message"></div>
                        <div class="form-group">
                            <input name="option1" id="option1" type="text" class="form-control" placeholder="Option A..." >
                        </div>
                        <div class="form-group">
                            <input name="option2" id="option2" type="text" class="form-control"  placeholder="Option B..." >
                        </div>
                        <div id="update-additional-options" style="width: 100%; display: flex;justify-content: center; flex-wrap: wrap">
                        </div>
                        <div id="update-option-error" class="error-message"></div>
                        <div class="form-group row">
                            <button type="button" id="update-add-option" class="btn btn-secondary col-md-6">Add more option</button>
                            <button type="button" id="update-remove-option" class="btn btn-danger col-md-6">Remove option</button>
                        </div>
                        <div class="form-group">
                            <input name="correct_answer1" id="correct_answer1" type="text" class="form-control" placeholder="Answer...">
                        </div>
                        <div id="update-multiple-choice-options" style="width: 100%; display: flex; justify-content: center; flex-wrap: wrap">
                        </div>
                        <div id="update-correct-answer-error" class="error-message"></div>
                        <div id="update-correct-answer-error-multiple" class="error-message"></div>
                        <div class="form-group row">
                            <button type="button" id="update-add-multiple-choice" class="btn btn-secondary col-md-6">Add more answer</button>
                            <button type="button" id="update-remove-multiple-choice" class="btn btn-danger col-md-6">Remove answer</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="button-group">
                    <button type="button" class="custom-button btn btn-success" onclick="location.href = '#'">Cancel</button>
                    <input type="submit" class="btn btn-success" value="Update">
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    var listQuestionSize = ${listQuestionSize}; // Lấy giá trị từ JSP
    var numQuestion = ${numQuestion};
    function checkQuestions(event) {
        if (listQuestionSize < numQuestion) {
            alert("There are not enough questions. Please add more questions.");
            event.preventDefault(); // Ngăn chặn form gửi
        }
    }
    function confirmSubmission(event) {
        if (!confirm("Are you sure you want to submit this exercise?")) {
            event.preventDefault(); // Ngăn chặn form gửi nếu người dùng nhấn "Cancel"
        }
    }
    function confirmClose(event) {
        if (!confirm("Are you sure you want to close this exercise?")) {
            event.preventDefault(); // Ngăn chặn form gửi nếu người dùng nhấn "Cancel"
        }
    }
    var exercise_id = "${exercise_id}";
    let optionCountUpdate;
    let correctOptionCountUpdate;
    let count = 0;

    jQuery.noConflict();
    jQuery(document).ready(function($) { // Use $ for jQuery inside this function
        $('.edit').click(function() {
            var questionId = $(this).data('question-id');
            document.getElementById('update_question_id').value = questionId;
            $.ajax({
                url: 'manage-question',
                method: 'POST',
                data: {
                    question_id: questionId,
                    exercise_id: exercise_id,
                    status: 'view'
                },
                success: function(response) {
                    optionCountUpdate = response.answers.length + 1;
                    console.log(optionCountUpdate);
                    // Điền thông tin câu hỏi và câu trả lời vào modal
                    $('#updateModal').find('input[name="question"]').val(response.question);
                    $('#update_type_question_modal').val(response.update_type_question_modal);
                    $('#update-additional-options').empty();
                    $('#originQuestion').val(response.question);
                    for (var i = 0; i < response.answers.length; i++) {
                        var answer = response.answers[i];
                        var optionIndex = i + 1;
                        // Xác định tên của input dựa trên optionIndex
                        var inputName = 'option' + optionIndex;
                        if(optionIndex >=3){
                            var newOptionDiv = $('<div class="form-group"></div>');
                            var newOptionInput = $('<input name="option' + optionIndex + '" type="text" class="form-control" value="' + answer.answer_text + '" placeholder="Tùy chọn ' + String.fromCharCode(64 + optionIndex) + '...">');
                            newOptionDiv.append(newOptionInput);
                            $('#update-additional-options').append(newOptionDiv);
                        } else {
                            $('#updateModal').find('input[name="' + inputName + '"]').val(answer.answer_text);
                        }
                    }
                    correctOptionCountUpdate = response.correctanswers.length + 1
                    console.log(correctOptionCountUpdate)
                    $('#update-multiple-choice-options').empty();
                    for (var i = 0; i < response.correctanswers.length; i++) {
                        var answer = response.correctanswers[i];
                        var optionIndex = i + 1;
                        // Xác định tên của input dựa trên optionIndex
                        var inputName = 'correct_answer' + optionIndex;
                        if (optionIndex >= 2) {
                            var newOptionDiv = $('<div class="form-group"></div>');
                            var newOptionInput = $('<input name="correct_answer' + optionIndex + '" type="text" class="form-control" value="' + answer.correct_answer_text + '" placeholder="Đáp án đúng">');
                            newOptionDiv.append(newOptionInput);
                            $('#update-multiple-choice-options').append(newOptionDiv);
                        } else {
                            $('#updateModal').find('input[name="' + inputName + '"]').val(answer.correct_answer_text);
                        }
                    }
                    $('#updateModal').modal('show');

                    // Gắn sự kiện thêm tùy chọn nếu chưa được gắn
                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi khi không thể lấy thông tin câu hỏi
                    console.error('Failed to load question info:', error);
                    alert('Failed to load question info. Please try again later.');
                }
            });
        });
    });
</script>
<script>
    // Add option update
    document.getElementById('update-add-option').addEventListener('click', function () {
        const newOptionDiv = document.createElement('div');
        newOptionDiv.className = 'form-group';
        const newOptionInput = document.createElement('input');
        newOptionInput.name = 'option' + optionCountUpdate;
        newOptionInput.type = 'text';
        newOptionInput.className = 'form-control';
        newOptionInput.placeholder = 'Option ' + String.fromCharCode(64 + optionCountUpdate) + '...';

        newOptionDiv.appendChild(newOptionInput);
        document.getElementById('update-additional-options').appendChild(newOptionDiv);
        console.log('value:'  + optionCountUpdate);
        document.getElementById('optionCountUpdate').value = optionCountUpdate;
        document.getElementById('correctAnswerCountUpdate').value = correctOptionCountUpdate -1;
        optionCountUpdate++;
    });

    // Remove option update
    document.getElementById('update-remove-option').addEventListener('click', function () {
        if (optionCountUpdate > 3) {
            optionCountUpdate--;
            const additionalOptionsDiv = document.getElementById('update-additional-options');
            if (additionalOptionsDiv.lastChild) {
                additionalOptionsDiv.removeChild(additionalOptionsDiv.lastChild);
            }
            document.getElementById('optionCountUpdate').value = optionCountUpdate;
            document.getElementById('correctAnswerCountUpdate').value = correctOptionCountUpdate -1;
        }
    });
    // Add multiple-choice update
    document.getElementById('update-add-multiple-choice').addEventListener('click', function () {
        const newMultipleChoiceDiv = document.createElement('div');
        newMultipleChoiceDiv.className = 'form-group';
        const newMultipleChoiceInput = document.createElement('input');
        newMultipleChoiceInput.name = 'correct_answer' + correctOptionCountUpdate;
        newMultipleChoiceInput.type = 'text';
        newMultipleChoiceInput.className = 'form-control';
        newMultipleChoiceInput.placeholder = 'Answer...';

        newMultipleChoiceDiv.appendChild(newMultipleChoiceInput);
        document.getElementById('update-multiple-choice-options').appendChild(newMultipleChoiceDiv);
        console.log('update' + correctOptionCountUpdate);
        document.getElementById('optionCountUpdate').value = optionCountUpdate -1;
        document.getElementById('correctAnswerCountUpdate').value = correctOptionCountUpdate;
        correctOptionCountUpdate++;
    });

    // Remove multiple-choice update
    document.getElementById('update-remove-multiple-choice').addEventListener('click', function () {
        if (correctOptionCountUpdate > 2) { // Ensure at least one correct answer remains
            correctOptionCountUpdate--;
            const multipleChoiceOptionsDiv = document.getElementById('update-multiple-choice-options');
            if (multipleChoiceOptionsDiv.lastChild) {
                multipleChoiceOptionsDiv.removeChild(multipleChoiceOptionsDiv.lastChild);
            }
            console.log('view:' + optionCountUpdate)
            console.log('view2: ' + correctOptionCountUpdate)
            document.getElementById('optionCountUpdate').value = optionCountUpdate -1;
            document.getElementById('correctAnswerCountUpdate').value = correctOptionCountUpdate;
        }
    });
    var listQuestions = <%= request.getAttribute("questions") %>;
    console.log(listQuestions);

    function validateFormUpdate() {
        let isValid = true;

        // Kiểm tra loại câu hỏi
        const typeQuestionModal = document.getElementById('update_type_question_modal').value;
        if (typeQuestionModal === "0") {
            document.getElementById('update_type-question-error').innerText = 'Please select type of question';
            isValid = false;
        } else {
            document.getElementById('update_type-question-error').innerText = '';
        }

        // Kiểm tra câu hỏi
        const question = document.getElementById('update_question').value.trim();
        const  originalQuestion  = document.getElementById('originQuestion').value.trim();
        console.log(originalQuestion);
        console.log(question);
        if (question === "") {
            document.getElementById('update_question-error').innerText = 'Please enter question';
            isValid = false;
        } else if (listQuestions.includes(question) && question !== originalQuestion) {
            document.getElementById('update_question-error').innerText = 'Question is already exist in this exercise!';
            isValid = false;
        } else {
            document.getElementById('update_question-error').innerText = '';
        }

        // Kiểm tra các tùy chọn
        const option1 = document.getElementById('option1').value.trim();
        const option2 = document.getElementById('option2').value.trim();
        // console.log(option1);
        // console.log(option2);
        if (option1 === "" || option2 === "") {
            document.getElementById('update-option-error').innerText = 'Please enter at least two options';
            isValid = false;
        } else if (option1 === option2) {
            document.getElementById('update-option-error').innerText = 'Options must not duplicate';
            isValid = false;
        } else {
            document.getElementById('update-option-error').innerText = '';
        }

        // Kiểm tra các tùy chọn bổ sung
        const options = document.querySelectorAll('#update-additional-options input.form-control');
        const optionValues = [];
        for (let i = 0; i < options.length; i++) {
            const optionValue = options[i].value.trim();
            if (optionValue === "") {
                document.getElementById('update-option-error').innerText = 'Please enter all options';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            if (optionValues.includes(optionValue) || optionValue === option1 || optionValue === option2) {
                document.getElementById('update-option-error').innerText = 'Options must not duplicate';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            optionValues.push(optionValue);
        }

        // Kiểm tra đáp án đúng
        const correct_answer1 = document.getElementById("correct_answer1").value.trim();
        if (correct_answer1 === "") {
            document.getElementById('update-correct-answer-error').innerText = 'Please enter answer';
            isValid = false;
        } else if (!optionValues.includes(correct_answer1) && option1 !== correct_answer1 && option2 !== correct_answer1) {
            document.getElementById('update-correct-answer-error').innerText = 'The answer is not on the list of options';
            isValid = false;
        } else {
            document.getElementById('update-correct-answer-error').innerText = '';
        }
        let isValidAnswer = true;
        // Kiểm tra các đáp án đúng còn lại
        const correctAnswers = document.querySelectorAll('#update-multiple-choice-options input.form-control');
        const correctAnswerValues = [];
        for (let i = 0; i < correctAnswers.length; i++) {
            isValidAnswer = true;
            const correctAnswerValue = correctAnswers[i].value.trim();
            console.log(correctAnswerValue);
            if (correctAnswerValue === "") {
                console.log("loi 1")
                document.getElementById('update-correct-answer-error').innerText = 'Please enter all answers';
                isValid = false;
                isValidAnswer = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            } else if (!optionValues.includes(correctAnswerValue) && option1 !== correct_answer1 && option2 !== correct_answer1) {
                console.log("loi 2")
                document.getElementById('update-correct-answer-error').innerText = 'The answer is not on the list of options';
                isValid = false;
                isValidAnswer = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }else if (correctAnswerValues.includes(correctAnswerValue) || correctAnswerValue === correct_answer1) {
                console.log("loi 3")
                document.getElementById('update-correct-answer-error-multiple').innerText = 'Answer must not duplicate';
                isValid = false;
                isValidAnswer = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            correctAnswerValues.push(correctAnswerValue);
        }
        console.log(correctAnswerValues)
        console.log(isValidAnswer);
        if (isValidAnswer) {
            document.getElementById('update-correct-answer-error').innerText = ''; // Xóa thông báo lỗi nếu không có lỗi
            document.getElementById('update-correct-answer-error-multiple').innerText = ''; // Xóa thông báo lỗi nếu không có lỗi
        }
        if(isValid){
            document.getElementById('optionCountUpdate').value = optionCountUpdate -1;
            document.getElementById('correctAnswerCountUpdate').value = correctOptionCountUpdate-1;
        }
        return isValid;
    }
</script>
<script>
    jQuery.noConflict();
    jQuery(document).ready(function($) {

        function saveCheckboxState() {
            var selectedCheckboxes = JSON.parse(localStorage.getItem('selectedCheckboxes')) || {};
            $('input[type="checkbox"][name="choose"]').each(function() {
                var checkboxValue = $(this).val();
                if ($(this).is(':checked')) {
                    selectedCheckboxes[checkboxValue] = true;
                } else {
                    delete selectedCheckboxes[checkboxValue];
                }
            });
            localStorage.setItem('selectedCheckboxes', JSON.stringify(selectedCheckboxes));
            console.log(selectedCheckboxes);
        }

        function loadCheckboxState() {
            var selectedCheckboxes = JSON.parse(localStorage.getItem('selectedCheckboxes')) || {};
            $('input[type="checkbox"][name="choose"]').each(function() {
                var checkboxValue = $(this).val();
                if (selectedCheckboxes[checkboxValue]) {
                    $(this).prop('checked', true);
                } else {
                    $(this).prop('checked', false);
                }
            });
        }
        var exercise_id = "${exercise_id}"
        console.log(exercise_id)
        function sendSelectedIdsToServer() {
            var selectedCheckboxes = JSON.parse(localStorage.getItem('selectedCheckboxes')) || {};
            var selectedIds = Object.keys(selectedCheckboxes).filter(function(key) {
                return selectedCheckboxes[key];
            });

            // Đảm bảo exercise_id đã được định nghĩa
            if (!exercise_id) {
                console.error('exercise_id is not defined');
                return;
            }

            console.log('Sending JSON data to server:');
            console.log({
                exercise_id: exercise_id,
                selectedIds: selectedIds
            });

            // Gửi selectedIds về server bằng AJAX
            $.ajax({
                url: 'manage-question',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify({
                    exercise_id: exercise_id,
                    selectedIds: selectedIds,
                    status : 'public'
                }),
                success: function(response) {
                    console.log('Selected IDs sent to server successfully');
                    console.log(response); // In ra phản hồi từ server để kiểm tra
                    localStorage.removeItem('selectedCheckboxes');
                    // location.reload();
                    $('input[type="checkbox"][name="choose"]').each(function() {
                        if ($(this).is(':checked')) {
                            $(this).prop('checked', false); // Bỏ chọn checkbox
                            $(this).prop('disabled', true); // Vô hiệu hóa checkbox
                        }
                    });
                    document.getElementById('messageContainer').innerText = response.message;
                    document.getElementById('messageContainer').style.backgroundColor = '#4CAF50'
                },
                error: function(xhr, status, error) {
                    console.error('Failed to send selected IDs to server:', status, error);
                    console.log(xhr.responseText); // In ra phản hồi từ server để phân tích lỗi
                    var response = JSON.parse(xhr.responseText);
                    document.getElementById('messageContainer').innerText = response.message;
                    document.getElementById('messageContainer').style.backgroundColor = '#f44336'
                }
            });
        }
        $('#publicQuestionButton').on('click', function(event) {
            event.preventDefault(); // Ngăn không cho form submit mặc định

            // Gọi hàm để gửi selected IDs về server
            sendSelectedIdsToServer();
        });

        loadCheckboxState();

        // Listen to change event of checkboxes
        $('input[type="checkbox"][name="choose"]').on('change', function() {
            saveCheckboxState();
        });

        // Optionally, clear localStorage on form submission or backToCreateQuestion click
        $('form').on('submit', function() {
            localStorage.removeItem('selectedCheckboxes');
        });

        $('#backToCreateQuestion').on('click', function() {
            localStorage.removeItem('selectedCheckboxes');
        });
    });
</script>
<script>
    let optionCount = 3;  // Theo dõi số lượng tùy chọn
    let multipleChoiceCount = 2;
    // add option
    document.getElementById('add-option').addEventListener('click', function () {
        const newOptionDiv = document.createElement('div');
        newOptionDiv.className = 'form-group';
        const newOptionInput = document.createElement('input');
        newOptionInput.name = 'option' + optionCount;
        newOptionInput.type = 'text';
        newOptionInput.className = 'form-control';
        newOptionInput.placeholder = 'Option ' + String.fromCharCode(64 + optionCount) + '...';
        // newOptionInput.required = true;

        newOptionDiv.appendChild(newOptionInput);
        document.getElementById('additional-options').appendChild(newOptionDiv);
        document.getElementById('optionCount').value = optionCount
        optionCount++;
    });
    // remove option
    document.getElementById('remove-option').addEventListener('click', function () {
        if (optionCount > 3) {
            optionCount--;
            const additionalOptionsDiv = document.getElementById('additional-options');
            if (additionalOptionsDiv.lastChild) {
                additionalOptionsDiv.removeChild(additionalOptionsDiv.lastChild);
            }
            document.getElementById('optionCount').value = optionCount;
        }
    });

    // add multiple-choice
    document.getElementById('add-multiple-choice').addEventListener('click', function () {
        const newMultipleChoiceDiv = document.createElement('div');
        newMultipleChoiceDiv.className = 'form-group';
        const newMultipleChoiceInput = document.createElement('input');
        newMultipleChoiceInput.name = 'correct_answer' + multipleChoiceCount;
        newMultipleChoiceInput.type = 'text';
        newMultipleChoiceInput.className = 'form-control';
        newMultipleChoiceInput.placeholder = 'Answer...';
        // newMultipleChoiceInput.required = true;

        newMultipleChoiceDiv.appendChild(newMultipleChoiceInput);
        document.getElementById('multiple-choice-options').appendChild(newMultipleChoiceDiv);
        document.getElementById('correctAnswerCount').value = multipleChoiceCount;
        multipleChoiceCount++;
    });
    // remove multiple-choice
    document.getElementById('remove-multiple-choice').addEventListener('click', function () {
        if (multipleChoiceCount > 2) { // Ensure at least one correct answer remains
            multipleChoiceCount--;
            const multipleChoiceOptionsDiv = document.getElementById('multiple-choice-options');
            if (multipleChoiceOptionsDiv.lastChild) {
                multipleChoiceOptionsDiv.removeChild(multipleChoiceOptionsDiv.lastChild);
            }
            document.getElementById('correctAnswerCount').value = multipleChoiceCount;
        }
    });
    function shareQuestion() {
        // Đặt giá trị của trường share_question thành 1
        document.getElementById("share_question_input").value = "1";
        return true; // Trả về true để tiếp tục với hành động submit của nút
    }

    function showAlertAndPreventDefault(event, message) {
        event.preventDefault();  // Ngăn chặn hành động mặc định
        alert(message);  // Hiển thị thông báo
    }
    var questions = <%= request.getAttribute("questions") %>;
    function validateForm() {
        let isValid = true;

        // Kiểm tra loại câu hỏi
        const typeQuestionModal = document.getElementById('type_question_modal').value;
        if (typeQuestionModal === "0") {
            document.getElementById('type-question-error').innerText = 'Please select type of question';
            isValid = false;
        } else {
            document.getElementById('type-question-error').innerText = '';
        }
        const question = document.getElementById('question').value.trim();
        if (question === "") {
            document.getElementById('question-error').innerText = 'Please enter question';
            isValid = false;
        } else if(questions.includes(question)){
            document.getElementById('question-error').innerText = 'Question is already exist in this exercise!';
            isValid = false;
        } else {
            document.getElementById('question-error').innerText = '';
        }

        const option1 = document.getElementsByName('option1')[0].value.trim();
        const option2 = document.getElementsByName('option2')[0].value.trim();
        if (option1 === "" || option2 === "") {
            document.getElementById('option-error').innerText = 'Please enter at least two options';
            isValid = false;
        } else if(option1 === option2){
            document.getElementById('option-error').innerText = 'Options must not duplicate';
            isValid = false;
        } else {
            document.getElementById('option-error').innerText = '';
        }
        // return isValid;
        const options = document.querySelectorAll('#additional-options input.form-control');
        const optionValues = [];
        for (let i = 0; i < options.length; i++) {
            const optionValue = options[i].value.trim();
            if (optionValue === "") {
                document.getElementById('option-error').innerText = 'Please enter all options';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            if (optionValues.includes(optionValue) || optionValue === option1 || optionValue === option2) {
                document.getElementById('option-error').innerText = 'Options must not duplicate';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            optionValues.push(optionValue);
        }
        console.log(optionValues.length);
        for (let i = 0; i < options.length; i++) {
            console.log(options[i].value);
        }
        const correct_answer1 = document.getElementsByName("correct_answer1")[0].value.trim();
        if (correct_answer1 === "") {
            document.getElementById('correct-answer-error').innerText =  'Please enter answer';
            isValid = false;
        } else if (!optionValues.includes(correct_answer1) && option1 !== correct_answer1 && option2 !== correct_answer1) {
            document.getElementById('correct-answer-error').innerText = 'The answer is not on the list of options'
            isValid = false;
        } else {
            document.getElementById('correct-answer-error').innerText = '';
        }

        // Kiểm tra các đáp án đúng còn lại
        const correctAnswers = document.querySelectorAll('#multiple-choice-options input.form-control');
        const correctAnswerValues = [];
        for (let i = 0; i < correctAnswers.length; i++) {
            const correctAnswerValue = correctAnswers[i].value.trim();
            if (correctAnswerValue === "") {
                document.getElementById('correct-answer-error').innerText = 'Please enter all answers';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            if (!optionValues.includes(correctAnswerValue) && option1 !== correct_answer1 && option2 !== correct_answer1) {
                document.getElementById('correct-answer-error').innerText = 'The answer is not on the list of options';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            }
            if (correctAnswerValues.includes(correctAnswerValue) || correctAnswerValue === correct_answer1) {
                document.getElementById('correct-answer-error-multiple').innerText = 'The answers is not duplicate';
                isValid = false;
                break;  // Ngừng kiểm tra khi gặp lỗi đầu tiên
            } else {
                document.getElementById('correct-answer-error-multiple').innerText = '';
            }
            correctAnswerValues.push(correctAnswerValue);
        }
        return isValid;
    }
</script>
</body>
</html>