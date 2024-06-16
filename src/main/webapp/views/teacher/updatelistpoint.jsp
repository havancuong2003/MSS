<%--
  Created by IntelliJ IDEA.
  User: MinHee
  Date: 5/19/2024
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <style>

        .header{
            background-color: green;
            padding: 15px;
            text-align: center;
        }

        h2 {
            text-align: center;

        }

        table {
            width: 60%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .form-row input {
            margin-left: 10px;
            margin-right: 10px;
        }
    </style>
</head>

<div class="header">
    <h1 style="color:white,font-size:200%;">
        Details point for update
    </h1>
</div>

<h2>Update Details</h2>

<form action="updatelistpoint" method="post">
    <table name="table-update">
        <tr>
            <th>ID:</th>
            <td><input type="hidden" name="id" value="${requestScope.markData.id}">${requestScope.markData.id}</td>
        </tr>
        <tr>
            <th>Student ID:</th>
            <td><input type="text" name="student_id" value="${requestScope.markData.studentId}"></td>
        </tr>
        <tr>
            <th>Course Code:</th>
            <td><input type="text" name="coursecode" value="${requestScope.markData.courseCode}"></td>
        </tr>
        <tr>
            <th>Grade Category Name:</th>
            <td><input type="text" name="gradecategory" value="${requestScope.markData.gradeCategoryName}"></td>
        </tr>
        <tr>
            <th>Grade Item Name:</th>
            <td><input type="text" name="gradeitemname" value="${requestScope.markData.gradeItemName}"></td>
        </tr>
        <tr>
            <th>Grade Item Weight:</th>
            <td><input type="text" name="gradeitemweight" value="${requestScope.markData.gradeItemWeight}"></td>
        </tr>
        <tr>
            <th>Grade:</th>
            <td><input type="text" name="grade" value="${requestScope.markData.grade}"></td>
        </tr>
    </table>
    <input type="submit" value="Update">
</form>

</body>
</html>
