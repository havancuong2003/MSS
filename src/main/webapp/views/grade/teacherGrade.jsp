<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/3/2024
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grade Table</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1, h2, h3 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        input[type="text"], input[type="hidden"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #007bff;
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background: #fff;
            margin: 5px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-left: 4px solid #007bff;
            transition: background 0.3s;
        }

        ul li a {
            text-decoration: none;
            color: #007bff;
        }

        ul li:hover {
            background: #f0f0f5;
        }

        ul li a:hover {
            text-decoration: underline;
        }

        #studentGrade, #teacherGrade {
            background: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        #gradesTableContainer {
            overflow-x: auto;
        }

        input[type="button"], button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="button"]:hover, button:hover {
            background-color: #0056b3;
        }

        #teacherGrade table, #teacherGrade th, #teacherGrade td {
            text-align: center;
            vertical-align: middle;
        }

        #teacherGrade input[type="text"] {
            text-align: center;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>Semester List</h2>
    <ul>
        <c:forEach items="${requestScope.semester}" var="s">
            <li>
                <a href="javascript:setSemesterId(${s.id})">${s.detail}</a>
            </li>
        </c:forEach>
        <input type="hidden" id="semesterId" name="semesterId" value="">
    </ul>
    <h3>Group List</h3>
    <div id="groupsList">
        <!-- Groups will be populated here -->
    </div>
    <input type="hidden" id="gid" name="gid" value="">
    <div id="teacherGrade">

        <form id="gradesForm">
            <div id="gradesTableContainer">
                <table id="gradesTable">
                    <!-- Grades table will be populated here -->
                </table>
            </div>
            <button type="button" onclick="saveGrade()">Save</button>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function setSemesterId(id) {
        document.getElementById("semesterId").value = id;
        getGroup();
    }

    function setGroupId(id) {
        document.getElementById("gid").value = id;
        getGrade();
    }

    function getGroup() {
        var ses = document.getElementById("semesterId").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadTeacherGrade",
            type: "GET",
            dataType: "JSON",
            data: {
                sesid: ses
            },
            success: function (data) {
                var groups = data.groups;
                var list = document.getElementById("groupsList");
                list.innerHTML = "";
                groups.forEach(function (group) {
                    list.innerHTML += '<li><a href="javascript:setGroupId(' + group.id + ')">' + group.course.code + ' - ' + group.course.detail + ' - ' + group.name + '</a></li>';
                });
            }
        });
    }

    function getGrade() {
        var ses = document.getElementById("semesterId").value;
        var gid = document.getElementById("gid").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadTeacherGrade",
            type: "GET",
            dataType: "JSON",
            data: {
                sesid: ses,
                gid: gid
            },
            success: function (data) {
                var marks = data.marks;
                var locked = data.locked;
                generateTable(marks, locked);
            }
        });
    }

    function generateTable(marks, locked) {
        // Group grade items by category
        var categories = {};
        var gid = document.getElementById("gid").value;
        marks.forEach(function (mark) {
            var category = mark.gradeItem.category.categoryName;
            if (!categories[category]) {
                categories[category] = [];
            }
            if (!categories[category].some(item => item.item === mark.gradeItem.item)) {
                categories[category].push({
                    item: mark.gradeItem.item,
                    weight: mark.gradeItem.weight
                });
            }
        });

        // Create table header
        var tableHeader = '<tr><th>Student ID</th><th>Student Name</th>';
        for (var category in categories) {
            tableHeader += '<th colspan="' + categories[category].length + '">' + category + '</th>';
        }
        tableHeader += '</tr><tr><th></th><th></th>';
        for (var category in categories) {
            categories[category].forEach(function (gradeItem) {
                tableHeader += '<th>' + gradeItem.item + ' (' + gradeItem.weight + '%)</th>';
            });
        }
        tableHeader += '</tr>';

        // Create table body
        var tableBody = '';
        var students = {};
        marks.forEach(function (mark) {
            if (!students[mark.student.id]) {
                students[mark.student.id] = {
                    fullname: mark.student.account.fullname,
                    grades: {}
                };
            }
            students[mark.student.id].grades[mark.gradeItem.item] = mark.grade;
        });

        for (var studentId in students) {
            tableBody += '<tr><td>' + studentId + '</td><td>' + students[studentId].fullname + '</td>';
            var hiddenInputValues = [];
            for (var category in categories) {
                categories[category].forEach(function (gradeItem) {
                    var grade = students[studentId].grades[gradeItem.item];
                    grade = (grade === 0 || grade) ? grade : '';
                    if (locked) {
                        tableBody += '<td><input type="text" name="marks-' + studentId + '-' + gradeItem.item + '-' + gid + '" value="' + grade + '" disabled></td>';
                    } else {
                        tableBody += '<td><input type="text" name="marks-' + studentId + '-' + gradeItem.item + '-' + gid + '" value="' + grade + '"></td>';
                    }
                    hiddenInputValues.push(grade);
                });
            }
            tableBody += '</tr>';
        }

        // Insert table header and body into the table
        document.getElementById('gradesTable').innerHTML = '<thead>' + tableHeader + '</thead><tbody>' + tableBody + '</tbody>';
    }

    function updateHiddenInput(studentId) {
        var inputs = document.querySelectorAll('input[name="marks' + studentId + '[]"]');
        var hiddenInput = document.getElementById('hidden' + studentId);
        var gradesArray = [];
        inputs.forEach(function (input) {
            gradesArray.push(input.value);
        });
        hiddenInput.value = gradesArray.join(',');
    }

    function saveGrade() {
        var isValid = true;

        // Chỉ kiểm tra các ô input có giá trị nhập vào
        $('#gradesForm input[type="text"]').each(function () {
            var value = $(this).val();
            if (value !== "") { // Kiểm tra nếu ô input không trống
                if (!$.isNumeric(value) || value < 0 || value > 10) {
                    isValid = false;
                    alert("Invalid input: " + value + ". Please enter a number between 0 and 10.");
                    return false;
                }
            }
        });

        if (isValid) {
            var formData = $('#gradesForm').serialize();
            console.log(formData);
            $.ajax({
                url: "${pageContext.request.contextPath}/teacher/takegrade",
                type: "POST",
                data: formData,
                dataType: "json", // Đảm bảo rằng phản hồi được xử lý như JSON
                success: function (response) {
                    if (response.success) {
                        alert("Grades saved successfully!");
                    } else {
                        alert("Error: " + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    alert("An error occurred while saving grades: " + xhr.responseText);
                }
            });
        }
    }

</script>
</body>
</html>
