<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/5/2024
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Send request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light blue background */
            margin: 0;
            padding: 0;
            /*display: flex;*/
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
            margin-left: 30vw;
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
            background-color: #FFA500; /* Darker blue on hover */
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
</head>
<body>
    <jsp:include page="/views/common/header.jsp"></jsp:include>

<div class="form-container">
    <div>
        <h2>Request Form</h2>
        <div class="note">
            <p><strong>Send an application to Academic Administration dept (Gửi đơn cho Phòng quản lý đào tạo)</strong></p>
            <p><strong>Lưu ý: V/v gửi đơn/email đến các phòng ban</strong></p>
            <p>Bộ phận xử lý đơn sẽ trả lời đơn/email của sinh viên</p>
            <p>Sinh viên cần cân nhắc trước khi gửi đơn/email với cùng một nội dung để nhận được trả lời/giải quyết nhanh nhất theo quy định.</p>
        </div>
        <form action="send-application" method="post">
            <table>
                <tr>
                    <td><label for="application">Request type:</label></td>
                    <td>
                        <select name="applicationCategory" id="application">
                            <option value="0">Choose Request Type (Chọn loại đơn)</option>
                            <c:forEach var="o" items="${listApplicationCategory}">
                                <option value="${o.category_id}" ${category_id == o.category_id ? 'selected' : ''}>${o.description}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="reason">Reason (Lý do):</label></td>
                    <td><textarea style="resize: none" name="reason" id="reason" rows="4" cols="50" required> ${reason}</textarea></td>
                </tr>
                <td colspan="2">
                    <p class="mess_wrong">${mess_wrong}</p>
                    <p class="mess_success">${mess_success}</p>
                </td>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Submit">
                    </td>
                </tr>
                <tr>
<%--                    <td colspan="2" style="text-align: right;">--%>
<%--                        <a href="${pageContext.request.contextPath}/${role}/dashboard" style="display: inline-block; padding: 10px 20px; margin: 10px 5px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">Back to home</a>--%>
<%--                    </td>--%>
                </tr>
            </table>
        </form>
    </div>

</div>
<jsp:include page="/views/common/footer.jsp"></jsp:include>
</body>
</html>
