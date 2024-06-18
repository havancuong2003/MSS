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
            <c:forEach items="${questionDetails}" var="ques" varStatus="status">
                <div class="question-section" id="question-${status.index}">
                    <div class="question-area">
                        <p id="questionText">${status.index + 1}. ${ques.getQuestionDetail()}</p>
                    </div>
                    <div class="options">
                        <div>
                            <button class="option-btn ${listanswer.get(status.index) == 1 ? 'gray' : ''}" onclick="handleClick(${status.index}, 1, this)">${ques.getAnswers().get(0).getAnswer()}</button>
                            <button class="option-btn ${listanswer.get(status.index) == 3 ? 'gray' : ''}" onclick="handleClick(${status.index}, 3, this)">${ques.getAnswers().get(2).getAnswer()}</button>
                        </div>
                        <div>
                            <button class="option-btn ${listanswer.get(status.index) == 2 ? 'gray' : ''}" onclick="handleClick(${status.index}, 2, this)">${ques.getAnswers().get(1).getAnswer()}</button>
                            <button class="option-btn ${listanswer.get(status.index) == 4 ? 'gray' : ''}" onclick="handleClick(${status.index}, 4, this)">${ques.getAnswers().get(3).getAnswer()}</button>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="sidebarclone"></div>
        <div class="sidebars">
            <div class="questions-list">
                <c:forEach var="i" begin="1" end="${size}">
                            <div class="list-item
                                    <c:if test="${listanswer.get(i - 1) != 0 && listanswer.get(i - 1) != null}">
                                        isChoosenAnswer
                                    </c:if> " id="list-item-${i - 1}"
                            >${i}</div>
                </c:forEach>
<%--                <c:forEach var="i" begin="1" end="${size}">--%>
<%--                    <div class="list-item" id="list-item-${i - 1}">${i}</div>--%>
<%--                </c:forEach>--%>

            </div>
            <div class="navigation-buttons">
                <div class="navigation-buttons-up">



                </div>
                <div class="question-time">00:00:50</div>
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
                <form action="test" method="post" id="finishForm">
                    <input id="timeInterval" type="hidden" name="timeInterval" value="">

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

        // Hàm xử lý khi nút được nhấp
        window.handleClick = (questionId, answerId, button) => {
            sendAnswer(questionId, answerId);//nhaapj cau tra loi vao serrvlet
            toggleGrayClass(questionId, button);// check nut ddax basm chua, tach theo cau hoi
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
                    document.getElementById("list-item-" + questionId).classList.remove('isChoosenAnswer');
                    sendAnswer(questionId, 0);  /// an lai eset cau tra loi ề 0
                } else {
                    optionButtons.forEach(btn => {
                        btn.classList.remove('gray');
                    });
                    button.classList.add('gray');
                    document.getElementById("list-item-" + questionId).classList.add('isChoosenAnswer');
                }
            } else {
                console.error("No question section found for questionId: " + questionId);
            }
        };
    });




    //thời gian đồng hồ
    document.addEventListener("DOMContentLoaded", function () {
        let questionTimeElement = document.querySelector(".question-time");

        // Lấy thời gian ban đầu từ nội dung của phần tử question-time
        let timeParts = questionTimeElement.textContent.split(":");
        let hours = parseInt(timeParts[0], 10);
        let minutes = parseInt(timeParts[1], 10);
        let seconds = parseInt(timeParts[2], 10) || 0;

        // Kiểm tra nếu có thời gian đếm ngược được lưu trong localStorage
        if (sessionStorage.getItem('countdownHours') !== null &&
            sessionStorage.getItem('countdownMinutes') !== null &&
            sessionStorage.getItem('countdownSeconds') !== null) {
            hours = parseInt(sessionStorage.getItem('countdownHours'));
            minutes = parseInt(sessionStorage.getItem('countdownMinutes'));
            seconds = parseInt(sessionStorage.getItem('countdownSeconds'));
        }

        function updateTime() {
            sessionStorage.clear();
            // Cập nhật thời gian
            if (seconds === 0) {
                if (minutes === 0) {
                    if (hours === 0) {
                        clearInterval(countdownInterval);
                        questionTimeElement.textContent = "00:00:00";
                        let form = document.getElementById("finishForm");
                        if (form) {
                            form.submit();
                        }
                        // Xóa tất cả dữ liệu trong localStorage
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

            // Định dạng và hiển thị lại thời gian
            let hoursString = hours.toString().padStart(2, '0');
            let minutesString = minutes.toString().padStart(2, '0');
            let secondsString = seconds.toString().padStart(2, '0');

            questionTimeElement.textContent = hoursString + ":" + minutesString + ":" + secondsString;

            // Lưu trạng thái của thời gian đếm ngược vào localStorage
            sessionStorage.setItem('countdownHours', hours);
            sessionStorage.setItem('countdownMinutes', minutes);
            sessionStorage.setItem('countdownSeconds', seconds);
        }
        // Khởi tạo đếm ngược ban đầu
        updateTime();

        // Cập nhật thời gian mỗi giây
        let countdownInterval = setInterval(updateTime, 1000);
    });

</script>
<script src="./js/bootstrap.min.js"></script>
</body>s

</html>
