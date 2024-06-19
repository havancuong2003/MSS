<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 6/18/2024
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Interface</title>
    <link rel="stylesheet" href="./css/taketest.css">
    <link rel="stylesheet" href="./css/bootstrapmin.css" />
    <script src="./css/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .isChoosenAnswer{
            background-color:#92bfbf;
        }
    </style>
</head>

<body>
<div class="containers">
    <div class="headers">
        <a href="#" class="home-icon">
            <img src="home-icon.png" alt="Home">
        </a>
        <span class="username">LinhND</span>
    </div>
    <div class="contents">
        <div class="question-section">
            <c:forEach items="${questionSubmissions}" var="ques" varStatus="status">
                <div class="question-section" id="question-${status.index}">
                    <div class="question-area">
                        <p id="questionText">${status.index + 1}. ${ques.getQuestion().getQuestion()}</p>
                    </div>
                    <div class="options">
                        <div>
                            <button class="option-btn ${ques.getAnswers().get(0).getAnswerid() == ques.getAnswer().getAnswerid() ? 'gray' : ''}" style="${ques.getAnswers().get(0).getStatus() == 1 ? 'border: 5px solid #3399FF;' : ''}" >${ques.getAnswers().get(0).getAnswer()}</button>
                            <button class="option-btn ${ques.getAnswers().get(2).getAnswerid() == ques.getAnswer().getAnswerid() ? 'gray' : ''}" style="${ques.getAnswers().get(2).getStatus() == 1 ? 'border: 5px solid #3399FF;' : ''}" >${ques.getAnswers().get(2).getAnswer()}</button>
                        </div>
                        <div>
                            <button class="option-btn ${ques.getAnswers().get(1).getAnswerid() == ques.getAnswer().getAnswerid() ? 'gray' : ''}" style="${ques.getAnswers().get(1).getStatus() == 1 ? 'border: 5px solid #3399FF;' : ''}">${ques.getAnswers().get(1).getAnswer()}</button>
                            <button class="option-btn ${ques.getAnswers().get(3).getAnswerid() == ques.getAnswer().getAnswerid() ? 'gray' : ''}" style="${ques.getAnswers().get(3).getStatus() == 1 ? 'border: 5px solid #3399FF;' : ''}">${ques.getAnswers().get(3).getAnswer()}</button>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="sidebarclone"></div>
        <div class="sidebars">
            <div class="questions-list">
                <c:forEach var="i" begin="1" end="${size}">
                    <div class="list-item" id="list-item-${i - 1}"
                    >${i}</div>
                </c:forEach>
            </div>
            <div class="navigation-buttons">
                <div class="navigation-buttons-up">

                    <div class="question-time" style="font-size: 25px">${score}/${size}</div>

                </div>

            </div>
        </div>
    </div>
</div>


<script>
    //check overflow
    document.addEventListener("DOMContentLoaded", function () {
        var questionText = document.getElementById("questionText");
        if (questionText.scrollHeight > 500) {
            questionText.style.overflowY = "scroll";
        }
    });


    // xu li ajaax vaf check answer thro cau hoi
    document.addEventListener('DOMContentLoaded', () => {
        // tích ô nào kéo đê ô ấy
        const listItems = document.querySelectorAll('.list-item');

        listItems.forEach(item => {
            item.addEventListener('click', () => {
                const questionId = item.id.split('-')[2];
                const questionSection = document.getElementById("question-" + questionId);

                if (questionSection) {
                    questionSection.scrollIntoView({ behavior: 'smooth' });
                    listItems.forEach(li => li.classList.remove('active'));
                    item.classList.add('active');
                }
            });
        });

    });

</script>
<script src="./js/bootstrap.min.js"></script>
</body>s

</html>
