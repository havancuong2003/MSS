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
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        header, footer {
            background-color: #333;
            color: white;
            /*text-align: center;*/
            padding: 10px 0;
            position: fixed;
            width: 100%;
            z-index: 1000;
        }

        header {
            top: 0;
        }

        footer {
            bottom: 0;
        }

        .content {
            margin-top: 130px; /* để header không che khuất nội dung */
            margin-bottom: 70px; /* để footer không che khuất nội dung */
            padding: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .info-btn {
            padding: 8px 16px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .info-btn:hover {
            background-color: #003d80;
        }

        /* CSS cho Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1001;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 80%;
            max-width: 600px;
            animation: slideDown 0.3s ease-out;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h1, h2 {
            margin: 0;
            padding: 20px 0;
        }

        .info {
            margin: 20px 0;
        }

        .modal-content p {
            margin: 10px 0;
            font-size: 16px;
        }

        .modal-content p span {
            display: inline-block;
            min-width: 120px;
            font-weight: bold;
        }

        .modal-content p span.value {
            font-weight: normal;
            display: inline-block;
            width: calc(100% - 130px);
        }
        header a button {
            background-color: #0056b3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
            margin-left: 20px;
        }

        header a button:hover {
            background-color: #003d80;
            transform: scale(1.05);
        }

        header a button:active {
            background-color: #00294d;
            transform: scale(0.95);
        }

    </style>
</head>
<body>
<header>
    <a href="${pageContext.request.contextPath}/${role}/dashboard" style="color: white; text-decoration: none; "><button>Back</button></a>

    <h1 style="text-align: center">Thông tin lớp học</h1>
</header>
<div class="content">
    <div class="info">
        <p>Tên nhóm: <span id="group-name">${group.name}</span></p>
        <p>Giáo viên: <span id="teacher">${group.teacher.account.fullname}</span></p>
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
                <td>${loop.index + 1}</td>
                <td><img src="${s.account.avatar}" alt="Avatar" width="50" height="50"></td>
                <td>${s.account.username}</td>
                <td>
                    <button
                            class="info-btn"
                            data-username="${s.account.username}"
                            data-fullname="${s.account.fullname}"
                            data-phone="${s.account.phone}"
                            data-email="${s.account.email}"
                            data-dob="${s.account.dob}"
                            data-address="${s.account.address}"
                            data-gender="${s.account.gender}"
                    >Check info</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div id="studentModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Thông tin sinh viên</h2>
        <p><span>Username:</span> <span id="modal-username" class="value"></span></p>
        <p><span>Full name:</span> <span id="modal-fullname" class="value"></span></p>
        <p><span>Phone:</span> <span id="modal-phone" class="value"></span></p>
        <p><span>Email:</span> <span id="modal-email" class="value"></span></p>
        <p><span>Date of Birth:</span> <span id="modal-dob" class="value"></span></p>
        <p><span>Address:</span> <span id="modal-address" class="value"></span></p>
        <p><span>Gender:</span> <span id="modal-gender" class="value"></span></p>
    </div>
</div>

<footer>
    <h2>Footer</h2>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var modal = document.getElementById("studentModal");
        var span = document.getElementsByClassName("close")[0];

        document.querySelectorAll('.info-btn').forEach(function(button) {
            button.addEventListener('click', function() {
                document.getElementById('modal-username').textContent = this.getAttribute('data-username');
                document.getElementById('modal-fullname').textContent = this.getAttribute('data-fullname');
                document.getElementById('modal-phone').textContent = this.getAttribute('data-phone');
                document.getElementById('modal-email').textContent = this.getAttribute('data-email');
                document.getElementById('modal-dob').textContent = this.getAttribute('data-dob');
                document.getElementById('modal-address').textContent = this.getAttribute('data-address');
                document.getElementById('modal-gender').textContent = this.getAttribute('data-gender') == 1 ? 'Male' : 'Female';
                modal.style.display = "flex";
            });
        });

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
</script>

</body>
</html>
