<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Major</title>
    <style>
        /* Base styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }

        /* Button styles */
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #45a049;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
        }

        /* Table styles */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            border-radius: 10px 10px 0 0;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9f5e9;
        }

        /* Search input styles */
        #searchInput {
            width: calc(100% - 30px);
            padding: 12px;
            margin: 20px auto;
            display: block;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1);
        }

        /* Form styles */
        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            margin-top: 10px;
        }

        form input, form select {
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1);
        }

        form button {
            align-self: center;
            margin-top: 20px;
        }

        /* Error message styles */
        .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }

        /* Media queries for responsiveness */
        @media (max-width: 768px) {
            .modal-content {
                width: 90%;
            }

            table {
                width: 90%;
            }

            .button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }

    </style>
</head>
<body>

<h2>Major List</h2>
<input type="text" id="searchInput" name="search" placeholder="Enter name or code of major ..." oninput="getMajorSearch()" style="width:50%;">
<table id="majorTable">
    <thead>
    <tr>
        <th>Code</th>
        <th>Detail</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody id="majorTableBody">
    </tbody>
</table>
<!-- Trigger/Open The Modal -->
<div style="text-align: center">
<button class="button" id="addMajorBtn" >Add Major</button>
</div>

<!-- The Add Modal -->
<div id="addMajorModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Add New Major</h2>
        <form id="addMajorForm" onsubmit="event.preventDefault(); addMajor();">
            <label for="code">Code:</label>
            <input type="text" id="code" name="code" required>
            <label for="detail">Detail:</label>
            <input type="text" id="detail" name="detail" required>
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="true">Active</option>
                <option value="false">Deactive</option>
            </select>
            <button class="button" type="submit">Submit</button>
            <div class="error" id="addError"></div>
        </form>
    </div>
</div>

<!-- The Edit Modal -->
<div id="editMajorModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span id="editCloseBtn" class="close">&times;</span>
        <h2>Edit Major</h2>
        <form id="editMajorForm" onsubmit="event.preventDefault(); editMajor();">
            <label for="editCode">Code:</label>
            <input type="text" id="editCode" name="code" disabled>
            <label for="editDetail">Detail:</label>
            <input type="text" id="editDetail" name="detail" required>
            <label for="editStatus">Status:</label>
            <select id="editStatus" name="status">
                <option value="true">Active</option>
                <option value="false">Deactive</option>
            </select>
            <button class="button" type="submit">Submit</button>
            <div class="error" id="editError"></div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

    $(document).ready(function () {
        getMajorSearch();
    });

    function getMajorSearch() {
        var searchInput = document.getElementById("searchInput").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/viewlistmajor",
            type: "post",
            dataType: "json",
            data: {
                "search": searchInput
            },
            success: function (data) {
                console.log(data.majors);
                var majors = data.majors;
                var tableBody = document.getElementById("majorTableBody");
                tableBody.innerHTML = "";
                majors.forEach(function (major) {
                    var row = "<tr>" +
                        "<td>" + major.code + "</td>" +
                        "<td>" + major.detail + "</td>" +
                        "<td>" + (major.status ? "Active" : "Deactive") + "</td>" +
                        "<td><button class='editBtn' data-code='" + major.code + "' data-detail='" + major.detail + "' data-status='" + major.status + "'>Edit</button></td>" +
                        "</tr>";
                    tableBody.innerHTML += row;
                });

                // Add event listeners to the new edit buttons
                document.querySelectorAll(".editBtn").forEach(function (btn) {
                    btn.addEventListener("click", function () {
                        var code = this.getAttribute("data-code");
                        var detail = this.getAttribute("data-detail");
                        var status = this.getAttribute("data-status");
                        openEditModal(code, detail, status);
                    });
                });
            }
        })
    }

    // Function to open the edit modal with pre-filled data
    function openEditModal(code, detail, status) {
        var modal = document.getElementById("editMajorModal");
        modal.style.display = "block";

        // Fill the form with major data
        document.getElementById("editCode").value = code;
        document.getElementById("editDetail").value = detail;
        document.getElementById("editStatus").value = status;
    }

    // Event listener to close the modal
    document.getElementById("editCloseBtn").addEventListener("click", function () {
        var modal = document.getElementById("editMajorModal");
        modal.style.display = "none";
    });

    window.onclick = function (event) {
        var modal = document.getElementById("editMajorModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // Modal for adding a major
    var addModal = document.getElementById("addMajorModal");
    var addBtn = document.getElementById("addMajorBtn");
    var addSpan = document.getElementsByClassName("close")[0];

    addBtn.onclick = function () {
        addModal.style.display = "block";
    }

    addSpan.onclick = function () {
        addModal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == addModal) {
            addModal.style.display = "none";
        }
    }

    function addMajor() {
        var code = document.getElementById("code").value;
        var detail = document.getElementById("detail").value;
        var status = document.getElementById("status").value;
        console.log(status);
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/addmajor",
            type: "post",
            dataType: "json",
            data: {
                "code": code,
                "detail": detail,
                "status": status
            },
            success: function (data) {
                alert(data.message);
                document.getElementById("addMajorModal").style.display = "none";
                getMajorSearch();
            }
        })
    }

    function editMajor() {
        var code = document.getElementById("editCode").value;
        var detail = document.getElementById("editDetail").value;
        var status = document.getElementById("editStatus").value;
        console.log(code);
        console.log(detail);
        console.log(status);
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/editmajor",
            type: "post",
            dataType: "json",
            data: {
                "code": code,
                "detail": detail,
                "status": status
            },
            success: function (data) {
                alert(data.message);
                document.getElementById("editMajorModal").style.display = "none";
                getMajorSearch();
            }
        })
    }
</script>

</body>
</html>
