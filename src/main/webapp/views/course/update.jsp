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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
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
        .header {
            background-color: #fff;
            box-shadow: none;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }

        .dropdown-menu {
            min-width: 150px;
            display: none; /* Ẩn menu dropdown mặc định */
        }
        .dropdown-menu.show {
            display: block; /* Hiện menu khi có lớp 'show' */
        }
        nav {
            margin-bottom: 50px;
        }
        * {
            margin: 0;
            padding: 0;
            color: #000;
        }


        footer {
            width: 100%;
            margin-top: 100px;
        }

        h3 {
            font-size: 25px;
        }

        .footer-container {
            position: relative;
            bottom: 0;
            background: #E8E8E8;
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            padding: 15px 0;
        }

        .left-area ul {
            display: flex;
            justify-content: space-between;
            margin-top: 10px
        }

        .center-area, .right-area, .left-area {
            height: 50%;
            margin-bottom: 10px;
        }


        .center-area a {
            position: relative;
            text-decoration: none;
            color: #333;

        }

        .center-area a::after {
            content: "";

            width: 100%;
            height: 2px;
            left: 0;
            bottom: -5px;
            background-color: #495464;
            border-radius: 40px;
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .center-area a:hover::after {
            transform-origin: center;
            transform: scaleX(1);
        }


        .center-area a, .right-area li {
            font-size: 20px;
            padding: 5px 0;
        }

        .center-area li, .right-area li {
            padding: 5px;
        }

        ul {
            list-style-type: none;
        }

        a {
            text-decoration: none;
        }


        .text {
            width: 100%;
            height: 50px;
            background-color: #535C5F;
            color: #FFFCEB;
            margin-top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left-area i:hover {
            color: rgb(205, 127, 50);
            transition: 0.3s;
        }

        @media screen and (max-width: 576px) {
            .footer-container {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }

            h3 {
                font-size: 18px;
            }

            a, li {
                font-size: 14px;
            }

            .center-area a, .right-area li {
                font-size: 18px;
            }

            ul {
                margin-bottom: 14px;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg header">
    <button class="btn btn-light" onclick="window.location.href='dashboard';">
        <i class="fas fa-arrow-left"></i> Home
    </button>

    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                Profile
            </button>
            <div class="dropdown-menu" id="dropdownMenu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="setting">Setting</a>
                <a class="dropdown-item" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
<script>
    document.getElementById('dropdownMenuButton').addEventListener('click', function () {
        var menu = document.getElementById('dropdownMenu');
        if (menu) {
            menu.classList.toggle('show');
        }
    });

    // Đóng menu nếu nhấp ra ngoài
    document.addEventListener('click', function (event) {
        var menu = document.getElementById('dropdownMenu');
        if (menu && !menu.contains(event.target) && !document.getElementById('dropdownMenuButton').contains(event.target)) {
            menu.classList.remove('show');
        }
    });
</script>

<form action="updateCourse" method="POST">
    <c:if test="${!requestScope.exist}">
        <div class="container">
            <p>${requestScope.ms}</p>
            <a href="listCourse">Back</a>
        </div>
    </c:if>
    <c:if test="${requestScope.exist}">
        <div>
            <input type="hidden" name="cid" value="${requestScope.id}">
            <h2>Course Information</h2>
            <label for="code">Course's Code:</label>
            <input type="text" id="code" name="code" value="${requestScope.course.code}" disabled>

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
        <button type="submit">Save</button> ${requestScope.ms}
    </c:if>
</form>
<footer>
    <section class="footer-container">
        <div class="left-area">
            <h3>FOLLOW US</h3>
            <ul>
                <li><a href="">
                    <i class="fa-brands fa-square-instagram fa-2x"></i>
                </a></li>
                <li><a href="">
                    <i class="fa-brands fa-square-facebook fa-2x"></i>
                </a></li>
                <li><a href="">
                    <i class="fa-brands fa-linkedin fa-2x"></i>
                </a></li>
                <li><a href="">
                    <i class="fa-brands fa-x-twitter fa-2x"></i>
                </a></li>
            </ul>
        </div>

        <div class="right-area">
            <h3>CONTACT</h3>
            <ul>
                <li>Address: 123 FPT University Ha Noi</li>
                <li><a href="#">Mail: mss@fpt.edu.vn</a></li>
                <li><a href="#">Phone: 0123456789</a></li>
            </ul>
        </div>
    </section>

</footer>
</body>
</html>
