<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
                                            prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        h2 {
            font-size: 1.5em;
            color: #333333;
        }

        p {
            color: #666666;
        }

        select {
            margin-top: 10px;
            padding: 5px;
            font-size: 16px;
        }

        button {
            padding: 5px 10px;
            font-size: 14px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s, text-shadow 0.3s;
        }

        a:hover {
            color: #0056b3;
            text-shadow: 0px 0px 5px rgba(0, 91, 187, 0.5);
        }

        .header {
            background-color: #ccc;
            color: black;
            padding: 20px;
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
        }

        .header a {
            position: absolute;
            left: 20px;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #0056b3;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .header a:hover {
            background-color: #003d80;
            color: white;
        }

        footer {
            background-color: #f2f2f2;
            padding: 20px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 10;
            text-align: center;
        }

        .contain {
            width: 80%;
            margin: 120px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .content {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        .registerCourse {
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        .expired {
            display: none;
        }
        .message {
            font-size: 18px; /* Đặt kích thước phông chữ lớn hơn */
            padding: 15px; /* Tăng padding để làm cho `message` to hơn */
            border: 2px solid; /* Thêm đường viền */
            border-radius: 5px; /* Làm cho góc cong */
            margin: 20px auto; /* Căn giữa theo chiều ngang */
            max-width: 600px; /* Giới hạn chiều rộng tối đa */
            text-align: center; /* Căn giữa nội dung */
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <a href="dashboard">Back</a>
    <h1>Header</h1>
</div>
<h1>${validDate}</h1>
<div
        id="expired"
        class="${validDate eq 'true' ? 'expired' : 'ab'}"
        style="margin-top: 120px"
>
    <h1>The registration period has expired or has not yet arrived</h1>
</div>
<div class="${validDate eq 'true' ? 'ab' : 'expired'} contain">
    <h1 style="text-align: right">Semester: SU24</h1>

    <div class="content">
        <h2>Student register course for next semester:</h2>
        <h3>
            Start register from ${timePeriods.startRegister} to
            ${timePeriods.endRegister}
        </h3>
        <h3>Students can only register for 5 courses in a semester</h3>
        <div id="messageContainer"></div>
        <h3>
            Courses list registered:
            <span id="totalRegister">${totalRegister}</span> course
        </h3>
    </div>
    <table>
        <thead>
        <tr>
            <th>NO</th>
            <th>CODE</th>
            <th>DETAIL</th>
            <th>ACTION</th>
        </tr>
        </thead>
        <tbody id="courseRegistered">
        <c:forEach var="course" items="${courseRegistered}">
            <tr>
                <td>${course.id}</td>
                <td>${course.code}</td>
                <td>${course.detail}</td>
                <td>
                    <button>delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p class="registerCourse">Register for over-term study</p>
    <form id="registerForm">
        <input type="hidden" name="action" value="register" />
        <select name="coursesToRegister">
            <c:forEach var="course" items="${courseRegister}">
                <option value="${course.id}">${course.code}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit" />
    </form>

    <p class="registerCourse">Register for improve grade</p>
    <form id="improveForm">
        <input type="hidden" name="action" value="improve" />
        <select name="coursesToRegister">
            <c:forEach var="course" items="${courseImprove}">
                <option value="${course.id}">${course.code}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit" />
    </form>
    <p class="registerCourse">Register for study again</p>
    <form id="learnAgainForm">
        <input type="hidden" name="action" value="learnAgain" />
        <select name="coursesToRegister">
            <c:forEach var="course" items="${courseLearnAgain}">
                <option value="${course.id}">${course.code}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit" />
    </form>
</div>
<footer>
    <p>Footer</p>
</footer>
<script>
    $(document).ready(function () {
        $("form").on("submit", function (e) {
            e.preventDefault(); // Prevent the default form submission

            const $form = $(this);
            const action = $form.find('input[name="action"]').val();

            $.ajax({
                type: "POST",
                url: "RegisterCourse",
                data: $form.serialize(),
                success: function (response) {
                    console.log(response); // Print the response to the console
                    updatePage(action, response);
                },
                error: function () {
                    alert("An error occurred. Please try again.");
                },
            });
        });

        function updatePage(action, data) {
            $("#totalRegister").text(data.totalRegister);
            const startDate = formatDate(
                new Date(data.timePeriods.startRegister)
            );
            const endDate = formatDate(
                new Date(data.timePeriods.endRegister)
            );

            $("#notice").text(
                `START from \${startDate} to \${endDate}: Semester \${data.timePeriods.semester.detail}`
            );

            // Update courseRegistered table
            let courseRegisteredHtml = "";
            data.courseRegistered.forEach(function (course) {
                courseRegisteredHtml += `<tr>
                            <td>\${course.id}</td>
                            <td>\${course.code}</td>
                            <td>\${course.detail}</td>
<td>
                    <button>delete</button>
                </td>
                        </tr>`;
            });
            $("#courseRegistered").html(courseRegisteredHtml);

            // Update select options based on action
            updateSelectOptions("registerForm", data.courseRegister);
            updateSelectOptions("improveForm", data.courseImprove);
            updateSelectOptions(
                "learnAgainForm",
                data.courseLearnAgain
            );

            // Display success or error message
            displayMessage(
                data.ms.startsWith("Register course successfully")
                    ? "success"
                    : "error",
                data.ms
            );
            // Set visibility based on validDate
            $("#expired")
                .removeClass()
                .addClass(data.validDate ? "expired" : "");
            $("#contain")
                .removeClass()
                .addClass(data.validDate ? "" : "expired");
        }

        function formatDate(date) {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, "0");
            const day = String(date.getDate()).padStart(2, "0");
            return `\${year}-\${month}-\${day}`;
        }

        function updateSelectOptions(formId, courses) {
            const select = $("#" + formId).find(
                'select[name="coursesToRegister"]'
            );
            let optionsHtml = "";
            courses.forEach(function (course) {
                optionsHtml += `<option value="\${course.id}">\${course.code}</option>`;
            });
            select.html(optionsHtml);
        }

        function displayMessage(type, message) {
            const messageElement = $("<div>")
                .addClass("message")
                .text(message);
            if (type === "success") {
                messageElement
                    .addClass("success")
                    .css("color", "green"); // Set color for success message
            } else if (type === "error") {
                messageElement.addClass("error").css("color", "red"); // Set color for error message
            }
            $("#messageContainer").empty().append(messageElement);
        }
    });
</script>
</body>
</html>
