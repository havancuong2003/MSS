<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 5/22/2024
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>User List</title>--%>
<%--    <link rel="stylesheet" href="styles.css">--%>
<%--    <style>--%>
<%--        /* styles.css */--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            background-color: #f4f4f4;--%>
<%--        }--%>

<%--        .container {--%>
<%--            width: 80%;--%>
<%--            margin: 0 auto;--%>
<%--            padding: 20px;--%>
<%--            background-color: #fff;--%>
<%--            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>

<%--        h1 {--%>
<%--            text-align: center;--%>
<%--            color: #333;--%>
<%--        }--%>

<%--        .user-table {--%>
<%--            width: 100%;--%>
<%--            border-collapse: collapse;--%>
<%--            margin: 20px 0;--%>
<%--        }--%>

<%--        .user-table th, .user-table td {--%>
<%--            padding: 12px;--%>
<%--            border: 1px solid #ddd;--%>
<%--            text-align: left;--%>
<%--        }--%>

<%--        .user-table th {--%>
<%--            background-color: #f4f4f4;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .user-table tr:nth-child(even) {--%>
<%--            background-color: #f9f9f9;--%>
<%--        }--%>

<%--        .user-table tr:hover {--%>
<%--            background-color: #f1f1f1;--%>
<%--        }--%>

<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>User List</h1>--%>
<%--    <div>--%>
<%--        <form action="list-account"  method="post">--%>
<%--            <input type="text" name="searchName" value="${searchName}" />--%>
<%--            <button>Search</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--    <table class="user-table">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Username</th>--%>
<%--            <th>Password</th>--%>
<%--            <th>Full Name</th>--%>
<%--            <th>Phone</th>--%>
<%--            <th>Email</th>--%>
<%--            <th>Role</th>--%>
<%--            <th>Gender</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:choose>--%>
<%--            <c:when test="${listaccount.size() == 0}">--%>
<%--                <tr>--%>
<%--                    <td colspan="7" style="color: red; text-align: center">No Data</td>--%>
<%--                </tr>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <c:forEach var="user" items="${listaccount}">--%>
<%--                    <tr>--%>
<%--                        <td>${user.username}</td>--%>
<%--                        <td>${user.password}</td>--%>
<%--                        <td>${user.fullname}</td>--%>
<%--                        <td>${user.phone}</td>--%>
<%--                        <td>${user.email}</td>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${user.role_id == 1}">--%>
<%--                                <td>Admin</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${user.role_id == 2}">--%>
<%--                                <td>Staff</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${user.role_id == 3}">--%>
<%--                                <td>Teacher</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${user.role_id == 4}">--%>
<%--                                <td>Student</td>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <td>Not found!</td>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                        <td>${user.gender ? "Male" : "Female"}</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<style>
    .form-container {
        display: flex;
        align-items: center;
    }
    .form-container select, .form-container button {
        margin: 0 5px;
        padding: 5px 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .form-container button {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }
    .form-container button:hover {
        background-color: #45a049;
    }
</style>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>SCN | Admin</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.jpg" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="css/viewaccount.css" />
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-2 side-bar">
            <div class="top-fixed">
                <div class="content">
                    <i class="fas fa-home" style="font-size: 20px"></i
                    ><a href="admin?cp=1">Home</a>
                </div>
            </div>
            <div class="bottom bottom-fixed">
                <div class="img-info">
                    <img src="img/fakeUserImage.jpg" alt="alt" />
                </div>
                <div style="margin: 0px 15px"></div>
                <a href="logout"
                ><i
                        class="fas fa-sign-out-alt"
                        style="font-size: 22px; padding-top: 5px"
                ></i
                ></a>
            </div>
        </div>
        <div class="col-lg-10">
            <div class="header">
                <div>
                    <button
                            class="btn btn-primary"
                            style="margin-bottom: 5px"
                    >
                        <a
                                href="addnewaccount"
                                style="text-decoration: none; color: white"
                        >New User <i class="fas fa-user-friends"></i
                        ></a>
                    </button>
                </div>
                <div>
                    <form action="list-account" method="post">
                        <input
                                name="searchName"
                                type="text"
                                placeholder="Search username or email..."
                                value="${searchName}"
                        />
                        <button>Search</button>
                    </form>
                </div>
            </div>

            <table
                    id="accountTable"
                    class="table align-middle mb-0 bg-white"
            >
                <thead class="bg-light">
                <tr>
                    <th>Account</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Phone</th>
                    <th>Gender</th>
                    <th>Password</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                <c:when test="${listaccount.size() == 0}">
                    <tr>
                        <td colspan="7" style="color: red; text-align: center">
                            No Data
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                <c:forEach var="user" items="${listaccount}">
                <tr>
                    <td>
                        <div class="d-flex align-items-center">

                            <p class="fw-bold mb-1">
                                    ${user.username}
                            </p>
<%--                            <p class="text-muted mb-0">--%>
<%--                                    ${user.email}--%>
<%--                            </p>--%>

                        </div>
                    </td>

                    <c:choose>

                    <c:when test="${user.role_id == 1}">
                    <td>Admin</td>
                    </c:when>
                    <c:when test="${user.role_id == 2}">
                    <td>Staff</td>
                    </c:when>
                    <c:when test="${user.role_id == 3}">
                    <td>Teacher</td>
                    </c:when>
                    <c:when test="${user.role_id == 4}">
                    <td>Student</td>
                    </c:when>
                    <c:otherwise>
                    <td>Not found!</td>
                    </c:otherwise>
                    </c:choose>
<%--                    <td>--%>
<%--                        <form action="list-account" method="post">--%>
<%--                            <input type="hidden" name="aid" value="${user.getId()}">--%>
<%--                            <select name="status">--%>
<%--                                <c:if test="${user.status =='active'}">--%>
<%--                                    <option value="0" selected="">Active</option>--%>
<%--                                    <option value="1">Deactive</option>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${user.status == 'deactive'}">--%>
<%--                                    <option value="0">Active</option>--%>
<%--                                    <option value="1" selected="">Deactive</option>--%>
<%--                                </c:if>--%>
<%--                            </select><button>Save</button>--%>
<%--                        </form>--%>

<%--                    </td>--%>
                    <td>${user.phone}</td>
                    <td>${user.gender ? "Male" : "Female"}</td>
                    <td>${user.password}</td>

                    </c:forEach>
                    </c:otherwise>
                    </c:choose>
                </tbody>

            </table>

        </div>
    </div>
</div>
<!-- Bootstrap js -->
<script src="templates/js/bootstrap.min.js"></script>
<!-- <script>
    function validateSearch() {
        var keyInput = document.getElementsByName("key")[0];
        var key = keyInput.value.trim();
        if (key === "") {
            event.preventDefault();
        }
    }
</script> -->
</body>
</html>

