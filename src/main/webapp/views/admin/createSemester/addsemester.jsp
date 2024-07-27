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
<jsp:include page="../../common/header.jsp"/>

<div class="main-container">

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
<%--                                <label>Is Create</label>--%>
<%--                                <div>--%>
<%--                                    <div--%>
<%--                                            class="btn-group btn-group-toggle"--%>
<%--                                            data-toggle="buttons"--%>
<%--                                    >--%>
<%--                                        <label--%>
<%--                                                class="btn btn-outline-primary"--%>
<%--                                        >--%>
<%--                                            <input--%>
<%--                                                    type="radio"--%>
<%--                                                    name="isCreate"--%>
<%--                                                    id="male"--%>
<%--                                                    value="1"--%>
<%--                                                    autocomplete="off"--%>
<%--                                                    required--%>
<%--                                            />--%>
<%--                                            Yes--%>
<%--                                        </label>--%>
<%--                                        <label--%>
<%--                                                class="btn btn-outline-primary"--%>
<%--                                        >--%>
<%--                                            <input--%>
<%--                                                    type="radio"--%>
<%--                                                    name="isCreate"--%>
<%--                                                    id="female"--%>
<%--                                                    value="1"--%>
<%--                                                    autocomplete="off"--%>
<%--                                                    required--%>
<%--                                            />--%>
<%--                                            No--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                            <div class="form-group mt-3">
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

<jsp:include page="../../common/footer.jsp"/>

</body>
</html>

