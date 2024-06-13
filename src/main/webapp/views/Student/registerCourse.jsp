<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Options</title>
   <style>

       body {
           font-family: Arial, sans-serif;
           margin: 20px;
           background-color: #f7f7f7; /* light gray background */
       }

       h1, h2 {
           color: #FF8C00; /* orange tone */
           margin-bottom: 10px;
       }

       table {
           border-collapse: collapse;
           width: 100%;
           border: 1px solid #ddd; /* light gray border */
       }

       th, td {
           border: 1px solid #ddd; /* light gray border */
           padding: 10px;
           text-align: left;
           background-color: #FFFFFF; /* white background */
       }

       th {
           background-color: #F7F7F7; /* light gray background */
       }

       tr:nth-child(even) {
           background-color: #F2F2F2; /* light gray background */
       }

       select {
           width: 100%;
           padding: 10px;
           margin-bottom: 20px;
           border: 1px solid #ddd; /* light gray border */
           background-color: #FFFFFF; /* white background */
       }

       input[type="submit"] {
           background-color: #FF8C00; /* orange tone */
           color: #FFFFFF; /* white text */
           padding: 10px 20px;
           border: none;
           border-radius: 5px;
           cursor: pointer;
       }

       input[type="submit"]:hover {
           background-color: #FFA07A; /* darker orange tone */
       }

       a {
           text-decoration: none;
           color: #FF8C00; /* orange tone */
       }

       a:hover {
           color: #FFA07A; /* darker orange tone */
       }
   </style>
</head>
<body>

<a href="dashboard">Back</a>
<h1>Students can only register for 5 courses in a semester</h1>
<h2> Course List Registered --- Number registered: ${totalRegister}</h2>
<table>
    <thead>
    <tr>
        <th>NO</th>
        <th>CODE</th>
        <th>DETAIL</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="course" items="${courseRegistered}">
        <tr>
            <td>${course.id}</td>
            <td>${course.code}</td>
            <td>${course.detail}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Form for registering for courses -->
<h2>Register Next for Courses</h2>
<form action="RegisterCourse" method="post">
    <select name="coursesToRegister">
        <c:forEach var="course" items="${courseRegister}">
            <option value="${course.id}">${course.code}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Submit">
</form>
<h2>Register Improve for Courses</h2>
<form action="RegisterCourse" method="post">
    <select name="coursesToRegister">
        <c:forEach var="course" items="${courseImprove}">
            <option value="${course.id}">${course.code}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Submit">
</form>
<h2>Register Learn Again  for Courses</h2>
<form action="RegisterCourse" method="post">
    <select name="coursesToRegister">
        <c:forEach var="course" items="${courseLearnAgain}">
            <option value="${course.id}">${course.code}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Submit">
</form>
</body>
</html>
