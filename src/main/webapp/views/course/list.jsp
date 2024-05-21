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
        /* Thiết lập kiểu cho bảng */

        h1 {
            text-align: center;
            margin: 40px 0 40px 0 ;
        }
        h2 {
            text-align: center;
            margin: 40px 0 20px 0 ;
        }
        .new-table {
            background-color: #f2f2f2;
            width: 80%; /* Chiều rộng bằng với bảng cũ */
            margin: 40px auto; /* Canh giữa bảng và tạo khoảng cách với bảng cũ */

        }

        /* Thiết lập kiểu cho cột dấu "|" */
        .new-table td {
            padding: 0 10px; /* Khoảng cách giữa dấu "|" và nội dung */
        }

        /* Thiết lập căn chỉnh cho cột "Log Out" */
        .logout-cell {
            text-align: right;
            width: 100%;


        }
        table {
            width: 80%; /* Giữ bảng ở trung tâm và chiếm 80% chiều rộng của trang */
            margin: 0 auto; /* Canh giữa bảng */
            border: 3px solid #ddd; /* Thêm đường viền cho bảng */
            border-collapse: collapse;
        }

        /* Thiết lập kiểu cho dòng tiêu đề */
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            text-align: left;
            padding: 8px;
        }

        /* Thiết lập kiểu cho dòng */
        td {
            border-bottom: 1px solid #ddd;
            padding: 20px;
        }

        /* Thiết lập kiểu cho dòng chẵn */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }


    </style>
</head>
<body>
<h1>Course List</h1>
<table class="new-table">
    <tr>
        <td>
            <a href="">Home</a>
        </td>
        <td>
            |
        </td>
        <td>
            CourseList
        </td>
        <td class="logout-cell" >
            <a href="">Log Out</a>
        </td>
    </tr>
</table>
<h2>Course List</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Code</th>
        <th>Name of Code</th>
        <th>Details</th>
    </tr>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.id}</td>
            <td>${course.code}</td>
            <td>${course.detail}</td>
            <td><a href="viewCourse?id=${course.id}">ClickHere</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
