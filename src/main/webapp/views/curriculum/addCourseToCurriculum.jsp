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
    <form method="post" action="/addCourseToCurriculum">
        <p>Course: <input oninput="searchCourse()" type="text" name="codeCourse"/></p>
    </form>
    <input type="hidden" id="mid" value="${requestScope.mid}"/>
    <p>Course table:</p>
    <div>
        <table >
            <thead>
            <tr>
                <th>Code</th>
                <th>Detail</th>
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
                <td>Prequisite Course</td>
                <td>TermNo</td>
                <td></td>
            </tr>
            </thead>
            <tbody id="CurTableBodyData">

            </tbody>
        </table>
    </div>
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function searchCourse() {
        let mid = document.getElementById("mid").value;
        let codeCourse = document.getElementsByName("codeCourse")[0].value;
        console.log(mid);
        console.log(codeCourse);
        $.ajax({
            url: "${pageContext.request.contextPath}/loadCourse",
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
                listCourse.forEach((c)=>{
                    htmlValue +="<tr><td>"+c.code+"</td><td>"+c.detail+"</td><td><button onclick='addToCur("+c.code+","+c.id+")'>Add</button></td></tr>"
                })
                bodyTable.html(htmlValue);
        }
        });
    }
</script>
<script>
    function addToCur(code,id) {
        var tr = document.createElement("tr");
        var td1 = document.createElement("td");
        td1.innerText = code;
        tr.appendChild(td1);
        var td2 = document.createElement("td");
        var inputDes = document.createElement("input");
        inputDes.type = "text";
        inputDes.placeholder="Description...";
        inputDes.name = "description"+ code;
        td2.appendChild(inputDes);
        tr.appendChild(td2);
        var td3 = document.createElement("td");
        var inputPre = document.createElement("input");
        inputPre.type = "text";
        inputPre.placeholder="Course...";
        inputPre.name = "preCourse"+ code;
        td3.appendChild(inputPre);
        tr.appendChild(td3);
        var td4 = document.createElement("td");
        var inputTerm = document.createElement("input");
        inputTerm.type = "text";
        inputTerm.placeholder="TermNo...";
        inputTerm.name = "termNo"+ code;
        td4.appendChild(inputTerm);
        tr.appendChild(td4);
        var td5 = document.createElement("td");
        var button = document.createElement("button");
        button.type = "button";
        document.getElementById("CurTableBodyData").appendChild(tr);
    }
</script>
</body>
</html>
