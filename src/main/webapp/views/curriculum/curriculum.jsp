<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Data</title>
    <style>
        @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

        * {font-family: 'Open Sans', sans-serif;}

        .rwd-table {
            margin: auto;
            min-width: 300px;
            max-width: 100%;
            border-collapse: collapse;
        }

        .rwd-table tr:first-child {
            border-top: none;
            background: #428bca;
            color: #fff;
        }

        .rwd-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: #f5f9fc;
        }

        .rwd-table tr:nth-child(odd):not(:first-child) {
            background-color: #ebf3f9;
        }

        .rwd-table th {
            display: none;
        }

        .rwd-table td {
            display: block;
        }

        .rwd-table td:first-child {
            margin-top: .5em;
        }

        .rwd-table td:last-child {
            margin-bottom: .5em;
        }

        .rwd-table td:before {
            content: attr(data-th) ": ";
            font-weight: bold;
            width: 120px;
            display: inline-block;
            color: #000;
        }

        .rwd-table th,
        .rwd-table td {
            text-align: left;
        }

        .rwd-table {
            color: #333;
            border-radius: .4em;
            overflow: hidden;
        }

        .rwd-table tr {
            border-color: #bfbfbf;
        }

        .rwd-table th,
        .rwd-table td {
            padding: .5em 1em;
        }
        @media screen and (max-width: 601px) {
            .rwd-table tr:nth-child(2) {
                border-top: none;
            }
        }
        @media screen and (min-width: 600px) {
            .rwd-table tr:hover:not(:first-child) {
                background-color: #d8e7f3;
            }
            .rwd-table td:before {
                display: none;
            }
            .rwd-table th,
            .rwd-table td {
                display: table-cell;
                padding: .25em .5em;
            }
            .rwd-table th:first-child,
            .rwd-table td:first-child {
                padding-left: 0;
            }
            .rwd-table th:last-child,
            .rwd-table td:last-child {
                padding-right: 0;
            }
            .rwd-table th,
            .rwd-table td {
                padding: 1em !important;
            }
        }


        /* THE END OF THE IMPORTANT STUFF */

        /* Basic Styling */
        body {
            background: #4B79A1;
            background: -webkit-linear-gradient(to left, #4B79A1 , #283E51);
            background: linear-gradient(to left, #4B79A1 , #283E51);
        }
        h1 {
            text-align: center;
            font-size: 2.4em;
            color: #f2f2f2;
        }
        .container {
            display: block;
            text-align: center;
        }
        h3 {
            display: inline-block;
            position: relative;
            text-align: center;
            font-size: 1.5em;
            color: #cecece;
        }
        h3:before {
            content: "\25C0";
            position: absolute;
            left: -50px;
            -webkit-animation: leftRight 2s linear infinite;
            animation: leftRight 2s linear infinite;
        }
        h3:after {
            content: "\25b6";
            position: absolute;
            right: -50px;
            -webkit-animation: leftRight 2s linear infinite reverse;
            animation: leftRight 2s linear infinite reverse;
        }
        @-webkit-keyframes leftRight {
            0%    { -webkit-transform: translateX(0)}
            25%   { -webkit-transform: translateX(-10px)}
            75%   { -webkit-transform: translateX(10px)}
            100%  { -webkit-transform: translateX(0)}
        }
        @keyframes leftRight {
            0%    { transform: translateX(0)}
            25%   { transform: translateX(-10px)}
            75%   { transform: translateX(10px)}
            100%  { transform: translateX(0)}
        }

        /*
            Don't look at this last part. It's unnecessary. I was just playing with pixel gradients... Don't judge.
        */
        /*
        @media screen and (max-width: 601px) {
          .rwd-table tr {
            background-image: -webkit-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
            background-image: -moz-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
            background-image: -o-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
            background-image: -ms-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
            background-image: linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
          }
          .rwd-table tr:nth-child(odd) {
            background-image: -webkit-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
            background-image: -moz-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
            background-image: -o-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
            background-image: -ms-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
            background-image: linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
          }
        }*/
        /* CSS for label */
        label {
            display: block;
            margin-bottom: 0.5em;
            font-size: 1.1em;
            color: #fff; /* Thay đổi màu sắc tùy theo nhu cầu */
        }

        /* CSS for select element */
        #majorSelect {
            font-family: 'Open Sans', sans-serif;
            font-size: 1em;
            padding: 0.5em;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            color: #333;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            cursor: pointer;
            /*width: 100%; !* Tự điều chỉnh theo chiều rộng của form *!*/
        }

        #majorSelect:hover {
            border-color: #aaa;
        }

        #majorSelect:focus {
            outline: none;
            border-color: #428bca;
            box-shadow: 0 0 5px rgba(66, 139, 202, 0.5);
        }

        /* Adjust select arrow icon */
        #majorSelect::-ms-expand {
            display: none; /* Remove default arrow in IE */
        }

        /* Style for selected option */
        #majorSelect option {
            font-weight: normal;
        }

        /* Style for selected option on hover */
        #majorSelect option:hover {
            background-color: #f5f9fc;
            color: #333;
        }

    </style>
    <script>
        function submitForm() {
            document.getElementById("majorForm").submit();
        }
    </script>
</head>
<body>
<div class="container">
    <form id="majorForm" action="viewCurriculum" method="post">
        <label for="majorSelect">Select Major:</label>
        <select id="majorSelect" name="majorId" onchange="submitForm()">
            <c:forEach items="${majors}" var="major">
                <option value="${major.id}" ${requestScope.majorSelected == major.id ? "selected" : ""}>${major.code}</option>
            </c:forEach>
        </select>
    </form>
    <h1>Subject Prerequisite</h1>
    <table class="rwd-table">
        <%--        <thead>--%>
        <%--      --%>
        <%--        </thead>--%>
        <tbody>
        <tr>
            <th>STT</th>
            <th>SUBJECT CODE</th>
            <th>PREREQUISITE CODE</th>
            <th>Điều Kiện Học</th>
        </tr>
        <c:forEach items="${terms}" var="t">
            <c:forEach items="${t.courses}" var="c">
                <c:if test="${not empty c.prerequisiteCourses}">
                    <c:forEach items="${c.prerequisiteCourses}" var="prerequisite">
                        <tr>
                            <td data-th="STT">${t.id}</td>
                            <td data-th="SUBJECT CODE">${c.code}</td>
                            <td data-th="PREREQUISITE CODE">${prerequisite.code}</td>
                            <td data-th="Điều Kiện Học">${c.descriptionPrerequisiteCourses}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>

    <h1>Curriculum</h1>
    <table class="rwd-table">
        <%--        <thead>--%>
        <%--      --%>
        <%--        </thead>--%>

        <tbody>
        <tr>
            <th>STT</th>
            <th>SUBJECT CODE</th>
            <th>SUBJECT NAME</th>
            <th>TERM NO</th>
            <th>Điều Kiện Qua Môn</th>
        </tr>
        <c:set var="count" value="1"/>
        <c:forEach items="${terms}" var="t">
            <c:forEach items="${t.courses}" var="c">
                <tr>
                    <td data-th="STT">${count}</td>
                    <td data-th="SUBJECT CODE">${c.code}</td>
                    <td data-th="SUBJECT NAME">${c.detail}</td>
                    <td data-th="TERM NO">${t.id}</td>
                    <td data-th="Điều Kiện Qua Môn">${c.description}</td>
                </tr>
                <c:set var="count" value="${count + 1}"/>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
