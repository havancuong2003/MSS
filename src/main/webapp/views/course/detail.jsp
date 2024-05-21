<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 1:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MyStudySpace - Course Information</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        header {
            display: flex;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            width: 100%;
        }

        header img {
            height: 50px;
            margin-right: 20px;
        }

        header span {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
        }

        .container {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            max-width: 800px;
            width: 100%;
            margin-top: 100px; /* Adjust margin to provide space for fixed header */
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            font-size: 16px;
            margin: 10px 0;
        }

        h4 {
            color: #555;
            margin-top: 30px;
            margin-bottom: 10px;
            font-size: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6200ea;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #3700b3;
        }

        a:active {
            background-color: #6200ea;
            transform: translateY(2px);
        }
    </style>
</head>
<body>
<header>
    <img src="logo.png" alt="MyStudySpace Logo">
    <span>MyStudySpace</span>
</header>
<div class="container">
    <h2>Course Information</h2>
    <p><strong>Code:</strong> ${requestScope.course.code}</p>
    <p><strong>Detail:</strong> ${requestScope.course.detail}</p>
    <h4>Grade Detail:</h4>
    <table>
        <tr>
            <th>GRADE CATEGORY</th>
            <th>GRADE ITEM</th>
            <th>WEIGHT</th>
        </tr>
        <c:forEach items="${requestScope.cates}" var="c">
            <c:forEach items="${c.assessments}" var="a">
                <tr>
                    <c:if test="${a.id eq c.fitemID}">
                        <td rowspan="${c.count}">${c.categoryName}</td>
                    </c:if>
                    <td>${a.item}</td>
                    <td>${a.weight} %</td>
                </tr>
            </c:forEach>
        </c:forEach>
    </table>
    <a href="<%=request.getContextPath()%>/updateCourse?id=${requestScope.id}">Update Course Detail</a>
</div>
</body>
</html>
