<%--
  Created by IntelliJ IDEA.
  User: MinHee
  Date: 6/10/2024
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student Marks</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<h1>Student Marks</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Student ID</th>
        <th>Course Code</th>
        <th>Grade Category Name</th>
        <th>Grade Item Name</th>
        <th>Grade Item Weight</th>
        <th>Grade</th>
        <th>More</th>
    </tr>
    <c:forEach items="${markList}" var="mark" varStatus="loop">
        <tr>
            <td>${mark.id}</td>
            <td>${mark.studentId}</td>
            <td>${mark.courseCode}</td>
            <td>${mark.gradeCategoryName}</td>
            <td>${mark.gradeItemName}</td>
            <td>${mark.gradeItemWeight}</td>
            <td>${mark.grade}</td>
            <td>
                <c:if test="${!mark.gradeItemName.equals('Final Exam') && !mark.gradeItemName.equals('Practical Exam')}">
                    <button onclick="Update('${mark.studentId}')">Update</button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function Update(id) {
        window.location.href = "updatelistpoint?id=" + id;
    }
</script>
</body>
</html>