<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 6/17/2024
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Classroom Layout</title>
    <link rel="stylesheet" href="css/detailassignment.css" />
</head>
<body>
<div class="container">
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Classroom</h2>
            <div class="sidebar-header-content">Home</div>
            <div class="sidebar-header-content">Calendar</div>
        </div>
        <div class="class-list">
            <!-- <div class="class-item enrolled">Enrolled</div>
            <div class="class-item to-do">To do</div> -->
            <div class="class-item">JPD123 SE1817 2024 Spring</div>
            <div class="class-item">SP24_IOT_SE1817</div>
            <div class="class-item selected">JPD113 IA1801</div>
            <div class="class-item">SE1815 - SSG104 - Summer 1</div>
            <div class="class-item">CSI104-SE1833</div>
            <div class="class-item">TRS601.72-P1</div>
            <div class="class-item">TRS501.72-P1</div>
        </div>
        <div class="sidebar-footer">
            <div class="footer-item">Settings</div>
        </div>
    </div>
    <div class="main-content">
        <div class="content-header">
            <h1>Test 4 - Chapter 3</h1>
            <p class="author">Anh Nguyễn Ngọc • 11 Nov 2023</p>
            <br />
            <p class="description">
                Cô gửi bài tập JPD113 nhé. Chúc các em làm bài điểm
                cao!!!
            </p>
            <br />

            <div class="document-link">
                <c:forEach items="${listExercise}" var="exe">
                    <a href="practice?exerciseId=${exe.getExerciseId()}&courseId=${exe.getCourseId()}">${exe.getExerciseName()}</a>
<%--                    <c:forEach items="${listExercise.getHistories()}" var="his">--%>
<%--                        <a href="viewhistorytest?historyId=${his.getId()}">${his.getDate_submit()} : ${his.getScore()}</a>--%>
<%--                    </c:forEach>--%>
                </c:forEach>
            </div>
        </div>
        <div class="class-comments">
            <img
                    src="user-avatar.jpg"
                    alt="User Avatar"
                    class="user-avatar"
            />
            <textarea placeholder="Add class comment..."></textarea>
            <button>Send</button>
        </div>
    </div>
</div>
</body>
</html>
