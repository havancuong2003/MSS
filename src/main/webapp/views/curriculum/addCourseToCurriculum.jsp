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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form p {
            margin-bottom: 20px;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            margin-top: 10px;
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #3e8e41;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        #CourseTableBodyData, #CurTableBodyData {
            margin-bottom: 20px;
        }
        .sp{
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #f8f8f8;
            border-bottom: 1px solid #e7e7e7;
            width: 100%;
            box-sizing: border-box;
        }
        header img {
            height: 40px;
            width: 40px;
        }
        header span {
            font-size: 24px;
            font-weight: bold;
        }
        .profile-container {
            position: relative;
            display: inline-block;
        }
        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }
        .profile-dropdown {
            display: none;
            position: absolute;
            right: 0;
            top: 50px;
            background-color: #ffffff;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            padding: 20px;
            z-index: 1;
            width: 160px;
            border-radius: 8px;
        }
        .profile-info {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .profile-info div {
            display: flex;
            flex-direction: column;
        }
        .profile-info span {
            font-size: 16px;
        }
        .profile-info span.role {
            font-size: 14px;
            color: #888;
        }
        .profile-actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .profile-actions a {
            text-decoration: none;
            color: rgb(105, 122, 141);
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: color 0.3s;
        }
        .profile-actions a:hover {
            color: #0056b3;
        }
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }

        // function logout() {
        //     // Add your logout logic here
        //     alert('Logged out');
        // }

        function toggleSubMenu(menuId) {
            var submenu = document.getElementById(menuId);
            submenu.style.display = (submenu.style.display === "block") ? "none" : "block";
        }
    </script>
</head>
<body>
<header>
    <div>
        <img src="logo.png" alt="">
        <span class="sp">MyStudySpace</span>
    </div>
    <div class="profile-container">
        <img src="data:image/jpeg;base64,${photoBase64}" alt="" class="profile-img" onclick="toggleProfileDropdown()">
        <div id="profileDropdown" class="profile-dropdown">
            <div class="profile-info">
                <img src="data:image/jpeg;base64,${photoBase64}" alt="">
                <div>
                    <span id="profileFullName">${requestScope.account.fullname}</span>
                    <span id="profileRole" class="role">${requestScope.roleName}</span>
                </div>
            </div>
            <div class="profile-actions">
                <a href="<%=request.getContextPath()%>/load-profile"><i class="fas fa-user"></i> My Profile</a>
                <a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </div>
</header>

<form method="get" action="/MyStudySpace_war_exploded/admin/addCourseToCurriculum" style="margin-top: 10px">
    <p>Major:
        <select name="major" id="major">
            <c:forEach items="${requestScope.majors}" var="major">
                <option
                        <c:if test="${requestScope.mid == major.id}">
                            selected="selected"
                        </c:if>
                        value="${major.id}">${major.code} - ${major.detail}</option>
            </c:forEach>
        </select>
    </p>
    <button type="submit">Select</button>
    <p>${requestScope.ms}</p>
</form>

<c:if test="${requestScope.mid != null}">
    <form method="post" action="addCourseToCurriculum" style="margin-top: 10px">
        <input type="hidden" id="mid" name="mid" value="${requestScope.mid}"/>
        <p>Course: <input oninput="searchCourse()" type="text" name="codeCourse"/></p>

        <div>
            <p>Course table:</p>
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
            <p>Major Curriculum:</p>
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
