<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
        }

        form {
            display: inline;
            margin-right: 10px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="header"></div>
    <h2>Change Request</h2>

    <div id="requestForm" style="">
        <form id="changeRequestForm" method="post" action="change">
            <label for="course">Course:</label>
            <select id="course">
                <c:forEach items="${requestScope.groups}" var="g" varStatus="loop">
                    <option value="${g.course.id}">${g.course.code}</option>
                </c:forEach>
            </select>
            <br>
            <label for="fromStudent">From Student:</label>
            <input type="text" id="fromStudent" readonly="true" value="${requestScope.studentid}"><br>
            <label for="toStudent">To Student:</label>
            <input type="text" id="toStudent" required="true"><br>
            <button id="addRequestButton">Thêm Yêu Cầu</button>
        </form>
    </div>
    <br>
    <c:if test="${requestScope.sizeRequired == 0}">
        <p>No request created</p>
    </c:if>
    <p id="noRequest"></p>
    <c:if test="${requestScope.sizeRequired > 0}">
        <h2>Change Requests</h2>
        <table id="changeRequestTable" border="1">
            <thead>
            <tr>
                <th>Course</th>
                <th>From Student</th>
                <th>To Student</th>
                <th></th> <!-- Cột cho nút Hủy -->
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.allRequired}" var="request">
                <tr>
                    <td>${request.fromGroup.course.code}</td>
                    <td>${request.fromStudent.id}</td>
                    <td>${request.toStudent.id}</td>
                    <td>
                        <button class="deleteButton" data-request-id="${request.id}">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </c:if>


    <div class="header">
        <h2>List requests</h2>
    </div>
    <c:if test="${requestScope.sizeRequiredFromSomeOne == 0}">
        <p>No requests for some one to you</p>
    </c:if>
    <p id="noRequestSomeOne"></p>
    <c:if test="${requestScope.sizeRequiredFromSomeOne > 0}">
        <table id="listRequestsTable" border="1">
            <thead>
            <tr>
                <th>Course</th>
                <th>From Student</th>
                <th>From Group</th>
                <th>To Student</th>
                <th>To Group</th>

                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.allRequiredFromSomeOne}" var="request">
                <tr>
                    <td>${request.fromGroup.course.code}</td>
                    <td>${request.fromStudent.id}</td>
                    <td>${request.fromGroup.name}</td>
                    <td>${request.toStudent.id}</td>

                    <td>${request.toGroup.name}</td>

                    <td>
                        <form id="acceptForm${request.id}">
                            <input type="hidden" name="requestId" value="${request.id}">
                            <input type="hidden" name="action${request.id}" value="accept">
                            <input type="hidden" name="fromST${request.id}" value="${request.fromStudent.id}">
                            <input type="hidden" name="fromGr${request.id}" value="${request.fromGroup.id}">
                            <input type="hidden" name="toSt${request.id}" value="${request.toStudent.id}">
                            <input type="hidden" name="toGr${request.id}" value="${request.toGroup.id}">
                            <input type="submit" class="acceptButton" value="Accept">
                        </form>

                        <form id="rejectForm${request.id}">
                            <input type="hidden" name="requestId" value="${request.id}">
                            <input type="hidden" name="action${request.id}" value="reject">
                            <input type="submit" class="rejectButton" value="Reject">
                        </form>


                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </c:if>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        const listChangeRequests = [];
        $(document).on('click', '.deleteButton', function () {
            const requestId = $(this).data('request-id');


            $.ajax({
                type: 'POST',
                url: '/MyStudySpace_war_exploded/student/deleteRequest',
                data: {requestId: requestId},
                success: function (data) {
                    console.log('data', data);
                    updatePage(data);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });

        $('form[id^="acceptForm"]').on('submit', function (e) {
            e.preventDefault(); // Chặn hành vi mặc định của form
            const data = $(this).serialize();
            const url = '/MyStudySpace_war_exploded/student/acceptChange';
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function (data) {
                    updatePage(data);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });

        $('form[id^="rejectForm"]').on('submit', function (e) {
            e.preventDefault(); // Chặn hành vi mặc định của form
            const data = $(this).serialize();
            const url = '/MyStudySpace_war_exploded/student/rejectChange';
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function (data) {
                    updatePage(data);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });

        // Hàm cập nhật giao diện sau khi thực hiện ajax
        const updatePage = (data) => {
            const allRequiredFromSomeOne = data.allRequiredFromSomeOne;
            const allRequired = data.allRequired;
            const groups = data.groups; // Lấy danh sách các nhóm từ dữ liệu

            // Update changeRequestTable
            if (allRequired.length === 0) {
                $('#noRequest').text("No request created");
                $('#changeRequestTable').css('display', 'none');
                console.log("no request");
            } else {
                $('#noRequest').text("");
                $('#changeRequestTable tbody').empty(); // Clear existing rows
                $.each(allRequired, function (index, request) {
                    const newRow = '<tr><td>' + request.fromGroup.course.code + '</td><td>' + request.fromStudent.id + '</td><td>' + request.toStudent.id + '</td><td><button class="deleteButton" data-request-id="' + request.id + '">Delete</button></td></tr>';
                    $('#changeRequestTable tbody').append(newRow);
                });
                console.log("have request");
            }

            // Update listRequestsTable
            if (allRequiredFromSomeOne.length === 0) {
                $('#noRequestSomeOne').text("No request for someone to you");
                $('#listRequestsTable').css('display', 'none');
            } else {
                console.log('have request for someone to you');
                $('#noRequestSomeOne').text("");
                $('#listRequestsTable tbody').empty(); // Clear existing rows
                $.each(allRequiredFromSomeOne, function (index, request) {
                    const newRow = '<tr>' +
                        '<td>' + request.fromGroup.course.code + '</td>' +
                        '<td>' + request.fromStudent.id + '</td>' +
                        '<td>' + request.fromGroup.name + '</td>' +
                        '<td>' + request.toStudent.id + '</td>' +
                        '<td>' + request.toGroup.name + '</td>' +
                        '<td>' +
                        '<form id="acceptForm' + request.id + '">' +
                        '<input type="hidden" name="requestId" value="' + request.id + '">' +
                        '<input type="hidden" name="action' + request.id + '" value="accept">' +
                        '<input type="hidden" name="fromST' + request.id + '" value="' + request.fromStudent.id + '">' +
                        '<input type="hidden" name="fromGr' + request.id + '" value="' + request.fromGroup.id + '">' +
                        '<input type="hidden" name="toSt' + request.id + '" value="' + request.toStudent.id + '">' +
                        '<input type="hidden" name="toGr' + request.id + '" value="' + request.toGroup.id + '">' +
                        '<input type="submit" class="acceptButton" value="Accept">' +
                        '</form>' +
                        '<form id="rejectForm' + request.id + '">' +
                        '<input type="hidden" name="requestId" value="' + request.id + '">' +
                        '<input type="hidden" name="action' + request.id + '" value="reject">' +
                        '<input type="submit" class="rejectButton" value="Reject">' +
                        '</form>' +
                        '</td>' +
                        '</tr>';
                    $('#listRequestsTable tbody').append(newRow);
                });
            }

            // Update select box #course
            $('#course').empty(); // Clear existing options
            $.each(groups, function (index, group) {
                const newRow = '<option value="' + group.course.id + '">' + group.course.code + '</option>';
                $('#course').append(newRow);
            });
        };
    });
</script>

</body>
</html>

