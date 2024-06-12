<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/9/2024
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light blue background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff; /* White background for form */
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #FF6600; /* Dark blue text */
        }

        .note {
            background-color: #FFB366; /* Light blue note background */
            padding: 10px;
            border-left: 5px solid #FF6600; /* Dark blue border */
            margin-bottom: 20px;
        }

        .note p {
            margin: 5px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        label {
            font-weight: bold;
            color: #FF6600; /* Dark blue text */
        }

        select, textarea, input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
            resize: vertical; /* Allow only vertical resizing */
        }

        input[type="submit"] {
            background-color: #FF6600; /* Dark blue button */
            color: white;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #003366; /* Darker blue on hover */
        }

        .mess_wrong {
            color: red;
            text-align: center;
            margin: 5px 0;
        }

        .mess_success {
            color: green;
            text-align: center;
            margin: 5px 0;
        }

        @media screen and (max-width: 768px) {
            .form-container {
                width: 90%;
            }

            table, td {
                display: block;
                width: 100%;
            }

            td {
                margin-bottom: 10px;
            }

            td:last-child {
                margin-bottom: 0;
            }
        }


    </style>
</head>
<body>
<div class="form-container">
    <c:if test="${status == '2'}">
        <h2>Response Form</h2>
    </c:if>
    <c:if test="${status == '3'}">
        <h2>Reject Form</h2>
    </c:if>
    <div class="note">
        <c:if test="${status == '2'}">
            <p><strong>Send an response to Student (Gửi phản hồi cho sinh viên )</strong></p>
        </c:if>
        <c:if test="${status == '3'}">
            <p><strong>Send an reason reject to Student (Gửi phản hồi cho sinh viên )</strong></p>
        </c:if>
    </div>
    <form action="send-response" method="post" onsubmit="disableSubmitButton()">
        <input type="hidden" value="${email}" name="email">
        <input type="hidden" value="${application_id}" name="application_id">
        <input type="hidden" value="${status}" name="status">
        <input type="hidden" value="${reject}" name="reject">
        <table>
            <tr>
                <td><label for="application">Application type:</label></td>
                <td>
                    <select name="applicationCategory" id="application">
                        <option value="0">Choose Application Type (Chọn loại đơn)</option>
                        <c:forEach var="o" items="${listApplicationCategory}">
                            <option value="${o.category_id}" ${category_id == o.category_id ? "selected" : ""}>${o.description}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="reason">Reason (Lý do):</label></td>
                <td><textarea style="resize: none" name="reason" id="reason" rows="4" cols="50" required> ${reason}</textarea></td>
            </tr>
            <tr>
                <td><label>Response (Phản hồi):</label></td>
                <td><textarea style="resize: none" name="response" id="response" rows="4" cols="50">${response}</textarea></td>
            </tr>
            <td colspan="2">
                <p style="color: green; text-align: center">${mess_response}</p>
                <c:if test="${mess_response_check != null }">
                    <p style="color: red">${mess_response_check}</p>
                </c:if>
            </td>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit"  id="submit-button" value="Submit">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right;">
                    <a href="manage-application" style="display: inline-block; padding: 10px 20px; margin: 10px 5px; background-color: #FF6600; color: white; text-decoration: none; border-radius: 4px;">Back Manage Application</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    function disableSubmitButton() {
        const submitButton = document.getElementById('submit-button');
        submitButton.disabled = true;
        submitButton.value = 'Processing...';
    }
</script>
</body>
</html>
