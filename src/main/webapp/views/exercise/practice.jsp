<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 5/24/2024
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quiz Interface</title>
    <link rel="stylesheet" href="./css/practice.css" />
    <link rel="stylesheet" href="./css/bootstrapmin.css" />
    <script src="./css/bootstrap.min.js"></script>
</head>

<body>
<div class="containers">
    <div class="headers">
        <a href="#" class="home-icon">
            <img src="home-icon.png" alt="Home" />
        </a>
        <span class="username">LinhND</span>
    </div>
    <div class="contents">
        <div class="question-section">
            <div class="question-area">
                <p id="questionText">
                    ${question.questionDetail}
                </p>


                <!-- tùy chọn thời gian, điểm , index của câu -->
<%--                <div class="question-time">00:01:10</div>--%>
                <!-- <div class="question-time">1/10</div> -->
                <!-- <div class="question-time">1 đ</div> -->

            </div>
            <div class="options">
                <div>
                    <button class="option-btn ${choosenAnswer == 1 ? 'gray' : ''}" data-answer="1">A. ${question.getAnswers().get(0).getAnswer()}</button>
                    <button class="option-btn ${choosenAnswer == 3 ? 'gray' : ''}" data-answer="3">C. ${question.getAnswers().get(2).getAnswer()}</button>
                </div>
                <div>
                    <button class="option-btn ${choosenAnswer == 2 ? 'gray' : ''}" data-answer="2">B. ${question.getAnswers().get(1).getAnswer()}</button>
                    <button class="option-btn ${choosenAnswer == 4 ? 'gray' : ''}" data-answer="4">D. ${question.getAnswers().get(3).getAnswer()}</button>
                </div>
            </div>
        </div>
        <div class="sidebars">
            <div class="questions-list">
                <c:forEach var="i" begin="1" end="${size}">
                    <c:choose>
                        <c:when test="${i == (current + 1)}">
                            <div class="list-item active">${i}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="list-item">${i}</div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <div class="navigation-buttons">
                <div class="navigation-buttons-up">
                    <form action="practice" method="post">
                        <input
                                type="hidden"
                                name="option"
                                value="back"
                        />
                        <input
                                type="hidden"
                                name="choosenAnswer"
                                id="choosenAnswer0"
                                value="${choosenAnswer}"
                        />
                        <button class="nav-btn">Back</button>
                    </form>

                    <form action="practice" method="post">
                        <input
                                type="hidden"
                                name="option"
                                value="next"
                        />
                        <input
                                type="hidden"
                                name="choosenAnswer"
                                id="choosenAnswer1"
                                value="${choosenAnswer}"
                        />
                        <button class="nav-btn">Next</button>
                    </form>
                </div>
                <div class="navigation-buttons-down">
                    <button
                            class="finish-btn"
                            data-bs-target="#log-out"
                            data-bs-toggle="modal"
                    >
                        Finish
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--pop-up logout-->

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
            <form action="practice" method="post">


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
                <input
                        type="hidden"
                        name="choosenAnswer"
                        id="choosenAnswer2"
                        value="${choosenAnswer}"
                />
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

<script>
    //check overflow
    document.addEventListener("DOMContentLoaded", function () {
        var questionText = document.getElementById("questionText");
        if (questionText.scrollHeight > 500) {
            questionText.style.overflowY = "scroll";
        }
    });

    //check tích câu trả lời và set giá trị choosenAnswer cho thẻ next và back
    const optionButtons = document.querySelectorAll(".option-btn");
    const choosenAnswerCheckInput1 = document.getElementById("choosenAnswer1");
    const choosenAnswerCheckInput0 = document.getElementById("choosenAnswer0");
    const choosenAnswerCheckInput2 = document.getElementById("choosenAnswer2");

    // Lặp qua từng nút và thêm sự kiện click
    optionButtons.forEach((button) => {
        button.addEventListener("click", () => {
            // Lấy giá trị data-answer của nút được click
            const answerValue = button.getAttribute("data-answer");

            // Kiểm tra xem nút đó đã được đánh dấu chưa
            const isGray = button.classList.contains("gray");

            // Nếu đã đánh dấu, hãy loại bỏ màu đỏ và set giá trị tương ứng cho input
            if (isGray) {
                button.classList.remove("gray");
                choosenAnswerCheckInput1.value = 0; // Đặt giá trị là 0 khi không có câu trả lời được chọn
                choosenAnswerCheckInput0.value = 0; // Đặt giá trị là 0 khi không có câu trả lời được chọn
                choosenAnswerCheckInput2.value = 0; // Đặt giá trị là 0 khi không có câu trả lời được chọn
            } else {
                // Nếu chưa đánh dấu, hãy loại bỏ màu đỏ từ tất cả các nút khác
                optionButtons.forEach((btn) => {
                    btn.classList.remove("gray");
                });
                // Thêm màu đỏ cho nút được click và set giá trị cho input
                button.classList.add("gray");
                choosenAnswerCheckInput1.value = answerValue; // Set giá trị tương ứng cho input
                choosenAnswerCheckInput0.value = answerValue; // Set giá trị tương ứng cho input
                choosenAnswerCheckInput2.value = answerValue; // Set giá trị tương ứng cho input
            }
        });
    });

    //thời gian đồng hồ
    document.addEventListener("DOMContentLoaded", function () {
        let questionTimeElement =
            document.querySelector(".question-time");
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
                        window.location.href = "result.html";
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

            let hoursString = hours.toString().padStart(2, "0");
            let minutesString = minutes.toString().padStart(2, "0");
            let secondsString = seconds.toString().padStart(2, "0");

            questionTimeElement.textContent = `${hoursString}:${minutesString}:${secondsString}`;
        }

        let countdownInterval = setInterval(updateTime, 1000);
    });
</script>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>


