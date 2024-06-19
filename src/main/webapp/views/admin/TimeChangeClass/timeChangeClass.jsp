<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Time Change Class</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #f0f0f0;
            padding: 20px;
            text-align: center;
        }
        header button#home {
            position: absolute;
            top: 35px;
            left: 50px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        header button#home a {
            color: white;
            text-decoration: none;
        }
        header button#home:hover {
            background-color: #45a049;
        }
        main {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin-top: 100px; /* adjust the margin to fit the header height */
        }
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #f0f0f0;
            padding: 20px;
            text-align: center;
        }
        form {
            margin: 20px;
        }
        input[type="date"] {
            padding: 5px;
            margin-right: 10px;
        }
        button[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        #btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<header>
    <h1>Time Change Class</h1>
    <button id="home" type="button"><a href="dashboard">Home</a></button>

</header>
<main>
    <form id="myForm">
        <h1 id="error" style="color: red"></h1>
        <input type="hidden" name="description" value="${timePeriods != null ? timePeriods.semester.detail : ''}">
        <c:choose>
            <c:when test="${timePeriods.startChangeClass == null}">
                Change class from: <input type="date" id="startDate" name="startDate"/> to <input type="date" id="endDate" name="endDate"/>
            </c:when>
            <c:otherwise>
                Update changeClass from: <input type="date" id="startDate" name="startDate" value="${timePeriods.startChangeClass}"/> to <input type="date" id="endDate" name="endDate" value="${timePeriods.endChangeClass}"/>
            </c:otherwise>
        </c:choose>
        <button id="btn" type="submit">Submit</button>
    </form>
</main>
<footer>
    <p>&copy; 2023 Time Change Class</p>
</footer>
<script>
    $(document).ready(function () {
        $('#myForm').submit(function (event) {
            event.preventDefault(); // Prevent default form submission

            const startDate = $('#startDate').val();
            const endDate = $('#endDate').val();
            const description = $('[name="description"]').val();
            if (startDate === '' || endDate === '') {
                console.log('Start date or end date is empty');
                $('#error').css("color", "red").text("Start date or end date is empty");
                return;
            }
            $('#btn').attr('disabled', true).text('Submitting...');
            $.ajax({
                url: 'timeChangeClass',
                type: 'POST',
                data: {startDate: startDate, endDate: endDate, description: description},
                dataType: 'json',
                success: function (response) {
                    // Handle success response from backend here
                    $('#error').css("color", "green").text(response.res);
                    setTimeout(function() {
                        $('#successMessage').text(''); // Xóa thông báo sau 2 giây
                        $('#btn').attr('disabled', false).text('Submit'); // Bật nút Submit trở lại
                        location.reload(); // Reload trang
                    }, 2000); // Đợi 2 giây trước khi thực hiện
                },
                error: function (xhr, status, error) {
                    $('#btn').attr('disabled', false).text('Submit'); // Bật nút Submit trở lại
                    // Handle error response from backend here
                    console.error('Error:', error);
                    console.error('status:', status);
                    console.error('xhr:', xhr.responseJSON);
                    $('#error').text(xhr.responseJSON);
                }
            });
        });
    });
</script>
</body>
</html>
