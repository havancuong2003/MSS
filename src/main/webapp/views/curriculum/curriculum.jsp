<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/11/2024
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Data</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Style for the table */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }


        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }


        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }


    </style>
</head>
<body>
<div class="container">
    <h1>Subject Prerequisite</h1>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>SUBJECT CODE</th>
            <th>PREREQUISITE CODE</th>
            <th>Điều Kiện Học</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${terms}" var="t">
            <c:forEach items="${t.courses}" var="c">
                <c:if test="${not empty c.prerequisiteCourses}">
                    <c:forEach items="${c.prerequisiteCourses}" var="prerequisite">
                        <tr>
                            <td>${t.id}</td>
                            <td>${c.code}</td>
                            <td>${prerequisite.code}</td>
                            <td>

                                    ${c.descriptionPrerequisiteCourses}

                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </c:forEach>


        </tbody>
    </table>

    <h1>Curriculum</h1>
    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>SUBJECTCODE</th>
            <th>SUBJECTNAME</th>
            <th>TERMNO</th>
            <th>Điều Kiện Qua Môn</th>

        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="1"/>
        <c:forEach items="${terms}" var="t">
            <c:forEach items="${t.courses}" var="c">
                <tr>
                    <td>${count}</td>
                    <td>${c.code}</td>
                    <td>${c.detail}</td>
                    <td>${t.id}</td>
                    <td>${c.description}</td>

                </tr>
                <c:set var="count" value="${count + 1}"/>
            </c:forEach>
        </c:forEach>

        </tbody>
    </table>

</div>
</body>
</html>

