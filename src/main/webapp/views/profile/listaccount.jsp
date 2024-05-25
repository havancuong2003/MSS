<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 5/22/2024
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* styles.css */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .user-table th, .user-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .user-table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .user-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .user-table tr:hover {
            background-color: #f1f1f1;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>User List</h1>
    <table class="user-table">
        <thead>
        <tr>
            <th>Username</th>
            <th>Password</th>
            <th>Full Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Role</th>
            <th>Gender</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listaccount}">
            <tr>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.fullname}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <c:choose>
                    <c:when test="${user.role_id == 1}">
                        <td>Admin</td>
                    </c:when>
                    <c:when test="${user.role_id == 2}">
                        <td>Staff</td>
                    </c:when>
                    <c:when test="${user.role_id == 3}">
                        <td>Teacher</td>
                    </c:when>
                    <c:when test="${user.role_id == 4}">
                        <td>Student</td>
                    </c:when>
                    <c:otherwise>
                        <td>Not found!</td>
                    </c:otherwise>
                </c:choose>
                <td>${user.gender ? "Male" : "Female"}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
