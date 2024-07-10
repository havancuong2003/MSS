<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 7/4/2024
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
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
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
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
        .main-container {
            display: flex;
            flex: 1;
            height: calc(100vh - 71px);
        }
        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            box-sizing: border-box;
        }
        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            display: block;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .sidebar .submenu a {
            padding-left: 40px;
            font-size: 14px;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f1f1f1;
            overflow-y: auto;
        }
        .sp {
            font-family: "Poppins", sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
        }
        .form-group.required .control-label:after {
            content: " *";
            color: red;
        }
        .form-group .invalid-feedback {
            display: block;
        }
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display =
                dropdown.style.display === "block" ? "none" : "block";
        }

        function logout() {
            // Add your logout logic here
            //  alert('Logged out');
        }

        function toggleSubMenu(menuId) {
            var submenu = document.getElementById(menuId);
            submenu.style.display =
                submenu.style.display === "block" ? "none" : "block";
        }
    </script>
</head>
<body>
<header>
    <div>
        <img src="logo.png" alt="" />
        <span class="sp">MyStudySpace</span>
    </div>
    <div class="profile-container">
        <img
                src="data:image/jpeg;base64,${photoBase64}"
                alt=""
                class="profile-img"
                onclick="toggleProfileDropdown()"
        />
        <div id="profileDropdown" class="profile-dropdown">
            <div class="profile-info">
                <img
                        src="data:image/jpeg;base64,${photoBase64}"
                        alt=""
                />
                <div>
                            <span id="profileFullName"
                            >${requestScope.account.fullname}</span
                            >
                    <span id="profileRole" class="role"
                    >${requestScope.roleName}</span
                    >
                </div>
            </div>
            <div class="profile-actions">
                <a href="<%=request.getContextPath()%>/load-profile"
                ><i class="fas fa-user"></i> My Profile</a
                >
                <a href="settings.jsp"
                ><i class="fas fa-cog"></i> Settings</a
                >
                <a href="${pageContext.request.contextPath}/logout"
                ><i class="fas fa-sign-out-alt"></i> Logout</a
                >
            </div>
        </div>
    </div>
</header>
<div class="main-container">
    <div class="sidebar">
        <a href="#" onclick="toggleSubMenu('homeSubMenu')"
        ><i class="fas fa-home"></i> Home</a
        >
        <a href="#" onclick="toggleSubMenu('userManagementSubMenu')"
        ><i class="fas fa-users"></i> User Management</a
        >
        <div
                id="userManagementSubMenu"
                class="submenu"
                style="display: none"
        >
            <a href="<%=request.getContextPath()%>/add-New-Account"
            ><i class="fas fa-user-plus"></i> Add New Account</a
            >
            <a href="<%=request.getContextPath()%>/list-account"
            ><i class="fas fa-list"></i> Account List</a
            >
        </div>
        <a href="#" onclick="toggleSubMenu('courseManagementSubMenu')"
        ><i class="fas fa-book"></i> Course Management</a
        >
        <div
                id="courseManagementSubMenu"
                class="submenu"
                style="display: none"
        >
            <a href="<%=request.getContextPath()%>/addCourse"
            ><i class="fas fa-plus"></i> Add New Course</a
            >
            <a href="<%=request.getContextPath()%>/listCourse"
            ><i class="fas fa-list"></i> Course List</a
            >
        </div>
        <a href="#" onclick="toggleSubMenu('timePeriodsSubMenu')"
        ><i class="fas fa-clock"></i> Time Periods</a
        >
        <div
                id="timePeriodsSubMenu"
                class="submenu"
                style="display: none"
        >
            <a href="timeChangeClass"
            ><i class="fas fa-exchange-alt"></i> Time Change
                Class</a
            >
            <a href="registerTime"
            ><i class="fas fa-calendar-check"></i> Time Register
                Course</a
            >
        </div>
        <a href="#" onclick="toggleSubMenu('scheduleSubMenu')"
        ><i class="fas fa-calendar-alt"></i> Schedule</a
        >
        <div id="scheduleSubMenu" class="submenu" style="display: none">
            <a href="createGroup"
            ><i class="fas fa-users-cog"></i> Create Group</a
            >
            <a href="createSchedule"
            ><i class="fas fa-calendar-plus"></i> Create Schedule</a
            >
        </div>
    </div>
    <div class="content">
        <!-- Nội dung dashboard -->
        <div
                class="row justify-content-center mt-5"
                style="margin-bottom: 30px"
        >
            <div>
                <button class="btn btn-primary" style="margin-bottom: 5px">
                    <a href="viewupdatesemester" style="text-decoration: none; color: white">All Semester
                        <i class="fas fa-calendar-plus"></i></a>
                </button>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2>Add New Semester</h2>
                    </div>
                    <div class="card-body">
                        <form action="addSemester" method="post">
                            <div
                                    class="form-group required"
                                    style="margin-bottom: 15px"
                            >
                                <label
                                        for="firstName"
                                        class="control-label"
                                >Detail</label>
<%--                                <select id="detail" name="detail">--%>
<%--                                    <option value="SP">SP</option>--%>
<%--                                    <option value="SU">SU</option>--%>
<%--                                    <option value="FA">FA</option>--%>
<%--                                </select>--%>
                                <input
                                        type="text"
                                        class="form-control"
                                        id="firstName"
                                        name="detail"
                                        required
                                        value="${detail}"
                                />
                            </div>
                            <div
                                    class="form-group required"
                                    style="margin-bottom: 15px"
                            >
                                <label for="dob" class="control-label"
                                >Start Date</label
                                >
                                <input
                                        type="date"
                                        class="form-control"
                                        id="dob"
                                        name="start"
                                        value="${start}"
                                        placeholder="dd-mm-yyyy"
                                        required
                                />
                            </div>
                            <div
                                    class="form-group required"
                                    style="margin-bottom: 15px"
                            >
                                <label for="dob" class="control-label"
                                >Start BL5</label
                                >
                                <input
                                        type="date"
                                        class="form-control"
                                        id="dob"
                                        name="startBL5"
                                        value="${startBL5}"
                                        placeholder="dd-mm-yyyy"
                                        required
                                />
                            </div>
                            <div
                                    class="form-group required"
                                    style="margin-bottom: 15px"
                            >
                                <label for="dob" class="control-label"
                                >End Date</label
                                >
                                <input
                                        type="date"
                                        class="form-control"
                                        id="dob"
                                        name="end"
                                        value="${end}"
                                        placeholder="dd-mm-yyyy"
                                        required
                                />
                            </div>
                            <div
                                    class="form-group"
                                    style="margin-bottom: 15px"
                            >
                                <label>Is Create</label>
                                <div>
                                    <div
                                            class="btn-group btn-group-toggle"
                                            data-toggle="buttons"
                                    >
                                        <label
                                                class="btn btn-outline-primary"
                                        >
                                            <input
                                                    type="radio"
                                                    name="isCreate"
                                                    id="male"
                                                    value="1"
                                                    autocomplete="off"
                                                    required
                                            />
                                            Yes
                                        </label>
                                        <label
                                                class="btn btn-outline-primary"
                                        >
                                            <input
                                                    type="radio"
                                                    name="isCreate"
                                                    id="female"
                                                    value="1"
                                                    autocomplete="off"
                                                    required
                                            />
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <button
                                        type="button"
                                        class="btn btn-secondary"
                                >
                                    Cancel
                                </button>
                                <button
                                        type="reset"
                                        class="btn btn-primary"
                                >
                                    Reset
                                </button>
                                <button
                                        type="submit"
                                        class="btn btn-success"
                                >
                                    Submit
                                </button>
<%--                                <h3 style="color: red">${msg}</h3>--%>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Alert</h4>
            </div>
            <div class="modal-body">
                <p id="modalMessage"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function() {
        // Get the msg attribute from the JSP
        var msg = "<%= request.getAttribute("msg") %>";

        // Check if msg is not null or empty
        <% if (request.getAttribute("msg") != null && !((String) request.getAttribute("msg")).isEmpty()) { %>
        document.getElementById('modalMessage').textContent = msg;
        // Show modal
        $('#myModal').modal('show');
        <% } %>

        $('.modal-footer button[data-dismiss="modal"]').click(function() {
            $('#myModal').modal('hide'); // Tắt modal
        });
    };
</script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-Vo0ewNxsZn2Zr2sfotIsOzKQC4fTJPfdHCw2t1jPj2QgW9FpHkAPc6k7cWz1V6k4" crossorigin="anonymous"></script>
</body>
</html>

