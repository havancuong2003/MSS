<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MyStudySpace - Update Course</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        header {
            display: flex;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

        form {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        h4 {
            color: #555;
            margin-top: 30px;
        }

        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        button {
            display: block;
            width: 100%;
            padding: 15px;
            margin-top: 30px;
            background-color: #6200ea;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #3700b3;
        }

        button:active {
            background-color: #6200ea;
            transform: translateY(2px);
        }
        .container {
            /*background-color: #ffffff;*/
            /*box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
            /*border-radius: 8px;*/
            /*padding: 20px;*/
            /*max-width: 800px;*/
            /*width: 100%;*/
        }

        p {
            color: #555;
            font-size: 16px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<header>
    <img src="logo.png" alt="MyStudySpace Logo">
    <span>MyStudySpace</span>
</header>

<form action="updateCourse" method="POST">
    <c:if test="${!requestScope.exist}">
        <div class="container">
            <p>${requestScope.ms}</p>
        </div>
    </c:if>
    <c:if test="${requestScope.exist}">
        <div>
            <input type="hidden" name="cid" value="${requestScope.id}">
            <h2>Course Information</h2>
            <label for="code">Course's Code:</label>
            <input type="text" id="code" name="code" value="${requestScope.course.code}">

            <label for="detail">Course's Detail:</label>
            <input type="text" id="detail" name="detail" value="${requestScope.course.detail}">

            <h4>Grade Detail:</h4>
            <table>
                <tr>
                    <th>Grade Category</th>
                    <th>Grade Item</th>
                    <th>Weight</th>
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
        </div>
        <button type="submit">Save</button>
    </c:if>
</form>

</body>
</html>
