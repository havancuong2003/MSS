<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/15/2024
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Lớp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #007bff;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header {
            background-color: #FF6600; /* Cam */
            color: #FFFFFF; /* Trắng */
            padding: 20px;
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
        }
        .header a {
            position: absolute;
            left: 20px;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #0056b3;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .header a:hover {
            background-color: #003d80;
            color:white;
        }

        .container {
            width: 80%;
            margin: 100px auto;
            padding-top: 60px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #dddddd;
            padding: 30px;
            text-align: left;
            border-radius: 3px;
        }

        th {
            background-color: #FF6600; /* Cam */
            color: #FFFFFF; /* Trắng */
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s, text-shadow 0.3s;
        }

        a:hover {
            color: #0056b3;
            text-shadow: 0px 0px 5px rgba(0, 91, 187, 0.5);
        }

        .footer {
            background-color: #FF6600; /* Cam */
            color: #FFFFFF; /* Trắng */
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .headerclass {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="dashboard">Back</a>
    <h1>Header</h1>
</div>

<div class="container">
    <div class="headerclass"> <h1>Class list</h1></div>
    <table>
        <tr>
            <th>Class</th>
            <th>Schedule</th>
            <th>Mark</th>
            <th>Attendance</th>
            <th>Exercises</th>
            <th>Exam</th>
        </tr>
        <c:forEach items="${groups}" var="group">
            <tr>
                <td style="font-weight: bold;font-size: 25px"><a href="../group?id=${group.id}">${group.course.code}</a></td>
                <td><a href="timetable">Schedule</a></td>
                <td><a href="mark">Mark</a></td>
                <td><a href="attendance">Attendance</a></td>
                <td><a href="exercises">Exercises</a></td>
                <td><a href="exam">Exam</a></td>
            </tr>
        </c:forEach>

<%--        <tr>--%>
<%--            <td>Class 2</td>--%>
<%--            <td><a href="#">Schedule</a></td>--%>
<%--            <td><a href="#">Mark</a></td>--%>
<%--            <td><a href="#">Attendance</a></td>--%>
<%--            <td><a href="#">Exercises</a></td>--%>
<%--            <td><a href="#">Exam</a></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Class 3</td>--%>
<%--            <td><a href="#">Schedule</a></td>--%>
<%--            <td><a href="#">Mark</a></td>--%>
<%--            <td><a href="#">Attendance</a></td>--%>
<%--            <td><a href="#">Exercises</a></td>--%>
<%--            <td><a href="#">Exam</a></td>--%>
<%--        </tr>--%>
    </table>
</div>

<div class="footer">
    <p>Footer</p>
</div>
</body>
</html>
