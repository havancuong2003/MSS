<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/2/2024
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Semester and Grade List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            padding: 20px;
        }
        h1, h2 {
            color: #007bff;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin-bottom: 10px;
        }
        ul li button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
            text-align: left;
        }
        ul li button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        table th, table td {
            border: 1px solid #dee2e6;
            padding: 10px;
            text-align: left;
        }
        table thead {
            background-color: #007bff;
            color: #ffffff;
        }
        table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .hidden-inputs {
            display: none;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Semester List</h1>
    <ul>
        <c:forEach items="${requestScope.semester}" var="s">
            <li>
                <button onclick="setSemesterId(${s.id})">${s.detail}</button>
            </li>
        </c:forEach>
    </ul>
    <input type="hidden" id="semesterId" name="semesterId" value="">
    <h2>Group List</h2>
    <ul id="groupsList">
    </ul>
    <input type="hidden" id="gid" name="gid" value="">
    <table>
        <thead>
        <tr>
            <th>Category</th>
            <th>Grade Item</th>
            <th>Weight</th>
            <th>Grade</th>
        </tr>
        </thead>
        <tbody id="gradesTableBody">
        <!-- Bảng điểm sẽ được điền vào đây -->
        </tbody>
    </table>
</div>
<script>
    function setSemesterId(id) {
        document.getElementById("semesterId").value = id;
        getGroup();
    }

    function setGroupId(id) {
        document.getElementById("gid").value = id;
        getGrade();
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function getGroup() {
        const ses = document.getElementById("semesterId").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/student/viewgrade",
            type: "POST",
            dataType: "JSON",
            data: {
                sesid: ses
            },
            success: function (data) {
                var groups = data.groups;
                var list = document.getElementById("groupsList");
                list.innerHTML = "";
                groups.forEach(function (group) {
                    list.innerHTML += '<li><button onclick="setGroupId(' + group.id + ')">' + group.course.code + ' - ' + group.course.detail + ' - ' + group.name + '</button></li>';
                });
            }
        });
    }

    function getGrade() {
        const ses = document.getElementById("semesterId").value;
        const gid = document.getElementById("gid").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/student/viewgrade",
            type: "POST",
            dataType: "JSON",
            data: {
                sesid: ses,
                gid: gid
            },
            success: function (data) {
                var marks = data.marks;
                console.log(marks);
                displayGrades(marks);
            }
        });
    }
    function displayGrades(marks) {
        var tableBody = document.getElementById("gradesTableBody");
        tableBody.innerHTML = "";

        var lastCategoryId = null;
        marks.forEach(function(record, index) {
            var row = document.createElement("tr");

            // Kiểm tra nếu category id khác với category id cuối cùng
            if (lastCategoryId !== record.gradeItem.category.id) {
                var categoryCell = document.createElement("td");
                categoryCell.rowSpan = marks.filter(item => item.gradeItem.category.id === record.gradeItem.category.id).length;
                categoryCell.textContent = record.gradeItem.category.categoryName;
                row.appendChild(categoryCell);
                lastCategoryId = record.gradeItem.category.id;
            }

            var itemCell = document.createElement("td");
            itemCell.textContent = record.gradeItem.item;
            row.appendChild(itemCell);

            var weightCell = document.createElement("td");
            weightCell.textContent = record.gradeItem.weight + "%";
            row.appendChild(weightCell);

            var gradeCell = document.createElement("td");
            gradeCell.textContent = record.grade;
            row.appendChild(gradeCell);

            tableBody.appendChild(row);
        });
    }
</script>
</body>
</html>
