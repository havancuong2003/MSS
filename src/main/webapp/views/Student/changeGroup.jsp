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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<div class="container">

    <div class="header"></div>
    <h2>Change Request</h2>

    <div id="requestForm" style="">
        <form id="changeRequestForm">
            <label for="course">Course:</label>
            <select id="course" name="course">
                <c:forEach items="${requestScope.groups}" var="g" varStatus="loop">
                    <option value="${g.course.id}">${g.course.code}</option>
                </c:forEach>
            </select>
            <br>
            <label for="fromStudent">From Student:</label>
            <input type="text" id="fromStudent" name="fromStudent" readonly="true"
                   value="${requestScope.studentid}"><br>

            <label for="toStudent">To Student:</label>
            <input type="text" id="toStudent" name="toStudent" required="true"><br>
            <button id="addRequestButton">Thêm Yêu Cầu</button>
        </form>
    </div>
    <br>


    <h2>Change Requests
        <c:if test="${requestScope.sizeRequired == 0}">
            <span id="noRequest">( No request created )
            </span>
        </c:if>
    </h2>
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
        <c:if test="${requestScope.sizeRequired > 0}">
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
        </c:if>
        </tbody>

    </table>


    <div class="header">
        <h2>list Requests

            <span id="noRequestForU"> <c:if test="${requestScope.sizeRequiredFromSomeOne == 0}">( No request for you )
            </c:if>  </span>

        </h2>
    </div>


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
        <c:if test="${requestScope.sizeRequiredFromSomeOne > 0}">
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
        </c:if>
        </tbody>
    </table>


</div>
<script>
    $(document).ready(function () {

        let listChangeRequests = [];
        const firstMountPage = () => {
            <c:forEach items="${requestScope.allRequired}" var="request">
            listChangeRequests.push({
                cid: '${request.id}',
                course: '${request.fromGroup.course.id}',
                fromStudent: '${request.fromStudent.id}',
                toStudent: '${request.toStudent.id}'
            });
            </c:forEach>
        }

        firstMountPage();

        const checkCourseExist = (courseID) => {
            let exists = false;
            $.each(listChangeRequests, function (index, request) {
                if (request.course == courseID) {
                    exists = true;
                    return false; // Break the loop
                }
            });
            return exists;
        };

        $('#changeRequestForm').on('submit', function (e) {
            e.preventDefault(); // Chặn hành vi mặc định của form
            const data = $(this).serialize();
            const course = $('#course').val();
            console.log('checkCourseExist', checkCourseExist(course));
            console.log('course', course);
            console.log('listChangeRequests', listChangeRequests);
            if (checkCourseExist(course)) {
                alert("You have already created request for this course");
                return;
            }

            $.ajax({
                type: 'POST',
                url: "/MyStudySpace_war_exploded/student/createRequest",
                data: data,
                success: function (data) {
                    // updatePage(data);
                    console.log('data add', data);
                    if(data.status == "success"){
                        updatePage(data);
                    }
                    else{
                        alert(data.error);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        })

        $(document).on('click', '.deleteButton', function () {
            const requestId = $(this).data('request-id');
            listChangeRequests = listChangeRequests.filter(request => request.cid != requestId);
            console.log('listChangeRequests after delete', listChangeRequests);
            console.log(" requestId", requestId);
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

        const bindAcceptRejectForms = () => {
            $('form[id^="acceptForm"]').off('submit').on('submit', function (e) {
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

            $('form[id^="rejectForm"]').off('submit').on('submit', function (e) {
                e.preventDefault(); // Chặn hành vi mặc định của form
                const data = $(this).serialize();
                const url = '/MyStudySpace_war_exploded/student/rejectChange';
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: data,
                    success: function (data) {
                        console.log('data reject', data);
                        updatePage(data);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error:', error);
                    }
                });
            });
        };


        const updatePage = (data) => {
            const allRequiredFromSomeOne = data.allRequiredFromSomeOne;
            const allRequired = data.allRequired;
            const groups = data.groups;
            console.log("allRequired", allRequired);
            // Update changeRequestTable
            if (allRequired.length == 0) {
                $('#noRequest').text(" ( No request created ) ");
                $('#changeRequestTable tbody').empty(); // Clear existing rows
                console.log("no request");
            } else {
                $('#noRequest').text("");
                $('#changeRequestTable tbody').empty(); // Clear existing rows

                listChangeRequests = [];

                $.each(allRequired, function (index, request) {
                    const newRow = '<tr><td>' + request.fromGroup.course.code + '</td><td>' + request.fromStudent.id + '</td><td>' + request.toStudent.id + '</td><td><button class="deleteButton" data-request-id="' + request.id + '">Delete</button></td></tr>';
                    $('#changeRequestTable tbody').append(newRow);
                    listChangeRequests.push({
                        cid: request.id,
                        course: request.fromGroup.course.id,
                        fromStudent: request.fromStudent.id,
                        toStudent: request.toStudent.id
                    });
                });

            }

            // Update listRequestsTable
            if (allRequiredFromSomeOne.length == 0) {
                console.log('size', allRequiredFromSomeOne.length);
                $('#noRequestForU').html(`<span>  ( No request for you )</span>`);
                $('#listRequestsTable tbody').empty(); // Clear existing rows
                console.log("no request for  you");
            } else {
                console.log('have request for  you');
                $('#noRequestForU').text("");

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
            bindAcceptRejectForms();

        };
        bindAcceptRejectForms();
    });
</script>
</body>
</html>

