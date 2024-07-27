<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/21/2024
  Time: 11:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

        .contain {
            width: 80%;
            margin: 120px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
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



    </style>
</head>
<body>
<jsp:include page="../../common/header.jsp" />
<div class="contain">

    <label for="semesters"><h1>Group Details</h1></label>
    <select id="semesters">
        <c:forEach items="${semesters}" var="s">
            <option value="${s.id}">${s.detail}</option>
        </c:forEach>
    </select>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Course</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${groups}" var="g">
            <tr>
                <td>${g.id}</td>
                <td>${g.name}</td>
                <td><a href="groupDetail?id=${g.id}">${g.course.code}</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="../../common/footer.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#semesters').change(function() {
            var semesterId = $(this).val();
            $.ajax({
                type: 'POST',
                url: 'viewGroup',
                data: { semesterId: semesterId },
                success: function(data) {
                    // Xử lý dữ liệu trả về và render lại table
                    var tableBody = '';
                    $.each(data.groups, function(index, group) {
                        tableBody += '<tr>' +
                            '<td>' + group.id + '</td>' +
                            '<td>' + group.name + '</td>' +
                            '<td>' + group.course.code + '</td>' +
                            '</tr>';

                    });
                    $('tbody').html(tableBody);
                    console.log("data: ", data);
                }
            });
        });
    });
</script>

</body>
</html>
