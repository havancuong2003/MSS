<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/15/2024
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin lớp học</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        header {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #f2f2f2;
            padding: 10px;
            text-align: center;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f2f2f2;
            padding: 10px;
            text-align: center;
        }

        .content {
            padding-top: 50px; /* để header không che khuất nội dung */
            padding-bottom: 50px; /* để footer không che khuất nội dung */
            margin-top: 140px;
        }

        .info {
            position: absolute;
            top: 150px;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
        header a {
            position: absolute;
            left: 20px;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #0056b3;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        header a:hover {
            background-color: #003d80;
            color:white;
        }
    </style>
</head>
<body>
<header>
    <a href="${role}/groupList">Back</a>
    <h1>Thông tin lớp học</h1>

</header>
<div class="content">
    <div class="info">
        <p>Tên nhóm: <span id="group-name"></span></p>
        <p>Giáo viên: <span id="teacher"></span></p>
    </div>

    <h2>Danh sách sinh viên</h2>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Hình ảnh</th>
            <th>Mã sinh viên</th>
            <th>Xem thông tin</th>
        </tr>
        </thead>
        <tbody id="student-list">
        <c:forEach items="${group.students}" var="s" varStatus="loop">
            <tr>
                <td>${loop.index}</td>
                <td>${s.account.avatar}</td>
                <td>${s.account.username}</td>
                <td>
                    <button>Check info</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<footer>
    <h2>Footer</h2>
</footer>


<%--<script>--%>
<%--    // Lấy dữ liệu từ database và hiển thị lên trang web--%>
<%--    const groupName = 'Tên nhóm từ database';--%>
<%--    const teacher = 'Giáo viên từ database';--%>
<%--    const students = [--%>
<%--        { id: 1, name: 'Sinh viên 1', image: 'image1.png' },--%>
<%--        { id: 2, name: 'Sinh viên 2', image: 'image2.png' },--%>
<%--        { id: 3, name: 'Sinh viên 3', image: 'image3.png' },--%>
<%--    ];--%>

<%--    document.getElementById('group-name').innerHTML = groupName;--%>
<%--    document.getElementById('teacher').innerHTML = teacher;--%>

<%--    const studentList = document.getElementById('student-list');--%>
<%--    students.forEach((student) => {--%>
<%--        const row = document.createElement('tr');--%>
<%--        row.innerHTML = `--%>
<%--        <td>${student.id}</td>--%>
<%--        <td><img src="${student.image}" alt="Hình ảnh sinh viên"></td>--%>
<%--        <td>${student.name}</td>--%>
<%--        <td><button>Xem thông tin</button></td>--%>
<%--      `;--%>
<%--        studentList.appendChild(row);--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
