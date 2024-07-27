<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 7/9/2024
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    .profile-info img { width: 40px; height: 40px; border-radius: 50%; margin-right: 10px; }
    .profile-info div { display: flex; flex-direction: column; }
    .profile-info span { font-size: 16px; }
    .profile-info span.role { font-size: 14px; color: #888; }
    .profile-actions a { text-decoration: none; color: rgb(105, 122, 141); font-size: 14px; display: flex; align-items: center; gap: 10px; transition: color 0.3s; }
    .profile-actions a:hover { color: #0056b3; }
    .main-container { display: flex; flex: 1; height: calc(100vh - 71px); }
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
            <a data-bs-toggle="modal" data-bs-target="#popup-add-slot">New Slot
              <i class="fas fa-calendar-plus"></i></a>
          </button>
        </div>
        <div>
          <form action="viewslot" method="get" style="margin-bottom: 30px">
            <input name="searchName" class="searchName" type="text" placeholder="Search semester..." value="${searchName}" />
            <button>Search</button>
          </form>
        </div>
      </div>
      <table id="semesterTable" class="table align-middle mb-0 bg-white">
        <thead class="bg-light">
        <tr>
          <th>Detail</th>
          <th>Start Time</th>
          <th>End Time</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
          <c:when test="${slots == null || slots.size() == 0}">
            <tr>
              <td colspan="5" style="color: red; text-align: center;">No Data</td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach var="slot" items="${slots}">
              <tr>
                <td>${slot.getDetail()}</td>
                <td>${slot.getStartTime()}</td>
                <td>${slot.getEndTime()}</td>
                <td><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#popup-updateStatus-${slot.getId()}">Edit</button></td>
                <th>
                  <a href="#" class="btn btn-primary" onclick="confirmDelete(${slot.id})">Delete</a>
                </th>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
  </div>
</div>


<c:forEach var="slot" items="${slots}">
  <!-- Modal for updating slot -->
  <div class="modal fade" id="popup-updateStatus-${slot.getId()}" tabindex="-1" aria-labelledby="modalLabel-${slot.id}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Update Slot</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="viewslot" method="post">
            <input type="hidden" name="id" value="${slot.id}" />
            <div class="mb-3">
              <label class="form-label">Detail</label>
              <input type="text" class="form-control"  name="detail" value="${slot.detail}" required />
            </div>
            <div class="mb-3">
              <label class="form-label">Start Time</label>
              <input type="time" class="form-control"  name="startTime" value="${slot.getStartTime()}" required />
            </div>
            <div class="mb-3">
              <label class="form-label">End Time</label>
              <input type="time" class="form-control" name="endTime" value="${slot.getEndTime()}" required />
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</c:forEach>


<%--pop-up add slot--%>
<div class="modal fade" id="popup-add-slot" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add New Slot</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="addslot" method="post">
          <div class="mb-3">
            <label class="form-label">Detail</label>
            <input type="text" class="form-control"  name="detail"  required />
          </div>
          <div class="mb-3">
            <label class="form-label">Start Time</label>
            <input type="time" class="form-control"  name="startTime"  required />
          </div>
          <div class="mb-3">
            <label  class="form-label">End Time</label>
            <input type="time" class="form-control"  name="endTime"  required />
          </div>
          <button type="submit" class="btn btn-primary">Create</button>
        </form>
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


  function confirmDelete(slotId) {
    var confirmation = confirm("Are you sure you want to delete this slot?");
    if (confirmation) {
      window.location.href = 'addslot?slotId=' + slotId;
    }
  }
</script>
<script src="templates/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-Vo0ewNxsZn2Zr2sfotIsOzKQC4fTJPfdHCw2t1jPj2QgW9FpHkAPc6k7cWz1V6k4" crossorigin="anonymous"></script>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>
