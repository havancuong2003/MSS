<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/10/2024
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body>
<style>
    /* CSS */
    .register-screen {
        max-width: 800px;
        margin: 40px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .register-screen h1 {
        margin-top: 0;
    }

    .register-screen h2 {
        margin-bottom: 10px;
    }

    .register-screen form {
        margin-top: 20px;
    }

    .register-screen ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .register-screen li {
        margin-bottom: 10px;
    }

    .register-screen input[type="search"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
    }

    .register-screen input[type="checkbox"] {
        margin-right: 10px;
    }

    .register-screen button[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .register-screen button[type="submit"]:hover {
        background-color: #3e8e41;
    }

    span {
        margin-left: 10px;
    }
</style>
<div class="register-screen">
    <h1>Đăng ký môn học</h1>

    <!-- Form for regular course registration -->
    <form id="regular-courses-form" action="register_courses_regular.php" method="post">
        <h2>Đăng ký học</h2>
        <input type="search" name="search" placeholder="Tìm kiếm môn học">
        <ul id="regular-courses-list">
            <!-- Regular courses will be dynamically inserted here -->
        </ul>
        <button type="submit">Đăng ký</button>
    </form>

    <!-- Form for retaking/improving courses -->
    <form id="improve-courses-form" action="register_courses_improve.php" method="post">
        <h2>Đăng ký học lại / cải thiện</h2>
        <input type="search" name="search" placeholder="Tìm kiếm môn học">
        <ul id="improve-courses-list">
            <!-- Retake/improvement courses will be dynamically inserted here -->
        </ul>
        <button type="submit">Đăng ký học lại / cải thiện</button>
    </form>
</div>

<script>
    // Sample data for courses
    const courses = [
        { id: 1, name: 'Môn 1', type: 'regular' },
        { id: 2, name: 'Môn 2', type: 'not_allowed', reason: 'trượt 1 nên ko đc học 2' },
        { id: 3, name: 'Môn 3 (Cải thiện điểm)', type: 'improve' },
        { id: 4, name: 'Môn 4 (Học lại)', type: 'retake' },
        { id: 5, name: 'Môn 5', type: 'regular' },
        { id: 6, name: 'Môn 6', type: 'not_allowed' },
        { id: 7, name: 'Môn 7', type: 'regular' },
    ];

    // Function to categorize and display courses
    function displayCourses() {
        const regularCoursesList = document.getElementById('regular-courses-list');
        const improveCoursesList = document.getElementById('improve-courses-list');

        courses.forEach(course => {
            const li = document.createElement('li');
            if (course.type === 'regular') {
                li.innerHTML = `<input type="checkbox" name="courses[]" value="\${course.id}">\${course.name}`;
                regularCoursesList.appendChild(li);
            } else if (course.type === 'improve') {
                li.innerHTML = `<input type="checkbox" name="courses[]" value="\${course.id}">\${course.name}`;
                improveCoursesList.appendChild(li);
            } else if (course.type === 'retake') {
                li.innerHTML = `<input type="checkbox" name="courses[]" value="\${course.id}">\${course.name}`;
                improveCoursesList.appendChild(li);
            } else if (course.type === 'not_allowed') {
                li.innerHTML = `<strike>\${course.name}</strike>\${course.reason ? `<span>\${course.reason}</span>` : ''}`;
                if (course.reason) {
                    improveCoursesList.appendChild(li);
                } else {
                    regularCoursesList.appendChild(li);
                }
            }
        });
    }

    // Initialize display
    displayCourses();
</script>

</body>
</html>

