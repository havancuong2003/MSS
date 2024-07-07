

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <div class="header">
        <h2>List requests ${s}</h2>
    </div>
    <c:if test="${requestScope.sizeRequired == 0}">
        <p>No requests</p>
    </c:if>
    <c:if test="${requestScope.sizeRequired > 0}">
        <table border="1">
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
            <c:forEach items="${requestScope.allRequired}" var="request">
                <tr>
                    <td>${request.fromGroup.course.code}</td>
                    <td>${request.fromStudent.account.fullname}</td>
                    <td>${request.fromGroup.name}</td>
                    <td>${request.toStudent.account.fullname}</td>
                    <td>${request.toGroup.name}</td>
                    <td>
                        <button>Accept</button>
                        <button>Reject</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </c:if>


</div>
</body>
</html>

