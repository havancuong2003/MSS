<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/21/2024
  Time: 11:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .contain {
            width: 80%;
            margin: 120px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
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

        .header {
            background-color: #ccc;
            color: black;
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
            color: white;
        }

        footer {
            background-color: #f2f2f2;
            padding: 20px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 10;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="createGroup">Back</a>
    <h1>Header</h1>
</div>
<div class="contain">
    <h1>List groups create for ${nextSemester.detail}</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Course</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${groups}" var="g">
            <tr>
                <td>${g.id}</td>
                <td>${g.name}</td>
                <td>${g.course.code}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<footer>
    <p>Footer</p>
</footer>
</body>
</html>
