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
    <title>Student List</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 120px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }

        .semester {
            font-size: 24px;
            color: #666;
            text-align: center;
        }

        .group-settings label {
            margin-right: 10px;
            font-size: 16px;
            color: #333;
        }

        .group-settings input {
            width: 50px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
            color: #333;
        }



        /*table {*/
        /*    width: 100%;*/
        /*    border-collapse: collapse;*/
        /*}*/

        /*th,*/
        /*td {*/
        /*    padding: 10px;*/
        /*    text-align: left;*/
        /*    border: 1px solid #ccc;*/
        /*}*/

        /*th {*/
        /*    background-color: #f2f2f2;*/
        /*    font-weight: bold;*/
        /*}*/

        /*.container{*/
        /*    padding: 1rem;*/
        /*    margin: 1rem;*/
        /*}*/
        .table-scroll{
            /*width:100%; */
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
            max-height: 50vh;
        }

        .small-col{flex-basis:10%;}

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

        .group-settings {
            margin: 50px 0;
            padding: 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            width: 100%;
        }
        .group-settings label {
            margin-bottom: 10px;
            font-weight: bold;
        }
        .group-settings input[type="number"] {
            padding: 10px;
            margin-bottom: 10px;
            width: 20%;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .group-settings button {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 20px;
        }
        .group-settings button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
<jsp:include page="../../common/header.jsp" />
<div class="container">
    <div class="semester">
        <p>Current semester: ${currentSemester.detail}</p>
        <p>Create group for next semester: ${nextSemester.detail}</p>
    </div>

    <div class="students-list">
        <h3>Students List Registered For Next Semester: ${nextSemester.detail}</h3>
        <table class="table-scroll small-first-col">
            <thead>
            <tr>
                <th>NO</th>
                <th>Student ID</th>
                <th>Course</th>
            </tr>
            </thead>
            <tbody class="body-half-screen">
            <c:forEach
                    items="${registers}"
                    var="register"
                    varStatus="loop"
            >
                <%-- Chia mỗi phần tử của mảng registers thành
                studentId và courseId --%>
                <c:set
                        var="parts"
                        value="${fn:split(register, ';')}"
                />
                <%-- Kiểm tra nếu parts có đúng 2 phần tử thì hiển
                thị --%>
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
    </div>
    <form
            class="group-settings"
            action="createGroup"
            method="post"
            onsubmit="${isCreate ? 'return confirm(\'This semester has already been created. Are you sure you want to recreate it?\');' : ''}"
    >
        <label for="group-id">Enter number of students in group</label>
        <input type="number" id="group-id" value="SP24" name="studentPerGroup" required/>
        <input type="hidden" name="isCreate" value="${isCreate}" />
        <button type="submit">
            ${isCreate ? 'ReCreate' : 'Create'}
        </button>
    </form>
  ${isCreate ? '  <a href="viewGroup"><button>View Group Created</button></a>' : ''}
</div>
<jsp:include page="../../common/footer.jsp" />

</body>
</html>


