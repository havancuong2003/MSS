<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
        }

        header {
            background-color: #1a1a1a;
            color: #fff;
            padding: 20px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
           
        }

        footer {
            background-color: #1a1a1a;
            color: #fff;
            padding: 20px;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
        }

        .container {
            margin: 120px auto 80px;
            padding: 20px;
            max-width: 800px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .current-term, .set-time {
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .form-settime {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
            font-size: 16px;
        }

        button {
            display: inline-block;
            background-color: #1a73e8;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 16px;
        }

        button:hover {
            background-color: #155ab6;
            transform: translateY(-2px);
        }

        button:active {
            background-color: #0f4a8d;
            transform: translateY(0);
        }

        a.back-button {
            display: inline-block;
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
            position: absolute;
            top: 15px;
            left: 15px;
            transition: background-color 0.3s, transform 0.3s;
        }

        a.back-button:hover {
            background-color: #388e3c;
            transform: translateY(-2px);
        }

        a.back-button:active {
            background-color: #2e7031;
            transform: translateY(0);
        }

        h1, h2, h3, h4 {
            margin-top: 0;
            color: #333;
        }

        p {
            margin: 0 0 10px;
        }

        .notice {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .notice div {
            width: fit-content;
            border: 3px solid #ff4d4d;
            border-radius: 10px;
            padding: 20px;
            background-color: #ffe6e6;
        }

        .notice h2 {
            color: #ff4d4d;
        }

        .notice h3 {
            color: #cc0000;
        }

        .error-message {
            color: #ff4d4d;
            font-weight: bold;
        }

        .success-message {
            color: #4caf50;
            font-weight: bold;
        }

        @media only screen and (max-width: 768px) {
            .container {
                padding: 10px;
            }

            header, footer {
                padding: 10px;
            }

            a.back-button {
                font-size: 14px;
                padding: 8px 16px;
            }
        }

        @media only screen and (max-width: 480px) {
            .container {
                font-size: 14px;
                padding: 10px;
            }

            header, footer {
                padding: 8px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<header>
    <a class="back-button" href="dashboard">Back</a>
    <h1>Header</h1>
</header>

<div class="container">
    <div class="current-term">
        <h2>Current term: ${semester.detail}</h2>
        <p>SU24 from ${semester.start} to ${semester.end}</p>
    </div>

    <div class="set-time">
        <h2>
            Set time for students to register for courses for the next
            semester: ${nextSemester.detail}
        </h2>
        <p>${nextSemester.detail} start from ${nextSemester.start} to ${nextSemester.end}</p>

        <form id="myForm">
            <input type="hidden" name="description" value="${requestScope.timePeriods == 'null' ? '' : requestScope.timePeriods.semester.id}">
            <c:choose>
                <c:when test="${requestScope.timePeriods == 'null'}">
                    <h1 class="error-message">${requestScope.status}</h1>
                    <a href="registerTime"><button type="button">Go set time register</button></a>
                </c:when>
                <c:when test="${requestScope.timePeriods != 'null'}">
                    <c:choose>
                        <c:when test="${requestScope.add == true}">
<%--                            <div class="notice">--%>
<%--                                <div>--%>
<%--                                    <h2>Notice</h2>--%>
<%--                                    <h3><i>Start date</i> must be after <i>end of register time</i> and--%>
<%--                                        <i>end date</i> must before <i>end date of semester</i></h3>--%>
<%--                                    <h3>Time register course end at: ${timePeriods.endRegister}</h3>--%>
<%--                                    <h3>Time Semester end at: ${semester.end}</h3>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <h2 id="error" class="error-message"></h2>
                            <c:choose>
                                <c:when test="${timePeriods.startChangeClass == null}">
                                    <label for="startDate">Change class time from:</label>
                                    <input type="date" id="startDate" name="startDate"/>
                                    <label for="endDate" style="margin-top: 20px">To:</label>
                                    <input type="date" id="endDate" name="endDate"/>
                                </c:when>
                                <c:otherwise>
                                    <label for="startDate">Update Time Change Class from:</label>
                                    <input type="date" id="startDate" name="startDate" value="${timePeriods.startChangeClass}"/>
                                    <label for="endDate" style="margin-top: 20px">To:</label>
                                    <input type="date" id="endDate" name="endDate" value="${timePeriods.endChangeClass}"/>
                                </c:otherwise>
                            </c:choose>
                            <br/>
                            <button id="btn" type="submit" style="margin-top: 20px">Save</button>
                        </c:when>
                        <c:otherwise>
                            <h1 class="error-message">${requestScope.status}</h1>
                            <a href="registerTime"><button type="button">Go set time register</button></a>
                        </c:otherwise>
                    </c:choose>
                </c:when>
            </c:choose>
        </form>
    </div>
</div>
<footer>
    <p>Footer</p>
</footer>
<script>
    $(document).ready(function () {
        $("#myForm").submit(function (event) {
            event.preventDefault(); // Prevent default form submission

            const startDate = $("#startDate").val();
            const endDate = $("#endDate").val();
            const description = $('[name="description"]').val();
            if (startDate === "" || endDate === "") {
                console.log("Start date or end date is empty");
                $("#error")
                    .css("color", "red")
                    .text("Start date or end date is empty");
                return;
            }
            $("#btn").attr("disabled", true).text("Submitting...");
            $.ajax({
                url: "timeChangeClass",
                type: "POST",
                data: {
                    startDate: startDate,
                    endDate: endDate,
                    description: description,
                },
                dataType: "json",
                success: function (response) {
                    console.log("response",response)
                    // Handle success response from backend here
                    $("#error")
                        .css("color", "green")
                        .text(response.res);
                    setTimeout(function () {
                        $("#successMessage").text(""); // Xóa thông báo sau 2 giây
                        $("#btn")
                            .attr("disabled", false)
                            .text("Submit"); // Bật nút Submit trở lại
                        location.reload(); // Reload trang
                    }, 2000); // Đợi 2 giây trước khi thực hiện
                },
                error: function (xhr, status, error) {
                    $("#btn").attr("disabled", false).text("Submit"); // Bật nút Submit trở lại
                    // Handle error response from backend here
                    console.error("Error:", error);
                    console.error("status:", status);
                    console.error("xhr:", xhr);
                    $("#error").text(xhr.responseJSON.message);
                },
            });
        });
    });
</script>
</body>
</html>

