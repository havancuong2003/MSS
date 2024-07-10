<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/8/2024
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Attendance Management System</h1>
<div class="container">
    <div class="list-container">
        <h2>Semester List</h2>
        <ul id="semesterList" class="list-group">
            <c:forEach items="${requestScope.semester}" var="s">
                <li>
                    <a href="javascript:setSemesterId(${s.id})">${s.detail}</a>
                </li>
            </c:forEach>
        </ul>
        <input type="hidden" id="semesterId" name="semesterId" value="">
    </div>
    <div class="list-container group-container">
        <h2>Group List</h2>
        <ul id="groupsList" class="list-group"></ul>
        <input type="hidden" id="gid" name="gid" value="">
    </div>
    <div class="report-container">
        <h2>Attendance Report</h2>
        <table id="attendanceTable">

        </table>
        <div class="legend">
            <p><span class="not-yet">N</span> - Not Yet</p>
            <p><span class="absent">A</span> - Absent</p>
            <p><span class="present">P</span> - Present</p>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function setSemesterId(id) {
        document.getElementById("semesterId").value = id;
        getGroup();
    }

    function setGroupId(id) {
        document.getElementById("gid").value = id;
        document.querySelector(".report-container").style.display = 'block';
        getAttendances();
    }

    function getGroup() {
        const ses = document.getElementById("semesterId").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/attendancereport",
            type: "POST",
            dataType: "JSON",
            data: {sesid: ses},
            success: function (data) {
                const groups = data.groups;
                const list = document.getElementById("groupsList");
                list.innerHTML = "";
                groups.forEach(group => {
                    list.innerHTML += '<li><a href="javascript:setGroupId(' + group.id + ')" >' + group.course.code + ' - ' + group.course.detail + ' - ' + group.name + '</a></li>';
                });
            }
        });
    }

    function getAttendances() {
        const ses = document.getElementById("semesterId").value;
        const group = document.getElementById("gid").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/attendancereport",
            type: "POST",
            dataType: "JSON",
            data: {sesid: ses, gid: group},
            success: function (data) {
                const students = data.students;
                console.log(students);
            }
        });
    }
</script>
</body>
</html>
