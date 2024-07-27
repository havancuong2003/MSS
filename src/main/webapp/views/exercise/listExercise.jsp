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
    <title>Exercise List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
            background-color: #E8E8E8; /* Cam */
            color: black;
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


        .headerclass {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>


<div class="container">
    <div class="headerclass"> <h1>Exercise list Of ${groupName}</h1></div>
    <table>
        <tr>
            <th>Exercise Id</th>
            <th>Exercise Name</th>
            <th>Exercise Time</th>
            <th>Get Score?</th>
            <th>Status</th>
            <th>Start</th>
            <th>History</th>
        </tr>
        <c:forEach items="${exercises}" var="exercise">
            <tr>
                <td>${exercise.getExerciseId()}</td>
                <td>${exercise.getExerciseName()}</td>
                <td>${exercise.getExercise_time()}</td>
                <c:choose>
                    <c:when test="${exercise.getGet_score() == 1}"><td>Exam</td></c:when>
                    <c:when test="${exercise.getGet_score() == 2}"><td>Practice</td></c:when>
                    <c:when test="${exercise.getGet_score() == 3}"><td>Exam</td></c:when>
                </c:choose>
                <td>${exercise.getStatus() == 1 ? 'Open' : 'Close'}</td>
                <c:if test="${exercise.getStatus() == 1  && exercise.getGet_score() == 2}">
                    <form action="practice" method="get">
                        <td><button type="submit">Start Exercise</button></td>
                        <input type="hidden" name="exerciseId" value="${exercise.getExerciseId()}">
                        <input type="hidden" name="courseId" value="${exercise.getCourse().getId()}">
                    </form>
                </c:if>

                <c:if test="${exercise.getStatus() == 1  && exercise.getGet_score() == 1}">
                    <form action="test" method="get">
                        <td><button type="submit">Start Exercise</button></td>
                        <input type="hidden" name="exerciseId" value="${exercise.getExerciseId()}">
                        <input type="hidden" name="courseId" value="${exercise.getCourse().getId()}">
                        <input type="hidden" name="getScore" value="${exercise.getGet_score()}">

                    </form>
                </c:if>

                <c:if test="${exercise.getStatus() == 1  && exercise.getGet_score() == 3}">
                    <td>Test Done</td>
                </c:if>

                <c:if test="${exercise.getStatus() == 0 }">
                        <td>Close</td>
                </c:if>
                <td><a href="../student/viewlisthistory?exerciseId=${exercise.getExerciseId()}&exName=${exercise.getExerciseName()}">View</a></td>


            </tr>
        </c:forEach>


    </table>
</div>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>
