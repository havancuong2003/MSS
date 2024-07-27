
<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/5/2024
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .button-wrapper {
            position: relative;
        }
        .back-link {
            color: #FF6600;
            font-size: 15px;
            position: absolute;
            left: 0;
        }
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
        th.type_question {
            width: 20%;
        }
        th.question {
            width: 35%;
        }
        th.action {
            width: 15%;
        }
        th.created_by {
            width: 15%;
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

        .form-group.row .col-md-6 {
            flex: 1;
            margin: 0 10px;
        }

        .custom-select {
            width: 80%;
        }

        /* Style the select dropdown */
        select.form-control {
            width: 100%;
        }

        /* Style the buttons */
        .modal-footer .btn {
            width: auto;
        }

        /* Styles for the pagination */
        /*.pagination {*/
        /*    justify-content: center;*/
        /*}*/

        /*.pagination li {*/
        /*    display: inline;*/
        /*    margin: 0 2px;*/
        /*}*/

        /*.pagination li a {*/
        /*    padding: 6px 12px;*/
        /*    border: 1px solid #ddd;*/
        /*    color: #007bff;*/
        /*    text-decoration: none;*/
        /*    cursor: pointer;*/
        /*}*/

        /*.pagination li a:hover, .pagination li a:focus {*/
        /*    background-color: #f1f1f1;*/
        /*}*/

        /*.pagination li.active a {*/
        /*    background-color: #007bff;*/
        /*    color: white;*/
        /*    border-color: #007bff;*/
        /*}*/

        /* Added styles for centered modal footer */
        .modal-footer {
            justify-content: center;
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
        .button-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            font-size: 14px;
            color: #ffffff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }
        .button-link:hover {
            .button-link:hover {
                background-color: #0056b3; /* Màu nền khi hover */
                color: #ffffff; /* Màu chữ khi hover */
            }
        }

        #messageContainer {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            color: white;
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


    </style>
</head>
<body>
<jsp:include page="/views/common/header.jsp"></jsp:include>
<div class="container" style="margin-top: 70px">
    <div class="custom-form-wrapper">
        <input type="hidden" id="basicQuestionOfExercise" value="${basicQuestionOfExercise}">
        <input type="hidden" id="lowQuestionOfExercise" value="${lowQuestionOfExercise}">
        <input type="hidden" id="highQuestionOfExercise" value="${highQuestionOfExercise}">
        <form class="custom-form" action="select-question-bank" method="get">
            <input type="hidden" name="exercise_id" value="${exercise_id}">
            <input type="hidden" name="basicQuestion" value="${basicQuestion}">
            <input type="hidden" name="lowQuestion" value="${lowQuestion}">
            <input type="hidden" name="highQuestion" value="${highQuestion}">
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
        <form class="custom-form" action="select-question-bank" method="get">
            <input type="hidden" name="exercise_id" value="${exercise_id}">
            <input type="hidden" name="basicQuestion" value="${basicQuestion}">
            <input type="hidden" name="lowQuestion" value="${lowQuestion}">
            <input type="hidden" name="highQuestion" value="${highQuestion}">
            <input type="hidden" name="group_id" value="${group_id}">
            <input type="hidden" name="course_id" value="${course_id}">
            <input type="text" placeholder="Search by question..." name="search">
            <button type="submit" class="custom-button" style="background-color: #FF6600">Search</button>
        </form>
    </div>

    <div id="messageContainer"></div>
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2 style="color: whitesmoke">Questions<b style="color: whitesmoke"> Bank</b></h2>
                </div>
            </div>
        </div>
        <input type="hidden" name="exercise_id" value="${exercise_id}">
        <table class="table table-striped table-hover">
            <div class="note">
                <p class="font-bold">Note</p>
                <p>The select button is disabled because it already exists in the exercise.</p>
            </div>
            <thead>
            <tr>
                <th>ID</th>
                <th class="question">Question</th>
                <th class="type_question">Type Question</th>
                <th class="created_by">Created by</th>
                <th class="action">Action</th>
                <th class="selected">Select</th>
            </tr>
            </thead>
            <c:forEach var="o" items="${listBankQuestion}">
                <tbody>
                <tr>
                    <td>${o.bank_question_id}</td>
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
                    <td>${o.created_by}</td>
                    <td>
                        <a href="#" class="view" data-question-id="${o.bank_question_id}" data-toggle="modal"><i class="material-icons text-primary" data-toggle="tooltip" title="View">visibility</i></a>
                    </td>
                    <c:if test="${o.status == 0}">
                        <td style="text-align: center; vertical-align: middle;">
                            <input type="checkbox" name="choose" value="${o.bank_question_id}" data-type-question="${o.type_question}" style="width: 18px; height: 18px; cursor: pointer;">
                        </td>
                    </c:if>
                    <c:if test="${o.status == 1}">
                        <td style="text-align: center; vertical-align: middle;">
                            <input type="checkbox" name="choose" value="${o.bank_question_id}" style="width: 18px; height: 18px; cursor: pointer;" disabled>
                        </td>
                    </c:if>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <div class="pagination-container">
            <c:if test="${isRandom != 1}">
                <ul class="pagination" style="color: #FF6600">
                    <c:if test="${tag > 1}">
                        <li class="page-item" style="color: #FF6600"><a style="color: #FF6600" href="select-question-bank?page=${tag-1}&type_question=${type_question}&exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}&group_id=${group_id}&course_id=${course_id}">Previous</a></li>
                    </c:if>
                    <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="select-question-bank?page=${i}&type_question=${type_question}&exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}&group_id=${group_id}&course_id=${course_id}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="select-question-bank?page=${tag+1}&type_question=${type_question}&exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}&group_id=${group_id}&course_id=${course_id}" class="page-link">Next</a></li>
                    </c:if>
                    <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                    </c:if>
                </ul>
            </c:if>

            <c:if test="${isRandom == 1}">
                <ul class="pagination" style="color: #FF6600">
                    <c:if test="${tag > 1}">
                        <li class="page-item" style="color: #FF6600"><a style="color: #FF6600" href="select-question-bank?page=${tag-1}&type_question=${type_question}&exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}&group_id=${group_id}&course_id=${course_id}">Previous</a></li>
                    </c:if>
                    <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="select-question-bank?page=${i}&type_question=${type_question}&exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}&group_id=${group_id}&course_id=${course_id}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="select-question-bank?page=${tag+1}&type_question=${type_question}&exercise_id=${exercise_id}&basicQuestion=${basicQuestion}&lowQuestion=${lowQuestion}&highQuestion=${highQuestion}&group_id=${group_id}&course_id=${course_id}" class="page-link">Next</a></li>
                    </c:if>
                    <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                    </c:if>
                </ul>
            </c:if>
        </div>
        <div class="button-wrapper">
            <a class="back-link" style="color: #FF6600;font-size: 15px;float: left" href="manage-question?exercise_id=${exercise_id}&group_id=${group_id}&course_id=${course_id}" id="backToCreateQuestion"> <i class="fas fa-arrow-left" style="color: #FF6600"></i> Back to manage question</a>
            <button type="submit" id="selectQuestionsBtn" >Select question for exercise</button>
        </div>
    </div>
</div>


<!-- Modal display information of question -->
<div class="modal fade" id="questionModal" tabindex="-1" role="dialog" aria-labelledby="questionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="questionModalLabel" style="color: white">Question Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Place holder for question details -->
                <div id="questionDetails" class="question-container">
                    <div id="question"></div>
                    <div id="answers"></div>
                    <div id="correctAnswer"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery.noConflict();
    jQuery(document).ready(function($) {
        var basicQuestionOfExercise = parseInt($('#basicQuestionOfExercise').val());
        var lowQuestionOfExercise = parseInt($('#lowQuestionOfExercise').val());
        var highQuestionOfExercise = parseInt($('#highQuestionOfExercise').val());
        var numMissQuestion = parseInt("${numMissQuesion}");
        var basicQuestion = parseInt("${basicQuestion}");
        var lowQuestion = parseInt("${lowQuestion}");
        var highQuestion = parseInt("${highQuestion}");
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
        function getAllTypeQuestionsSelected() {
            var selectedCheckboxes = JSON.parse(localStorage.getItem('selectedCheckboxes')) || {};
            var typeQuestionsSelected = [];

            Object.keys(selectedCheckboxes).forEach(function(id) {
                var type = $('input[name="choose"][value="' + id + '"]').data('type-question');
                if (type !== undefined) {
                    typeQuestionsSelected.push(type);
                }
            });

            return typeQuestionsSelected;
        }
        var exercise_id = "${exercise_id}"
        var numQuestion = "${numQuestion}"
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
            <%--var basicQuestionOfExercise = parseInt("${basicQuestionOfExercise}");--%>
            <%--var lowQuestionOfExercise = parseInt("${lowQuestionOfExercise}");--%>
            <%--var highQuestionOfExercise = parseInt("${highQuestionOfExercise}");--%>
            console.log(numMissQuestion);
            console.log('basic: ' + basicQuestion);
            console.log('low:' + lowQuestion);
            console.log('high:' + highQuestion);
            console.log('basicE:' + basicQuestionOfExercise);
            console.log('lowE:' + lowQuestionOfExercise);
            console.log('highE:' + highQuestionOfExercise);
            // Sử dụng hàm mới để lấy các type_questions đã chọn
            var typeQuestionsSelected = getAllTypeQuestionsSelected(selectedIds);

            console.log('Selected type_questions: ' + typeQuestionsSelected);
            var countBasic = typeQuestionsSelected.filter(function(type) { return type == 1; }).length;
            var countLow = typeQuestionsSelected.filter(function(type) { return type == 2; }).length;
            var countHigh = typeQuestionsSelected.filter(function(type) { return type == 3; }).length;

            console.log('Basic questions selected: ' + countBasic);
            console.log('Low questions selected: ' + countLow);
            console.log('High questions selected: ' + countHigh);
            if(selectedIds.length > numMissQuestion){
                if(numMissQuestion == 1 || numMissQuestion == 0){
                    document.getElementById('messageContainer').innerText = 'You are missing ' + numMissQuestion +  ' question for your excercise';
                } else {
                    document.getElementById('messageContainer').innerText = 'You are missing ' + numMissQuestion +  ' questions for your excercise';
                }
                document.getElementById('messageContainer').style.backgroundColor = '#f44336';
                return;
            }
            console.log("so luong basic question con lai:" + (basicQuestion-basicQuestionOfExercise));
            if(countBasic !==0) {
                if (countBasic > (basicQuestion - basicQuestionOfExercise)) {
                    document.getElementById('messageContainer').style.backgroundColor = '#f44336';
                    document.getElementById('messageContainer').innerText = 'Basic questions cannot be selected because your exercise has enough number of basic questions(You are missing basic question:' + (basicQuestion - basicQuestionOfExercise) + ' ,low question: ' + (lowQuestion - lowQuestionOfExercise) + ' ,high question: ' + (highQuestion - highQuestionOfExercise) + ')';
                    return;
                }
            }
            console.log("so luong low con lai: " + (lowQuestion-lowQuestionOfExercise))
            if(countLow !== 0) {
                if (countLow > (lowQuestion - lowQuestionOfExercise)) {
                    document.getElementById('messageContainer').style.backgroundColor = '#f44336';
                    document.getElementById('messageContainer').innerText = 'Low questions cannot be selected because your exercise has enough number of low questions (You are missing basic question:' + (basicQuestion - basicQuestionOfExercise) + ' ,low question: ' + (lowQuestion - lowQuestionOfExercise) + ' ,high question: ' + (highQuestion - highQuestionOfExercise) + ')';
                    return;
                }
            }
            console.log("so luong high con lai: " + (highQuestion-highQuestionOfExercise))
            if(countHigh !== 0) {
                if (countHigh > (highQuestion - highQuestionOfExercise)) {
                    document.getElementById('messageContainer').style.backgroundColor = '#f44336';
                    document.getElementById('messageContainer').innerText = 'High questions cannot be selected because your exercise has enough number of high questions (You are missing basic question:' + (basicQuestion - basicQuestionOfExercise) + ' ,low question: ' + (lowQuestion - lowQuestionOfExercise) + ' ,high question: ' + (highQuestion - highQuestionOfExercise) + ')';
                    return;
                }
            }


            console.log('Sending JSON data to server:');
            console.log({
                exercise_id: exercise_id,
                selectedIds: selectedIds
            });

            // Gửi selectedIds về server bằng AJAX
            $.ajax({
                url: 'select-question-bank',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify({
                    exercise_id: exercise_id,
                    selectedIds: selectedIds
                }),
                success: function(response) {
                    console.log('Selected IDs sent to server successfully');
                    console.log(response); // In ra phản hồi từ server để kiểm tra
                    localStorage.removeItem('selectedCheckboxes');
                    numMissQuestion -= selectedIds.length;
                    console.log(numMissQuestion);
                    // Cập nhật lại số lượng câu hỏi
                    basicQuestionOfExercise += countBasic;
                    lowQuestionOfExercise += countLow;
                    highQuestionOfExercise += countHigh;

                    console.log('Updated basicQuestionOfExercise: ' + basicQuestionOfExercise);
                    console.log('Updated lowQuestionOfExercise: ' + lowQuestionOfExercise);
                    console.log('Updated highQuestionOfExercise: ' + highQuestionOfExercise);
                    $('#basicQuestionOfExercise').val(basicQuestionOfExercise);
                    $('#lowQuestionOfExercise').val(lowQuestionOfExercise);
                    $('#highQuestionOfExercise').val(highQuestionOfExercise);
                    // location.reload();
                    $('input[type="checkbox"][name="choose"]').each(function() {
                        if ($(this).is(':checked')) {
                            $(this).prop('checked', false); // Bỏ chọn checkbox
                            $(this).prop('disabled', true); // Vô hiệu hóa checkbox
                        }
                    });
                    document.getElementById('messageContainer').innerText = response.message;
                    document.getElementById('messageContainer').style.backgroundColor = '#4CAF50'

                    if (numMissQuestion <= 0) {
                        document.getElementById('messageContainer').innerText = 'All questions have been selected for your exercise!';
                        $('#selectQuestionsBtn').prop('disabled', true); // Vô hiệu hóa nút chọn câu hỏi
                    }
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
        $('#selectQuestionsBtn').on('click', function(event) {
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


        $('.view').on('click', function(event) {
            event.preventDefault(); // Prevent the default button click behavior

            // Get the application_id from the hidden input field
            var questionId = $(this).data('question-id');
            var exerciseId = $("input[name='exercise_id']").val(); // Lấy giá trị của exercise_id từ input hidden

            // Send AJAX request to the servlet to get the response data
            $.ajax({
                url: "select-question-bank",
                type: "GET",
                data: {
                    question_id: questionId,
                    status : 'view',
                    numQuestion : numQuestion,
                    exercise_id : exerciseId
                },
                dataType: "json",
                success: function(data) {
                    // Update the modal content with the received response data
                    var questionHtml = '';
                    questionHtml += '<div style="display: flex; margin-bottom: 10px;">';
                    questionHtml += '<div style="font-weight: bold; margin-right: 5px;">' + 'Question: ' + '</div>';
                    questionHtml += '<div>' + data.bankQuestion.question + '</div>';
                    questionHtml += '</div>';
                    $('#question').html(questionHtml);
                    var answersHtml = '';
                    for (var i = 0; i < data.listBankAnswers.length; i++) {
                        answersHtml += '<div style="display: flex; margin-bottom: 5px;">';
                        answersHtml += '<div style="font-weight: bold; margin-right: 5px;">' + 'Option ' + (i+1) + ':' + '</div>';
                        answersHtml += '<div class="option-value">' + data.listBankAnswers[i].answer + '</div>';
                        answersHtml += '</div>';
                    }
                    $('#answers').html(answersHtml);
                    var correctAnswerHtml = '';
                    correctAnswerHtml += `<div style="font-weight: bold">  Correct Answer  </div>`
                    for(var i=0;i<data.listBankAnswers.length;i++){
                        if(data.listBankAnswers[i].status == 1){
                            correctAnswerHtml += '<div style="display: flex; margin-bottom: 5px">'
                            correctAnswerHtml += '<div style="font-weight: bold">' + 'Option ' + (i+1) + ':' + '</div>'
                            correctAnswerHtml += '<div class="option-value">' + data.listBankAnswers[i].answer + '</div>';
                            correctAnswerHtml += '</div>'
                        }
                    }
                    $('#correctAnswer').html(correctAnswerHtml);

                    // Show the modal
                    $('#questionModal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error("Failed to fetch response:", status, error);
                }
            });
        });
    });
</script>
<jsp:include page="/views/common/footer.jsp"></jsp:include>
</body>
</html>
