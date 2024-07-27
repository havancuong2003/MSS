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
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <style>body,
    html {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: rgba(192, 192, 192, 0.37);
    }

    .containers {
        display: flex;
        flex-direction: column;
        height: 100%;
        background-color: rgb(242 241 241 / 78%);
    }

    .headers {
        background-color: #ffb157;
        color: white;
        display: flex;
        align-items: center;
        padding: 0 20px;
        height: 70px;
    }

    .home-icon {
        background-color: white;
        padding: 10px;
        font-size: 17px;
        color: black;
        text-decoration: none;
    }

    .home-icon img {
        height: 24px;
        margin-right: 10px;
    }

    .username {
        margin-left: auto;
    }

    .contents {
        display: flex;
        flex-grow: 1;
    }

    .question-section {
        flex: 3;
        display: flex;
        flex-direction: column;
        padding: 20px;
    }

    .question-area {
        background-color: rgb(255 252 252);
        flex: 1;
        font-size: 24px;
        border-radius: 10px;
        box-shadow: 1px 2px 7px rgb(255 255 255 / 7%);
        position: relative;
    }

    .question-area p {
        word-wrap: break-word;
        max-width: 35vw;
        max-height: 450px;
        margin: 20px 0px 20px 20px;
        background-color: rgba(255, 255, 255, 0.753);
        display: inline-block;
        padding: 10px;
    }

    .question-area img {
        margin: 20px 30px 0px 20px;
        height: 300px;
        float: right;
    }

    .options {
        display: flex;
        flex-wrap: wrap;
        margin-top: 20px;
        height: 30vh;
        width: 100%;
    }

    .options div {
        width: 100%;
        display: flex;
        justify-content: space-between;
    }

    .option-btn {
        flex: 1 1 50%;
        margin: 20px;
        padding: 20px;
        background-color: white;
        border: none;
        cursor: pointer;
        text-align: left;
        font-size: 18px;
        width: 30vw;
        border: 5px solid rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
    }

    /* ben phai */

    .sidebars {
        flex: 1;
        /* display: flex;
        flex-direction: column; */
        padding: 20px;
        background-color:#b7b9c366;
        margin: 40px 40px 60px 20px;
        border-radius: 10px;
        position: relative;
    }

    .questions-list {
        flex: 1;
        background-color: white;
        padding: 20px;
        overflow-y: scroll;
        height: 500px;
        display: grid;
        border-radius: 5px;
        grid-template-columns: auto auto auto auto auto;
        grid-template-rows: 80px 80px 80px 80px;
    }

    .list-item {
        padding: 10px;
        background-color: #cedff0;
        margin: 5px 0;
        cursor: pointer;
        height: 70px;
        width: 70px;
        text-align: center;
        align-items: center;
    }

    .list-item.active {
        background-color: red !important;
        color: white;
    }

    .navigation-buttons {
        margin-top: 20px;
    }

    .navigation-buttons-up {
        display: flex;
        justify-content: space-between;
    }

    .nav-btn,
    .finish-btn {
        width: 120px;
        padding: 10px;
        margin-top: 10px;
        background-color: white;
        border: none;
        color: black;
        font-weight: 600;
        font-size: 17px;
        border-radius: 5px;
        cursor: pointer;
    }

    .finish-btn {
        background-color: #007bff;
        font-size: 18px;
        color: white;
        position: absolute;
        bottom: 20px;
        right: 20px;
        width: 150px;
    }

    .gray {
        background-color: #91b2c3; /* hoặc bất kỳ thuộc tính CSS nào bạn muốn */
    }
    </style>
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

    //xử lí chọn câu hỏi tương ứng

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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-Vo0ewNxsZn2Zr2sfotIsOzKQC4fTJPfdHCw2t1jPj2QgW9FpHkAPc6k7cWz1V6k4" crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
</body>
</html>


