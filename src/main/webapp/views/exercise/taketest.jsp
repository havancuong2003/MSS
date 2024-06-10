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
    <link rel="stylesheet" href="./css/bootstrap.min.css">
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
            <div class="question-section 1">
                <div class="question-area">
                    <p id="questionText">1 + 1 =
                        ?aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaxxxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                        <!-- tùy chọn thời gian, điểm , index của câu -->
                        <!-- <div class="question-time">00:01:10</div> -->
                        <!-- <div class="question-time">1/10</div> -->
                        <!-- <div class="question-time">1 đ</div> -->
                </div>
                <div class="options">
                    <div>
                        <button class="option-btn">A. 0</button>
                        <button class="option-btn">C. 4</button>
                    </div>
                    <div>
                        <button class="option-btn">B. 3</button>
                        <button class="option-btn">D. 5</button>
                    </div>
                </div>
            </div>
            <div class="question-section 2">
                <div class="question-area">
                    <p id="questionText">1 + 1 =
                        ?aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaxxxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

                        <!-- tùy chọn thời gian, điểm , index của câu -->
                        <!-- <div class="question-time">00:01:10</div> -->
                        <!-- <div class="question-time">1/10</div> -->
                        <!-- <div class="question-time">1 đ</div> -->
                </div>
                <div class="options">
                    <div>
                        <button class="option-btn">A. 0</button>
                        <button class="option-btn">C. 4</button>
                    </div>
                    <div>
                        <button class="option-btn">B. 3</button>
                        <button class="option-btn">D. 5</button>
                    </div>
                </div>
            </div>
            <div class="question-section 3">
                <div class="question-area">
                    <p id="questionText">1 + 1 =
                        ?aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaxxxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

                        <!-- tùy chọn thời gian, điểm , index của câu -->
                        <!-- <div class="question-time">00:01:10</div> -->
                        <!-- <div class="question-time">1/10</div> -->
                        <!-- <div class="question-time">1 đ</div> -->
                </div>
                <div class="options">
                    <div>
                        <button class="option-btn">A. 0</button>
                        <button class="option-btn">C. 4</button>
                    </div>
                    <div>
                        <button class="option-btn">B. 3</button>
                        <button class="option-btn">D. 5</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="sidebarclone"></div>
        <div class="sidebars">
            <div class="questions-list">
                <div class="list-item">1</div>
                <div class="list-item">2</div>
                <div class="list-item">3</div>
                <div class="list-item">4</div>
                <div class="list-item">5</div>
                <div class="list-item active">6</div>
                <div class="list-item">7</div>
                <div class="list-item">8</div>
                <div class="list-item">9</div>
                <div class="list-item">1</div>
                <div class="list-item">2</div>
                <div class="list-item">3</div>
                <div class="list-item">4</div>
                <div class="list-item">5</div>
                <div class="list-item">6</div>
                <div class="list-item">7</div>
                <div class="list-item">8</div>
                <div class="list-item">9</div>
                <div class="list-item">1</div>
                <div class="list-item">2</div>
                <div class="list-item">3</div>
                <div class="list-item">4</div>
                <div class="list-item">5</div>
                <div class="list-item">6</div>
                <div class="list-item">7</div>
                <div class="list-item">8</div>
                <div class="list-item">9</div>
                <div class="list-item">1</div>
                <div class="list-item">2</div>
                <div class="list-item">3</div>
                <div class="list-item">4</div>
                <div class="list-item">5</div>
                <div class="list-item">6</div>
                <div class="list-item">7</div>
                <div class="list-item">8</div>
                <div class="list-item">9</div>

            </div>
            <div class="navigation-buttons">
                <div class="navigation-buttons-up">
                    <form action="" method="">
                        <input type="hidden" name="question-index" value="">
                        <input type="hidden" name="question-answer" value="">
                        <button class="nav-btn">Back</button>
                    </form>

                    <form action="" method="">
                        <input type="hidden" name="question-index" value="">
                        <input type="hidden" name="question-answer" value="">
                        <button class="nav-btn">Next</button>
                    </form>


                </div>
                <div class="navigation-buttons-down">
                    <button class="finish-btn" data-bs-target="#log-out" data-bs-toggle="modal">Finish</button>
                </div>

            </div>
        </div>
    </div>
</div>


<!--pop-up logout-->
<!-- co the cop mau cho pop-up khac -->
<div class="modal fade" id="log-out" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">Are you sure to finish?</h1>
            </div>
            <div class="modal-body" style="display: flex; justify-content: space-between;">
                <button type="button" class="btn btn-danger" class="btn-close" data-bs-dismiss="modal">No</button>
                <a href="result.html" class="btn btn-primary" style="text-decoration: none; color:white">
                    Yes
                </a>
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

    //check tích câu trả lời
    // Lấy tất cả các nút lựa chọn
    const optionButtons = document.querySelectorAll('.option-btn');

    // Lặp qua từng nút và thêm sự kiện click
    optionButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Kiểm tra xem nút đó đã được đỏ chưa
            const isGray = button.classList.contains('gray');

            // Nếu đã đỏ, hãy loại bỏ màu đỏ
            if (isGray) {
                button.classList.remove('gray');
            } else {
                // Nếu chưa đỏ, hãy loại bỏ màu đỏ từ tất cả các nút khác
                optionButtons.forEach(btn => {
                    btn.classList.remove('gray');
                });
                // Thêm màu đỏ cho nút được click
                button.classList.add('gray');
            }
        });
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
