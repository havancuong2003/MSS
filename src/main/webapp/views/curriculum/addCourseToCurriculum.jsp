<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/5/2024
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <img src="logo.png" alt="MyStudySpace Logo">
    <span>MyStudySpace</span>
</header>
<form method="get" action="/MyStudySpace_war_exploded/addCourseToCurriculum">
    <p>Major: <select name="major" id="major">
        <c:forEach items="${requestScope.majors}" var="major">
            <option
                    <c:if test="${requestScope.mid == major.id}">
                        selected="selected"
                    </c:if>
                    value="${major.id}">${major.code} - ${major.detail}</option>
        </c:forEach>
    </select></p>
    <button type="submit">Select</button>
    <p>${requestScope.ms}</p>
</form>
<c:if test="${requestScope.mid != null}">
    <form method="post" action="addCourseToCurriculum">
        <input type="hidden" id="mid" name="mid" value="${requestScope.mid}"/>
        <p>Course: <input oninput="searchCourse()" type="text" name="codeCourse"/></p>

        <p>Course table:</p>
        <div>
            <table>
                <thead>
                <tr>
                    <th>Code</th>
                    <th>Detail</th>
                    <th>Prequisite Course</th>
                    <th></th>
                </tr>
                </thead>
                <tbody id="CourseTableBodyData">
                </tbody>
            </table>
        </div>
        <div>
            <p>Major Curriculum</p>
            <table>
                <thead>
                <tr>
                    <td>Code</td>
                    <td>Description</td>
                    <td>TermNo</td>
                    <td></td>
                </tr>
                </thead>
                <tbody id="CurTableBodyData">

                </tbody>
            </table>
        </div>
        <input type="hidden" id="addedCourseIds" name="addedCourseIds" value=""/>
        <button type="submit">Save</button> ${requestScope.msSave}
    </form>
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function searchCourse() {
        let mid = document.getElementById("mid").value;
        let codeCourse = document.getElementsByName("codeCourse")[0].value;
        console.log(mid);
        console.log(codeCourse);
        $.ajax({
            url: "${pageContext.request.contextPath}/loadCourseCur",
            type: "GET",
            dataType: "JSON",
            data: {
                mid: mid,
                codeCourse: codeCourse
            },
            success: function (data) {
                let listCourse = data
                let bodyTable = $("#CourseTableBodyData")
                bodyTable.html("");
                let htmlValue = ''
                listCourse.forEach((c) => {
                    htmlValue += "<tr><td>" + c.code + "</td><td>" + c.detail + "</td><td>" + c.preCoursesString + "</td><td><button type='button' onclick='addToCur(\"" + c.id + "\", \"" + c.code + "\")'>Add</button></td></tr>"
                })
                bodyTable.html(htmlValue);
            }
        });
    }
</script>
<script>
    function addToCur(id, code) {
        // Check if the course code already exists in the table
        let exists = false;
        $("#CurTableBodyData tr").each(function () {
            if ($(this).find('td:first').text() === code) {
                exists = true;
                return false; // Exit the each loop
            }
        });

        if (exists) {
            alert("Course already added to the curriculum.");
            return;
        }

        // Add course ID to hidden input
        let addedCourseIds = $("#addedCourseIds").val();
        if (addedCourseIds) {
            addedCourseIds += "," + id;
        } else {
            addedCourseIds = id;
        }
        $("#addedCourseIds").val(addedCourseIds);

        // Add row to table
        let bodyTable = $("#CurTableBodyData");
        let htmlValue = "<tr data-id='" + id + "'>" +
            "<td>" + code + "</td>" +
            "<td><input type='text' name='description"+id+"' required/></td>" +
            "<td><input type='number' name='termNo"+id+"' min='1' max='9' required/></td>" +
            "<td><button type='button' onclick='removeRow(this)'>Remove</button></td>" +
            "</tr>";
        bodyTable.append(htmlValue);
    }

    function removeRow(button) {
        let row = $(button).closest('tr');
        let id = row.data('id');

        // Remove course ID from hidden input
        let addedCourseIds = $("#addedCourseIds").val().split(",");
        addedCourseIds = addedCourseIds.filter(courseId => courseId !== id.toString());
        $("#addedCourseIds").val(addedCourseIds.join(","));

        // Remove row from table
        row.remove();
    }
</script>
</body>
</html>
