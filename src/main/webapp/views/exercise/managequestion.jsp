<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/19/2024
  Time: 1:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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


    </style>
</head>
<body>
<div class="container" style="margin-top: 70px">
    <div class="custom-form-wrapper">
        <form class="custom-form" action="create-question" method="get">
            <input type="hidden" name="exercise_id" value="${exercise_id}">
            <select name="type_question">
                <option value="0" class="form-control">Choose type question</option>
                <option value="1" ${type_question == "1" ? "selected" : ""} class="form-control">Basic Question</option>
                <option value="2" ${type_question == "2" ? "selected" : ""} class="form-control">Low Application Question</option>
                <option value="3" ${type_question == "3" ? "selected" : ""} class="form-control">High Application Question</option>
            </select>
            <button type="submit" class="custom-button">Select</button>
        </form>
    </div>
    <div class="custom-form-wrapper">
        <form class="custom-form" action="create-question" method="get">
            <input type="hidden" name="exercise_id" value="${exercise_id}">
            <input type="text" placeholder="Search by question..." name="search">
            <button type="submit" class="custom-button">Search</button>
        </form>
    </div>
    <%--    <c:if test="${mess_share != null}">--%>
    <%--        <script>--%>
    <%--            // Sử dụng window.onload để chắc chắn rằng toàn bộ document đã được load--%>
    <%--            window.onload = function() {--%>
    <%--                alert('Thông báo: ${mess_share}');--%>
    <%--            };--%>
    <%--        </script>--%>
    <%--    </c:if>--%>
    <c:if test="${mess_share != null}">
        <div class="message success-message">${mess_share}</div>
    </c:if>
    <c:if test="${mess_share_fail != null}">
        <div class="message error-message">${mess_share_fail}</div>
    </c:if>
    <form action="share-question" id="questionForm" method="post">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Question</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="select-question-bank?exercise_id=${exercise_id}"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Get Questions From Bank</span></a>
                        <a href="#addQuestionModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Question</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
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
                            <a href="#"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#" class="delete" data-toggle="tooltip" title="Delete"><i class="material-icons">&#xE872;</i></a>
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
            <div class="button-wrapper">
                <button type="submit" id="publicQuestionButton" >Public question for bank</button>
                <input type="hidden" name="exercise_id" value="${exercise_id}">
                <input type="hidden" name="status" value="public">
                <input type="hidden" name="page" value="${tag}">
            </div>
            <div class="pagination-container">
                <ul class="pagination">
                    <c:if test="${search != null}" >
                    <c:if test="${tag > 1}">
                    <li class="page-item"><a href="create-question?page=${tag-1}&search=${search}">Previous</a></li>
                    </c:if>
                    <c:if test="${tag ==1}">
                    <li class="page-item"><a href="#">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                    <li class="page-item ${i == tag ? 'active' : ''}">
                        <a href="create-question?page=${i}&search=${search}">${i}</a>
                    </li>
                    </c:forEach>
                    <c:if test="${tag < endPage}" >
                    <li class="page-item" ><a href="create-question?page=${tag+1}&search=${search}" class="page-link">Next</a></li>
                    </c:if>
                    <c:if test="${tag == endPage}">
                    <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                    </c:if>
                    </c:if>

                    <c:if test="${search == null}" >
                    <c:if test="${tag > 1}">
                    <li class="page-item"><a href="create-question?page=${tag-1}&exercise_id=${exercise_id}&type_question=${type_question}">Previous</a></li>
                    </c:if>
                    <c:if test="${tag ==1}">
                    <li class="page-item"><a href="#">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                    <li class="page-item ${i == tag ? 'active' : ''}">
                        <a href="create-question?page=${i}&exercise_id=${exercise_id}&type_question=${type_question}">${i}</a>
                    </li>
                    </c:forEach>
                    <c:if test="${tag < endPage}" >
                    <li class="page-item" ><a href="create-question?page=${tag+1}&exercise_id=${exercise_id}&type_question=${type_question}" class="page-link">Next</a></li>
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
            <form action="create-question" method="post">
                <input type="hidden" value="${exercise_id}" name="exercise_id">
                <input type="hidden" value="${tag}" name="page">
                <input type="hidden" value="${type_question}" name="type_question">
                <input type="hidden" value="${search}" name="search">
                <input type="hidden" id="optionCount" value="2" name="optionCount">
                <input type="hidden" id="correctAnswerCount" value="1" name="correctAnswerCount">
                <input type="hidden" id="share_question_input" name="share_question" value="0">
                <div class="modal-body">
                    <div  class="form-container">
                        <div class="form-group">
                            <select name="type_question_modal" class="form-control">
                                <option value="0" class="form-control">Choose type question</option>
                                <option value="1" ${type_question_modal == "1" ? "selected" : ""} class="form-control">Basic Question</option>
                                <option value="2" ${type_question_modal == "2" ? "selected" : ""} class="form-control">Low Application Question</option>
                                <option value="3" ${type_question_modal == "3" ? "selected" : ""} class="form-control">High Application Question</option>
                            </select>
                        </div>
                        <div style="text-align: center">
                            <p style="color: red">${mess_type_question}</p>
                        </div>
                        <div class="form-group">
                            <input name="question" type="text" class="form-control" value="${question}" placeholder="Câu hỏi..." >
                        </div>
                        <div style="text-align: center">
                            <p style="color: red">${mess_question}</p>
                        </div>
                        <div class="form-group">
                            <input name="option1" type="text" class="form-control" value="${option[0]}" placeholder="Tùy chọn A..." >
                        </div>
                        <div class="form-group">
                            <input name="option2" type="text" class="form-control" value="${option[1]}" placeholder="Tùy chọn B..." >
                        </div>
                        <div id="additional-options" style="width: 100%; display: flex;justify-content: center; flex-wrap: wrap">
                            <c:forEach var="i" begin="3" end="${option.size()}">
                                <div class="form-group">
                                    <input name="option${i}" type="text" class="form-control" value="${option[i-1]}" placeholder="Tùy chọn ${['A', 'B', 'C', 'D', 'E', 'F'][i-1]}..." >
                                </div>
                            </c:forEach>
                        </div>
                        <div style="text-align: center">
                            <p style="color: red">${mess_option}</p>
                        </div>
                        <div class="form-group row">
                            <button type="button" id="add-option" class="btn btn-secondary col-md-6">Thêm tùy chọn</button>
                            <button type="button" id="remove-option" class="btn btn-danger col-md-6">Xóa tùy chọn</button>
                        </div>
                        <div class="form-group">
                            <input name="correct_answer1" type="text" value="${correct_answer[0]}" class="form-control" placeholder="Đáp án đúng">
                        </div>
                        <div id="multiple-choice-options" style="width: 100%; display: flex;justify-content: center; flex-wrap: wrap">
                            <c:forEach var="i" begin="2" end="${correct_answer.size()}">
                                <div class="form-group">
                                    <input name="correct_answer${i}" type="text" class="form-control" value="${correct_answer[i-1]}" placeholder="Dap an dung">
                                </div>
                            </c:forEach>
                        </div>
                        <div style="text-align: center">
                            <p style="color: red">${mess_correct_answer}</p>
                        </div>
                        <div class="form-group row">
                            <button type="button" id="add-multiple-choice" class="btn btn-secondary col-md-6">Thêm đáp án đúng</button>
                            <button type="button" id="remove-multiple-choice" class="btn btn-danger col-md-6">Xóa đáp án</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="button-group">
                    <button type="button" class="custom-button btn btn-success" onclick="location.href = '#'">Cancel</button>
                    <input type="submit" class="btn btn-success" value="Add">
                    <input type="submit" class="btn btn-success" value="Share to question bank" onclick="shareQuestion()">
                </div>
            </form>
        </div>
    </div>
</div>
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
        newOptionInput.placeholder = 'Tùy chọn ' + String.fromCharCode(64 + optionCount) + '...';
        // newOptionInput.required = true;

        newOptionDiv.appendChild(newOptionInput);
        document.getElementById('additional-options').appendChild(newOptionDiv);
        document.getElementById('optionCount').value = optionCount
        optionCount++;
    });
    // remove option
    document.getElementById('remove-option').addEventListener('click', function () {
        if (optionCount > 3) { // Ensure at least two options remain
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
        newMultipleChoiceInput.placeholder = 'Đáp án đúng';
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
    $(document).ready(function() {
        // Biến để kiểm tra lần đầu vào trang
        var isFirstLoad = <%= Boolean.TRUE.equals(request.getAttribute("firstLoad")) %>;

        // Hàm để hiển thị modal addQuestion
        function showAddQuestionModal() {
            $('#addQuestionModal').modal('show');
        }

        // Kiểm tra nếu không phải lần đầu vào trang và có thông báo từ Servlet thì hiển thị modal
        var mess_type_question = '<%= request.getAttribute("mess_type_question") %>';
        var mess_question = '<%= request.getAttribute("mess_question") %>';
        var mess_option = '<%= request.getAttribute("mess_option") %>';
        var mess_correct_answer = '<%= request.getAttribute("mess_correct_answer") %>';

        if ((mess_type_question || mess_question || mess_option || mess_correct_answer) && !isFirstLoad) {
            showAddQuestionModal();
        }
    });

</script>
</body>
</html>
