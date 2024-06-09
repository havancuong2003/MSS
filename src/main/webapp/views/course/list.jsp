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
    .header{
        background-color: green;
        padding: 15px;
        text-align: center;
    }
        /*h1 {*/
        /*    text-align: center;*/
        /*    margin: 40px 0 40px 0 ;*/
        /*}*/
        h2 {
            text-align: center;

        }

        .nav_menu {

            margin: 20px auto;
            overflow: hidden;
            width: 80%;
            background-color: #333;
            padding: 20px;
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
        input{
            width: 20%;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            background-position: 10px 10px;
            padding: 12px 20px 12px 40px;
        }
        .form-row {
            margin-left: 10%;
            display: flex;
            align-items: center;
            margin-right: 50px;
        }
        .form-row input {
            margin-left: 10px;
            margin-right: 10px;
        }
        .title-search {
            font-size: 20px; /* Kích thước chữ */
            font-weight: bold; /* Độ đậm */
            color: #333; /* Màu chữ */
            align-items: center;
            text-align: center; /* Căn giữa văn bản */

        }
    </style>



</head>

<div class="header">
    <h1 style="color:white,font-size:200%;">
        View All Course
    </h1>
</div>
<div class="nav_menu">
    <a style="color:white" href="#">Home</a>
    <a style="color:white">|</a>
    <a style="color:white">Course List</a>
    <a style="color:white; float: right;" href="#">Log Out</a>
<%--    float:right  move an element to the right side of its parent element--%>
</div>

<form >
    <div class="form-row">
        <div class="title-search">Enter code:</div>
        <input id="searchCode" oninput="SearchItem()"  type="text" name="searchCode" placeholder="Search by code or detail...">

    </div>
</form>

<h2>Course List</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Code</th>
        <th>Name</th>
        <th>Description</th>
        <th>Credit</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody id="TableBodyData">
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.id}</td>
            <td>${course.code}</td>
            <td>${course.detail}</td>
            <td>${course.description}</td>
            <td>${course.credit}</td>
            <td>${course.status}</td>
            <td><a href="viewCourse?id=${course.id}">View Details</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function SearchItem(){
    let code = $("#searchCode").val()
    $.ajax({
        url: "/MyStudySpace_war_exploded/listCourse",
        method: "POST",
        dataType: "JSON",
        data: {
            searchCode: code
        },
        success: function (data) {
           let listCourse = data
            let bodyTable = $("#TableBodyData")
            bodyTable.html("");
            let htmlValue = ''
            listCourse.forEach((c) => {
                htmlValue += "<tr><td>" + c.id + "</td><td>" + c.code + "</td><td>" + c.detail + "</td><td>" + c.description + "</td><td>" + c.credit + "</td><td>" + c.status + "</td><td><a href='viewCourse?id=" + c.id + "'>ClickHere</a></td></tr>";
            })
            bodyTable.html(htmlValue);
        },
        error: function (Error) {
            console.log(Error)
        }
    });
}
</script>
</body>
</html>
