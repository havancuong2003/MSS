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
    <title>Title</title>
</head>
<body>
<div>
    <h1>Semester List</h1>
    <ul>
        <c:forEach items="${requestScope.semester}" var="s">
            <li>
                <a href="javascript:setSemesterId(${s.id})">${s.detail}</a>
            </li>
        </c:forEach>
        <input type="hidden" id="semesterId" name="semesterId" value="">
    </ul>
    <h2>Group List</h2>
    <div id="groupsList">
    </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                    list.innerHTML += '<li><a href="javascript:setGroupId(' + group.id + ')" >' + group.course.code + ' - ' + group.course.detail + ' - ' + group.name + '</a></li>';
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
