<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
<form id="myForm">
    <h1 id="error" style="color: red"></h1>
    <input type="hidden" name="description" value="${timePeriods != null ? timePeriods.semester.detail : ''}">
    <c:choose>
        <c:when test="${timePeriods.startChangeClass == null}">

            Change class from: <input type="date" id="startDate" name="startDate"/> to <input type="date" id="endDate"
                                                                                              name="endDate"/>


        </c:when>
        <c:otherwise>

            Update changeClass from:

            <input type="date" id="startDate" name="startDate" value="${timePeriods.startChangeClass}"/>


            to <input type="date" id="endDate" name="endDate" value="${timePeriods.endChangeClass}"/>

        </c:otherwise>
    </c:choose>


    <button id="btn" type="submit">Submit</button>

</form>

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
