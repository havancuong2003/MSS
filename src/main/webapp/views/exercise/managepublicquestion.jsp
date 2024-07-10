<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 7/7/2024
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
            background: #007bff;
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
            color: #007bff;
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
            background-color: #e9ecef;
            color: #0056b3;
        }

        .pagination li.active a {
            background-color: #007bff;
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
        /* CSS */
        .question-container {
            margin-bottom: 20px;
        }

        .question-container .question {
            font-weight: bold;
        }

        .question-container .answers {
            display: flex;
            flex-direction: column;
        }

        .question-container .answer {
            display: flex;
            margin-bottom: 5px;
        }

        .question-container .answer .option-number {
            font-weight: bold;
            margin-right: 5px;
        }

        .question-container .answer .option-value {
            margin-left: 5px;
        }

    </style>
</head>
<body>
<div class="container" style="margin-top: 70px">
    <div class="custom-form-wrapper">
        <form class="custom-form" action="manage-public-question" method="get">
            <select name="type_question">
                <option value="0" class="form-control">Choose all questions</option>
                <option value="1" ${type_question == "1" ? "selected" : ""} class="form-control">Basic Question</option>
                <option value="2" ${type_question == "2" ? "selected" : ""} class="form-control">Low Application Question</option>
                <option value="3" ${type_question == "3" ? "selected" : ""} class="form-control">High Application Question</option>
            </select>
            <button type="submit" class="custom-button">Select</button>
        </form>
    </div>
    <div class="custom-form-wrapper">
        <form class="custom-form" action="manage-public-question" method="get">
            <input type="text" placeholder="Search by question..." name="search">
            <button type="submit" class="custom-button">Search</button>
        </form>
    </div>
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Public Questions</b></h2>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th class="question">Question</th>
                <th class="type_question">Type Question</th>
                <th class="created_by">Created by</th>
                <th class="action">Action</th>
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
                    <td>${o.exercise.teacher.account.fullname}</td>
                    <c:if test="${o.status == 1}">
                        <td>
                            <a href="#" class="view" data-question-id="${o.question_id}" data-toggle="modal"><i class="material-icons text-primary" data-toggle="tooltip" title="View">visibility</i></a>
                            <a href="manage-public-question?question_id=${o.question_id}&page=${tag}&status=accept" class="accept" onclick="return confirm('Are you sure you want to accept this question?');" ><i class="material-icons text-success" title="Accept">done</i></a>
                            <a href="manage-public-question?question_id=${o.question_id}&page=${tag}&status=refuse" class="reject" onclick="return confirm('Are you sure you want to reject this question?');" ><i class="material-icons text-danger" title="Reject">cancel</i></a>
                        </td>
                    </c:if>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <p style="text-align: center; font-style: italic;font-size: 18px;margin: 20px 0">${mess_list_question}</p>
        <div class="pagination-container">
            <ul class="pagination">
                <c:if test="${searchtxt != null}" >
                    <c:if test="${tag > 1}">
                        <li class="page-item"><a href="manage-public-question?page=${tag-1}&search=${searchtxt}">Previous</a></li>
                    </c:if>
                    <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="manage-public-question?page=${i}&search=${searchtxt}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="manage-public-question?page=${tag+1}&search=${searchtxt}" class="page-link">Next</a></li>
                    </c:if>
                    <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                    </c:if>
                </c:if>
                <c:if test="${searchtxt == null}">
                    <c:if test="${tag > 1}">
                        <li class="page-item"><a href="manage-public-question?page=${tag-1}&type_question=${type_question}&status_question=${status_question}">Previous</a></li>
                    </c:if>
                    <c:if test="${tag ==1}">
                        <li class="page-item"><a href="#">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${i == tag ? 'active' : ''}">
                            <a href="manage-public-question?page=${i}&type_question=${type_question}&status_question=${status_question}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag < endPage}" >
                        <li class="page-item" ><a href="manage-public-question?page=${tag+1}&type_question=${type_question}&status_question=${status_question}" class="page-link">Next</a></li>
                    </c:if>
                    <c:if test="${tag == endPage}">
                        <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                    </c:if>
                </c:if>

            </ul>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
    jQuery.noConflict();
    jQuery(document).ready(function($) {
        $('.view').on('click', function(event) {
            event.preventDefault(); // Prevent the default button click behavior

            // Get the application_id from the hidden input field
            var questionId = $(this).data('question-id');

            // Send AJAX request to the servlet to get the response data
            $.ajax({
                url: "manage-public-question",
                type: "GET",
                data: {
                    question_id: questionId,
                    status : 'view'
                },
                dataType: "json",
                success: function(data) {
                    // Update the modal content with the received response data
                    var questionHtml = '';
                    questionHtml += '<div style="display: flex; margin-bottom: 10px;">';
                    questionHtml += '<div style="font-weight: bold; margin-right: 5px;">' + 'Question: ' + '</div>';
                    questionHtml += '<div>' + data.question.question + '</div>';
                    questionHtml += '</div>';
                    $('#question').html(questionHtml);
                    var answersHtml = '';
                    for (var i = 0; i < data.listAnswer.length; i++) {
                        answersHtml += '<div style="display: flex; margin-bottom: 5px;">';
                        answersHtml += '<div style="font-weight: bold; margin-right: 5px;">' + 'Option ' + (i+1) + ':' + '</div>';
                        answersHtml += '<div class="option-value">' + data.listAnswer[i].answer + '</div>';
                        answersHtml += '</div>';
                    }
                    $('#answers').html(answersHtml);
                    var correctAnswerHtml = '';
                    correctAnswerHtml += `<div style="font-weight: bold">  Correct Answer  </div>`
                    for(var i=0;i<data.listAnswer.length;i++){
                        if(data.listAnswer[i].status == 1){
                            correctAnswerHtml += '<div style="display: flex; margin-bottom: 5px">'
                            correctAnswerHtml += '<div style="font-weight: bold">' + 'Option ' + (i+1) + ':' + '</div>'
                            correctAnswerHtml += '<div class="option-value">' + data.listAnswer[i].answer + '</div>';
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
</body>
</html>
