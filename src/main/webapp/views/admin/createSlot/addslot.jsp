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
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Semester Slot Management</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
  />
  <link rel="stylesheet" href="css/addslot.css" />
  <style>
    /* Center the modal in the screen and increase its size */
    .modal-dialog {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 80%;
      max-width: 800px;
    }
    /* Prevent body scrolling when modal is open */
    body.modal-open {
      overflow: hidden;
    }
  </style>
</head>
<body>
<div class="d-flex">
  <!-- Sidebar -->
  <div
          class="bg-dark text-white p-3"
          style="width: 250px; height: 100vh"
  >
    <h4>Sidebar</h4>
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Link 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Link 2</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Link 3</a>
      </li>
    </ul>
  </div>

  <!-- Main content -->
  <div class="flex-grow-1">
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a
                      class="nav-link active"
                      aria-current="page"
                      href="#"
              >Home</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Features</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Pricing</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Content -->
    <div class="container mt-4">
      <div class="header mb-4">
        <h3>Add Slot for Semesters</h3>
        <br />
        <select
                id="semester"
                class="form-control d-inline w-auto"
        >
          <option value="FA24">FA24</option>
          <option value="SP24">SP24</option>
          <option value="SU24">SU24</option>
          <option value="FA23">FA23</option>
          <option value="SP23">SP23</option>
        </select>

        <label for="date-range" class="form-label"
        >Begin:</label
        >
        <input
                type="text"
                id="date-range"
                class="form-control d-inline w-auto"
                value="03/09/2024 to 31/12/2024"
        />
      </div>
      <div class="table-calendar">
        <div class="row text-center fw-bold">
          <div class="col">Sunday</div>
          <div class="col">Monday</div>
          <div class="col">Tuesday</div>
          <div class="col">Wednesday</div>
          <div class="col">Thursday</div>
          <div class="col">Friday</div>
          <div class="col">Saturday</div>
        </div>
        <div class="calendar-body">
          <!-- Repeat this block for each time slot (e.g., hour) -->
          <div class="row">
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <button
                      type="button"
                      class="btn btn-primary"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal"
                      data-bs-whatever="Add Slot"
              >
                +
              </button>
            </div>
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <i
                      class="fa-solid fa-plus"
                      style="align-items: center"
              ></i>
            </div>
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <i
                      class="fa-solid fa-plus"
                      style="align-items: center"
              ></i>
            </div>
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <i
                      class="fa-solid fa-plus"
                      style="align-items: center"
              ></i>
            </div>
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <i
                      class="fa-solid fa-plus"
                      style="align-items: center"
              ></i>
            </div>
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <i
                      class="fa-solid fa-plus"
                      style="align-items: center"
              ></i>
            </div>
          </div>
          <div class="row">
            <div
                    class="col border d-flex justify-content-center align-items-center"
                    style="height: 50px"
            >
              <i
                      class="fa-solid fa-plus"
                      style="align-items: center"
              ></i>
            </div>
            <!-- Add more columns (days) as needed -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">
          Add Slot
        </h1>
        <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label
                    for="recipient-name"
                    class="col-form-label"
            >Recipient:</label
            >
            <input
                    type="text"
                    class="form-control"
                    id="recipient-name"
            />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"
            >Message:</label
            >
            <textarea
                    class="form-control"
                    id="message-text"
            ></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
        >
          Close
        </button>
        <button type="button" class="btn btn-primary">
          Send message
        </button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const exampleModal = document.getElementById("exampleModal");
  exampleModal.addEventListener("show.bs.modal", (event) => {
    const button = event.relatedTarget;
    const recipient = button.getAttribute("data-bs-whatever");
    const modalTitle = exampleModal.querySelector(".modal-title");
    const modalBodyInput =
            exampleModal.querySelector(".modal-body input");

    modalTitle.textContent = recipient;
    modalBodyInput.value = recipient;
  });
</script>
</body>
</html>
