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
<%--    <link rel="stylesheet" href="./css/taketest.css">--%>

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <style>
        .isChoosenAnswer{
            background-color:#92bfbf;
        }

        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: rgba(192, 192, 192, 0.37);
        }

        .containers {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .headers {
            background-color: #9fb4e2;
            color: white;
            display: flex;
            align-items: center;
            padding: 0 20px;
            height: 70px;
        }

        .home-icon{
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
            border: 1px solid rgb(223, 4, 4);
            background-color: #f5f5f5;
        }

        .question-area {
            flex: 1;
            display: flex;
            font-size: 24px;
            position: relative;
            background-color: antiquewhite;
        }

        .question-area p{
            word-wrap: break-word;
            max-width: 35vw;
            max-height: 450px;
            margin: 20px 0px 20px 20px;
            display: inline-block;
            padding: 10px;
        }

        .question-area img{
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

        .option-btn:hover{
            border: 2px solid grey;
        }

        .options div{
            width: 100%;
            display: flex;
            justify-content: space-between;

        }

        .option-btn {
            flex: 1 1 50%;
            margin: 20px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.986);
            border: none;
            cursor: pointer;
            text-align: left;
            font-size: 18px;
            width: 30vw;
            border-radius: 10px;

        }

        /* ben phai */

        .sidebars {
            flex: 1;
            padding: 20px;
            background-color: #a6accc63;
            margin: 40px 40px 60px 20px;
            position: fixed;
            right: 0;
        }

        .sidebarclone{
            width: 30%;
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

        .list-item .isChoosenAnswer{
            background-color:#92bfbf;
        }

        .navigation-buttons {
            margin-top: 20px;
        }

        .navigation-buttons-up{
            display: flex;
            justify-content: space-between;
        }

        .nav-btn, .finish-btn {
            width: 120px;
            padding: 10px;
            margin-top: 10px;
            background-color: rgb(131, 193, 255);
            border: none;
            color: rgb(19, 10, 10);
            font-weight: 600;
            font-size: 17px;
            border-radius: 5px;
            cursor: pointer;
            border-radius: 15px;
        }

        .finish-btn {
            background-color: #0073ee;
            font-size: 18px;
            color: white;
            bottom: 20px;
            border-radius: 15px;
        }

        .navigation-buttons-down{
            display: flex;
            justify-content: right;
        }

        .gray {
            background-color: rgba(107, 184, 119, 0.342);
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
                <div class="question-time">00:20:00</div>
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


    // xu li ajaax vaf check answer trong cau hoi
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
            sendAnswer(questionId, answerId);//nhâpj cau tra loi vao servlet
            toggleGrayClass(questionId, button);// check nut đã bấm chưa, tách theo cau hoi
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
                    sendAnswer(questionId, 0);  /// an lai reset cau tra loi ề 0
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-Vo0ewNxsZn2Zr2sfotIsOzKQC4fTJPfdHCw2t1jPj2QgW9FpHkAPc6k7cWz1V6k4" crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</body>

</html>
