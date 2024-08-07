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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;

            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /*header {*/
        /*    display: flex;*/
        /*    align-items: center;*/
        /*    padding: 20px;*/
        /*    background-color: #fff;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        /*    position: fixed;*/
        /*    top: 0;*/
        /*    width: 100%;*/
        /*}*/

        /*header img {*/
        /*    height: 50px;*/
        /*    margin-right: 20px;*/
        /*}*/

        /*header span {*/
        /*    font-family: 'Poppins', sans-serif;*/
        /*    font-size: 28px;*/
        /*    font-weight: 600;*/
        /*    background: linear-gradient(90deg, #ff8a00, #e52e71);*/
        /*    -webkit-background-clip: text;*/
        /*    -webkit-text-fill-color: transparent;*/
        /*    display: inline-block;*/
        /*    padding-left: 10px;*/
        /*}*/

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



        h3 {
            font-size: 25px;
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





        .left-area i:hover {
            color: rgb(205, 127, 50);
            transition: 0.3s;
        }


    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

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
<c:if test="${!requestScope.exist}">
    <div class="container">
        <p>${requestScope.ms}</p>
    </div>
</c:if>
<c:if test="${requestScope.exist}">
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
        <a href="<%=request.getContextPath()%>/admin/updateCourse?id=${requestScope.id}">Update Course Detail</a>
    </div>
</c:if>
<%----%>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
