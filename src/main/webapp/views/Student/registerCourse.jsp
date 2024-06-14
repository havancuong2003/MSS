<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Options</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f7f7f7; /* light gray background */
        }

        h1, h2 {
            color: #FF8C00; /* orange tone */
            margin-bottom: 10px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd; /* light gray border */
        }

        th, td {
            border: 1px solid #ddd; /* light gray border */
            padding: 10px;
            text-align: left;
            background-color: #FFFFFF; /* white background */
        }

        th {
            background-color: #F7F7F7; /* light gray background */
        }

        tr:nth-child(even) {
            background-color: #F2F2F2; /* light gray background */
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd; /* light gray border */
            background-color: #FFFFFF; /* white background */
        }

        input[type="submit"] {
            background-color: #FF8C00; /* orange tone */
            color: #FFFFFF; /* white text */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #FFA07A; /* darker orange tone */
        }

        a {
            text-decoration: none;
            color: #FF8C00; /* orange tone */
        }

        a:hover {
            color: #FFA07A; /* darker orange tone */
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
    .expired {
        display: none;
    }


    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

<a href="dashboard">Back</a>
<h1 id="notice">START from ${timePeriods.startRegister} to ${timePeriods.endRegister}: Semester ${timePeriods.semester.detail}</h1>

<div id="expired" class="${validDate ? 'expired' : ''}">
    <h1>The registration period has expired or has not yet arrived</h1>

</div>
<div id="contain" class="${validDate ? '' : 'expired'}">
    <h1>Students can only register for 5 courses in a semester</h1>

    <div id="messageContainer"></div>

    <h2> Course List Registered --- Number registered: <span id="totalRegister">${totalRegister}</span></h2>
    <table>
        <thead>
        <tr>
            <th>NO</th>
            <th>CODE</th>
            <th>DETAIL</th>
        </tr>
        </thead>
        <tbody id="courseRegistered">
        <c:forEach var="course" items="${courseRegistered}">
            <tr>
                <td>${course.id}</td>
                <td>${course.code}</td>
                <td>${course.detail}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Form for registering for courses -->
    <h2>Register Next for Courses</h2>
    <form id="registerForm">
        <input type="hidden" name="action" value="register">
        <select name="coursesToRegister">
            <c:forEach var="course" items="${courseRegister}">
                <option value="${course.id}">${course.code}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit">
    </form>

    <!-- Form for registering for course improvement -->
    <h2>Register Improve for Courses</h2>
    <form id="improveForm">
        <input type="hidden" name="action" value="improve">
        <select name="coursesToRegister">
            <c:forEach var="course" items="${courseImprove}">
                <option value="${course.id}">${course.code}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit">
    </form>

    <!-- Form for registering to learn courses again -->
    <h2>Register Learn Again for Courses</h2>
    <form id="learnAgainForm">
        <input type="hidden" name="action" value="learnAgain">
        <select name="coursesToRegister">
            <c:forEach var="course" items="${courseLearnAgain}">
                <option value="${course.id}">${course.code}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit">
    </form>
</div>
<script>
    $(document).ready(function () {
        $('form').on('submit', function (e) {
            e.preventDefault(); // Prevent the default form submission

            const $form = $(this);
            const action = $form.find('input[name="action"]').val();

            $.ajax({
                type: 'POST',
                url: 'RegisterCourse',
                data: $form.serialize(),
                success: function (response) {
                    console.log(response); // Print the response to the console
                    updatePage(action, response);
                },
                error: function () {
                    alert('An error occurred. Please try again.');
                }
            });
        });

        function updatePage(action, data) {
            $('#totalRegister').text(data.totalRegister);
            const startDate = formatDate(new Date(data.timePeriods.startRegister));
            const endDate = formatDate(new Date(data.timePeriods.endRegister));

            $('#notice').text(`START from \${startDate} to \${endDate}: Semester \${data.timePeriods.semester.detail}`);

            // Update courseRegistered table
            let courseRegisteredHtml = '';
            data.courseRegistered.forEach(function (course) {
                courseRegisteredHtml += `<tr>
                    <td>\${course.id}</td>
                    <td>\${course.code}</td>
                    <td>\${course.detail}</td>
                </tr>`;
            });
            $('#courseRegistered').html(courseRegisteredHtml);

            // Update select options based on action
            updateSelectOptions('registerForm', data.courseRegister);
            updateSelectOptions('improveForm', data.courseImprove);
            updateSelectOptions('learnAgainForm', data.courseLearnAgain);

            // Display success or error message
            displayMessage(data.ms.startsWith('Register course successfully') ? 'success' : 'error', data.ms);
            // Set visibility based on validDate
            $('#expired').removeClass().addClass(data.validDate ? 'expired' : '');
            $('#contain').removeClass().addClass(data.validDate ? '' : 'expired');
        }
        function formatDate(date) {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            return `\${year}-\${month}-\${day}`;
        }

        function updateSelectOptions(formId, courses) {
            const select = $('#' + formId).find('select[name="coursesToRegister"]');
            let optionsHtml = '';
            courses.forEach(function (course) {
                optionsHtml += `<option value="\${course.id}">\${course.code}</option>`;
            });
            select.html(optionsHtml);
        }

        function displayMessage(type, message) {
            const messageElement = $('<div>').addClass('message').text(message);
            if (type === 'success') {
                messageElement.addClass('success').css('color', 'green'); // Set color for success message
            } else if (type === 'error') {
                messageElement.addClass('error').css('color', 'red'); // Set color for error message
            }
            $('#messageContainer').empty().append(messageElement);
        }
    });
</script>

</body>
</html>

