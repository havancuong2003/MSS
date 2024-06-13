<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 6/9/2024
  Time: 1:02 PM
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
    <script type="text/javascript">
        // function sendAnswer(questionIndex, answerIndex) {
        //     $.ajax({
        //         type: "POST",
        //         url: "test",
        //         data: { questionIndex: questionIndex, choosenAnswer: answerIndex },
        //         success: function(response) {
        //             console.log(response);
        //         },
        //         error: function() {
        //             alert("Error sending answer");
        //         }
        //     });
        // }
    </script>
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
            <c:forEach items="${questionDetails}" var="ques" varStatus="status">
                <div class="question-section" id="question-${status.index}">
                    <div class="question-area">
                        <p id="questionText">${ques.getQuestionDetail()}</p>
                    </div>
                    <div class="options">
                        <div>
                            <button class="option-btn" onclick="handleClick(${status.index}, 1, this)">${ques.getAnswers().get(0).getAnswer()}</button>
                            <button class="option-btn" onclick="handleClick(${status.index}, 3, this)">${ques.getAnswers().get(2).getAnswer()}</button>
                        </div>
                        <div>
                            <button class="option-btn" onclick="handleClick(${status.index}, 2, this)">${ques.getAnswers().get(1).getAnswer()}</button>
                            <button class="option-btn" onclick="handleClick(${status.index}, 4, this)">${ques.getAnswers().get(3).getAnswer()}</button>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="sidebarclone"></div>
        <div class="sidebars">
            <div class="questions-list">
                <c:forEach var="i" begin="1" end="${size}">
                    <c:choose>
                        <c:when test="${i == (current + 1)}">
                            <div class="list-item active" style="background-color: red !important,
                            <c:if test="${listanswer.get(i - 1) != 0  && listanswer.get(i - 1) != null}">
                                    background-color:#92bfbf
                                    </c:if>"
                            >${i}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="list-item"
                                    <c:if test="${listanswer.get(i - 1) != 0 && listanswer.get(i - 1) != null}">
                                        style="background-color:#92bfbf"
                                    </c:if>
                            >${i}</div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

            </div>
            <div class="navigation-buttons">
                <div class="navigation-buttons-up">



                </div>
<%--                <form action="test" method="post">--%>
<%--                    <input type="hidden" name="option" value="finish">--%>
<%--                    <div class="navigation-buttons-down">--%>
<%--                        <button class="finish-btn" data-bs-target="#log-out" data-bs-toggle="modal">Finish</button>--%>
<%--                    </div>--%>
<%--                </form>--%>

                <div class="navigation-buttons-down">
                    <button class="finish-btn" data-bs-target="#log-out" data-bs-toggle="modal">Finish</button>
                </div>


            </div>
        </div>
    </div>

    <div
            class="modal fade"
            id="log-out"
            data-bs-backdrop="static"
            data-bs-keyboard="false"
            tabindex="-1"
            aria-labelledby="staticBackdropLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">
                        Are you sure to finish?
                    </h1>
                </div>
                <form action="test" method="post">


                    <div
                            class="modal-body"
                            style="display: flex; justify-content: space-between"
                    >
                        <button
                                type="button"
                                class="btn btn-danger"
                                class="btn-close"
                                data-bs-dismiss="modal"
                        >
                            No
                        </button>
                        <input type="hidden" name="option" value="finish">
                        <button
                                href="result.html"
                                class="btn btn-primary"
                                style="text-decoration: none; color: white"
                        >
                            Yes
                        </button>
                    </div>
                </form>
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
        // Hàm xử lý khi nút được nhấp
        window.handleClick = (questionId, answerId, button) => {
            sendAnswer(questionId, answerId);
            toggleGrayClass(questionId, button);
        };

        function sendAnswer(questionIndex, answerIndex) {
                $.ajax({
                    type: "POST",
                    url: "test",
                    data: { questionIndex: questionIndex, choosenAnswer: answerIndex },
                    success: function(response) {
                        console.log(response);
                    },
                    error: function() {
                        alert("Error sending answer");
                    }
                });
            }


        // Hàm thêm hoặc loại bỏ lớp 'gray' chỉ trong phạm vi của câu hỏi
        function toggleGrayClass(questionId, button){
            const isGray = button.classList.contains('gray');
            const questionSection = document.getElementById("question-" + questionId);

            if (questionSection) {
                const optionButtons = questionSection.querySelectorAll('.option-btn');

                if (isGray) {
                    button.classList.remove('gray');
                } else {
                    optionButtons.forEach(btn => {
                        btn.classList.remove('gray');
                    });
                    button.classList.add('gray');
                }
            } else {
                console.error("No question section found for questionId: " + questionId);
            }
        };
    });




    //thời gian đồng hồ
    document.addEventListener("DOMContentLoaded", function () {
        let questionTimeElement = document.querySelector(".question-time");
        let timeParts = questionTimeElement.textContent.split(":");
        let hours = parseInt(timeParts[0], 10);
        let minutes = parseInt(timeParts[1], 10);
        let seconds = parseInt(timeParts[2], 10) || 0;

        function updateTime() {
            if (seconds === 0) {
                if (minutes === 0) {
                    if (hours === 0) {
                        clearInterval(countdownInterval);
                        questionTimeElement.textContent = "00:00:00";
                        window.location.href = "result.html"
                        return;
                    } else {
                        hours--;
                        minutes = 59;
                        seconds = 59;
                    }
                } else {
                    minutes--;
                    seconds = 59;
                }
            } else {
                seconds--;
            }

            let hoursString = hours.toString().padStart(2, '0');
            let minutesString = minutes.toString().padStart(2, '0');
            let secondsString = seconds.toString().padStart(2, '0');

            questionTimeElement.textContent = `${hoursString}:${minutesString}:${secondsString}`;
        }

        let countdownInterval = setInterval(updateTime, 1000);
    });
</script>
<script src="./js/bootstrap.min.js"></script>
</body>s

</html>
