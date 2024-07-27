<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 7/8/2024
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; flex-direction: column; height: 100vh; }
        header { display: flex; justify-content: space-between; align-items: center; padding: 10px 20px; background-color: #f8f8f8; border-bottom: 1px solid #e7e7e7; width: 100%; box-sizing: border-box; }
        header img { height: 40px; width: 40px; }
        header span { font-size: 24px; font-weight: bold; }
        .profile-container { position: relative; display: inline-block; }
        .profile-img { width: 40px; height: 40px; border-radius: 50%; cursor: pointer; }
        .profile-dropdown { display: none; position: absolute; right: 0; top: 50px; background-color: #ffffff; box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2); padding: 20px; z-index: 1; width: 160px; border-radius: 8px; }
        .profile-info { display: flex; align-items: center; margin-bottom: 20px; }
        .profile-info img { width: 40px; height: 40px; border-radius: 50%; margin-right: 10px; }
        .profile-info div { display: flex; flex-direction: column; }
        .profile-info span { font-size: 16px; }
        .profile-info span.role { font-size: 14px; color: #888; }
        .profile-actions { display: flex; flex-direction: column; gap: 10px; }
        .profile-actions a { text-decoration: none; color: rgb(105, 122, 141); font-size: 14px; display: flex; align-items: center; gap: 10px; transition: color 0.3s; }
        .profile-actions a:hover { color: #0056b3; }
        .main-container { display: flex; flex: 1; height: calc(100vh - 71px); }
        .sidebar { width: 250px; background-color: #333; color: white; display: flex; flex-direction: column; padding-top: 20px; box-sizing: border-box; }
        .sidebar a { padding: 15px 20px; text-decoration: none; color: white; display: block; transition: background 0.3s; }
        .sidebar a:hover { background-color: #575757; }
        .sidebar .submenu a { padding-left: 40px; font-size: 14px; }
        .content { flex-grow: 1; padding: 20px; background-color: #f1f1f1; overflow-y: auto; }
        .sp { font-family: "Poppins", sans-serif; font-size: 28px; font-weight: 600; background: linear-gradient(90deg, #ff8a00, #e52e71); -webkit-background-clip: text; -webkit-text-fill-color: transparent; display: inline-block; padding-left: 10px; }
        .form-group.required .control-label:after { content: " *"; color: red; }
        .form-group .invalid-feedback { display: block; }
    </style>
    <script>
        function toggleProfileDropdown() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        }

        function logout() {
            // Add your logout logic here
            //  alert('Logged out');
        }

        function toggleSubMenu(menuId) {
            var submenu = document.getElementById(menuId);
            submenu.style.display = submenu.style.display === "block" ? "none" : "block";
        }
    </script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<div class="main-container">

    <div class="content">
        <!-- Nội dung dashboard -->

        <div class="col-lg-10">
            <div class="header">
                <div>
                    <button class="btn btn-primary" style="margin-bottom: 5px">
                        <a href="addSemester" style="text-decoration: none; color: white">New Semester
                            <i class="fas fa-calendar-plus"></i></a>
                    </button>
                </div>
                <div>
                    <form action="viewupdatesemester" method="get" style="margin-bottom: 30px">
                        <input name="searchName" class="searchName" type="text" placeholder="Search semester..." value="${searchName}" />
                        <button>Search</button>
                    </form>
                </div>
            </div>
            <table id="semesterTable" class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                <tr>
                    <th>Detail</th>
                    <th>Start Date</th>
                    <th>End Date</th>
<%--                    <th>Is Create</th>--%>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${semesters == null || semesters.size() == 0}">
                        <tr>
                            <td colspan="6" style="color: red; text-align: center;">No Data</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="semester" items="${semesters}">
                            <tr>
                                <td>${semester.getDetail()}</td>
                                <td>${semester.getStart()}</td>
                                <td>${semester.getEnd()}</td>
<%--                                <td>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${semester.getIsCreate() == 1}">Yes</c:when>--%>
<%--                                        <c:otherwise>No</c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                </td>--%>
                                <td><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#popup-updateStatus-${semester.getId()}">Edit</button></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>


<c:forEach var="semester" items="${semesters}">
    <!-- Modal for updating semester -->
    <div class="modal fade" id="popup-updateStatus-${semester.getId()}" tabindex="-1" aria-labelledby="modalLabel-${semester.id}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel-${semester.id}">Update Semester</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="viewupdatesemester" method="post">
                        <input type="hidden" name="id" value="${semester.id}" />
                        <div class="mb-3">
                            <label for="detail-${semester.id}" class="form-label">Detail</label>
                            <input type="text" class="form-control" id="detail-${semester.id}" name="detail" value="${semester.detail}" required />
                        </div>
                        <div class="mb-3">
                            <label for="startDate-${semester.id}" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="startDate-${semester.id}" name="startDate" value="${semester.start}" required />
                        </div>
                        <div class="mb-3">
                            <label for="endDate-${semester.id}" class="form-label">End Date</label>
                            <input type="date" class="form-control" id="endDate-${semester.id}" name="endDate" value="${semester.end}" required />
                        </div>
<%--                        <div class="mb-3">--%>
<%--                            <label for="isCreate-${semester.id}" class="form-label">Is Create</label>--%>
<%--                            <select class="form-select" id="isCreate-${semester.id}" name="isCreate">--%>
<%--                                <option value="1" ${semester.isCreate == 1 ? 'selected' : ''}>Yes</option>--%>
<%--                                <option value="0" ${semester.isCreate == 0 ? 'selected' : ''}>No</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
                        <button type="submit" class="btn btn-primary">Update</button>
                        <a href="deletesemester?semesterId=${semester.id}" class="btn btn-primary">Delete</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:forEach>


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


<!-- Bootstrap js -->
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
<script src="templates/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-Vo0ewNxsZn2Zr2sfotIsOzKQC4fTJPfdHCw2t1jPj2QgW9FpHkAPc6k7cWz1V6k4" crossorigin="anonymous"></script>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>
