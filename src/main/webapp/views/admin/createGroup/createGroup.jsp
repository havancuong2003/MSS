<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/2/2024
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sinh viên đăng kí môn học</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            /*align-items: center;*/
            height: 100vh;
            margin: 0;
        }

        table {
            width: 60%;
            border-collapse: collapse;
        }

        tbody td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            opacity: 0;
            transform: translateY(10px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #eaeaea;
        }

        .contain {
            margin-top: 50px;
            padding: 20px;
            background-color: #f0f0f0; /* Add a light gray background */
            border: 1px solid #ddd; /* Add a border */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
        }

        /* Style the h1 heading */
        h1 {
            margin-top: 0;
            color: #333; /* Darken the heading color */
        }

        /* Add some space between the table and the button */
        table {
            margin-bottom: 20px;
        }

        /* Style the button */
        button {
            background-color: #4CAF50; /* Green button */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #3e8e41; /* Darken the button on hover */
        }

        /* Add some padding to the table cells */
        tbody td {
            padding: 12px; /* Increase padding for better readability */
        }

        /* Add a hover effect to the table rows */
        tbody tr:hover {
            background-color: #eaeaea; /* Light gray hover effect */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow on hover */
        }
        .container{
            padding: 1rem;
            margin: 1rem;
        }
        .table-scroll{
            width:100%;
            display: block;
            empty-cells: show;

            /* Decoration */
            border-spacing: 0;
            border: 1px solid;
        }

        .table-scroll thead{
            background-color: #f1f1f1;
            position:relative;
            display: block;
            width:100%;
            overflow-y: scroll;
        }

        .table-scroll tbody{
            /* Position */
            display: block; position:relative;
            width:100%; overflow-y:scroll;
            /* Decoration */
            border-top: 1px solid rgba(0,0,0,0.2);
        }

        .table-scroll tr{
            width: 100%;
            display:flex;
        }

        .table-scroll td,.table-scroll th{
            flex-basis:100%;
            flex-grow:2;
            display: block;
            padding: 1rem;
            text-align:left;
        }

        /* Other options */

        .table-scroll.small-first-col td:first-child,
        .table-scroll.small-first-col th:first-child{
            flex-basis:20%;
            flex-grow:1;
        }

        .table-scroll tbody tr:nth-child(2n){
            background-color: rgba(130,130,170,0.1);
        }

        .body-half-screen{
            max-height: 80vh;
        }

        .small-col{flex-basis:10%;}

    </style>
</head>
<body>
<div class="contain">
    <h1>Danh sách sinh viên đăng kí môn học</h1>

    <table  class="table-scroll small-first-col">
        <thead>
        <tr>
            <th>NO</th>
            <th>Student ID</th>
            <th>Course</th>
        </tr>
        </thead>
        <tbody class="body-half-screen">
        <c:forEach items="${registers}" var="register" varStatus="loop">
            <%-- Chia mỗi phần tử của mảng registers thành studentId và courseId --%>
            <c:set var="parts" value="${fn:split(register, ';')}" />
            <%-- Kiểm tra nếu parts có đúng 2 phần tử thì hiển thị --%>
            <c:if test="${fn:length(parts) == 2}">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${parts[0]}</td>
                    <td>${parts[1]}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <form action="createGroup" method="post" onsubmit="${isCreate ? 'return confirm(\'This semester has already been created. Are you sure you want to recreate it?\');' : ''}">
        <input type="hidden" name="isCreate" value="${isCreate}" />
        <button type="submit">${isCreate ? 'ReCreate' : 'Create'}</button>
    </form>
</div>
<div class="contain">
    <h1>Danh sách các lớp học trong kì hiện tại : SU24</h1>
    <table  class="table-scroll small-first-col">
        <thead>
        <tr>
            <th>NO</th>
            <th>GroupID</th>
            <th>Course</th>

        </tr>

        </thead>
        <tbody class="body-half-screen">
        <c:forEach items="${groups}" var="g" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${g.id}</td>
                <td>${g.course.code}</td>

            </tr>

        </c:forEach>

        </tbody>
    </table>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tbodies = document.querySelectorAll("tbody");
        tbodies.forEach(tbody => {
            const columns = Array.from({length: 7}, (_, i) =>
                tbody.querySelectorAll(`td:nth-child(\${i + 1})`)
            );

            columns.forEach((col, i) => {
                col.forEach((cell, j) => {
                    setTimeout(() => {
                        cell.style.opacity = "1";
                        cell.style.transform = "translateY(0)";
                    }, (i + j * 1.5) * 50);
                });
            });
        });
    });
</script>
<%--<script type="text/javascript">--%>
<%--    function confirmSubmit(event) {--%>
<%--        // Hiển thị hộp thoại xác nhận--%>
<%--        var confirmed = confirm("Bạn có chắc chắn muốn submit form không?");--%>

<%--        // Nếu người dùng chọn "Cancel", ngăn chặn việc submit form--%>
<%--        if (!confirmed) {--%>
<%--            event.preventDefault();--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
