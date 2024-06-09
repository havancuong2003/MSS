<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/9/2024
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/app-ajax.js"></script>
    <style>
        body {
            background-color: #f5f5f5; /* Màu nền nhẹ nhàng hơn cho trang */
            color: #333333; /* Màu chữ mềm mại hơn */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px; /* Giới hạn độ rộng của container */
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ cho container */
        }

        .search-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .form-container form {
            display: flex;
            align-items: center;
        }

        .form-container form select,
        .form-container form input[type="text"],
        .form-container form button {
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            padding: 8px;
        }

        .form-container form select,
        .form-container form input[type="text"] {
            background-color: #ffffff;
            flex: 1; /* Để các input và select có cùng chiều rộng */
        }

        .form-container form button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container form button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden; /* Để áp dụng bo tròn cho các góc */
            margin-top: 20px;
        }

        thead th {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            text-align: left;
            font-size: 14px;
        }

        th,td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        td {
            font-size: 14px;
        }
        th.user-name {
            width: 10%;
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        .actions a {
            margin-right: 10px;
        }

        .popup-container {
            position: relative;
            display: inline-block;
        }

        .popup-content {
            display: none;
            position: absolute;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 300px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        .popup-content textarea {
            width: 100%;
            height: 100px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 8px;
            resize: none;
        }

        .popup-content button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .modal-content {
            border-radius: 8px;
        }

        .modal-header {
            background-color: #007bff;
            color: #ffffff;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .pagination-container {
            text-align: center;
            margin-top: 20px;
        }

        .pagination {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            margin: 0;
        }

        .pagination li {
            display: inline-block;
            margin: 0 2px;
        }

        .pagination li a {
            color: #007bff;
            min-width: 30px;
            padding: 6px 12px;
            text-decoration: none;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 38px;
            box-sizing: border-box;
            transition: background-color 0.3s, color 0.3s;
        }

        .pagination li a:hover {
            background-color: #e9ecef;
            color: #0056b3;
        }

        .pagination li.active a {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .pagination li.disabled a {
            color: #ccc;
            cursor: not-allowed;
        }

        .hint-text {
            margin-bottom: 10px;
            font-size: 14px;
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="search-container">
        <div class="form-container">
            <form action="manage-application" method="get">

                <select name="status">
                    <option value="0">Choose status</option>
                    <c:forEach var="o" items="${listApplicationStatusCategory}">
                        <option value="${o.status_id}" ${status == o.status_id ? "selected" : ""}>${o.description}</option>
                    </c:forEach>
                </select>
                <select name="applicationCategory" id="application">
                    <option value="0">Choose Application Type (Chọn loại đơn)</option>
                    <c:forEach var="o" items="${listApplicationCategory}">
                        <option value="${o.category_id}" ${applicationCategory == o.category_id ? "selected" : ""}>${o.description}</option>
                    </c:forEach>
                </select>
                <button type="submit">Select</button>
            </form>
            <form action="search-application" method="get">
                <input type="text" placeholder="Search by user name..." name="search">
                <button type="submit">Search</button>
            </form>
        </div>
    </div>
    <p style="color: red">
        ${mess}
    </p>
    <table border="1">
        <thead>
        <tr>
            <th class="student-id">StudentID</th>
            <th class="user-name">User Name</th>
            <th class="email">Email</th>
            <th class="application-type">Application type</th>
            <th class="reason">Reason</th>
            <th class="actions">Actions</th>
            <th class="status">Status</th>
        </tr>
        </thead>
        <c:forEach var="o" items="${listApplication}">
            <tbody>
            <td>${o.student.id}</td>
            <td>${o.student.account.username}</td>
            <td class="email">${o.student.account.email}</td>
            <td>${o.applicationCategory.description}</td>
            <td>${o.reason}</td>
            <td style="width: 217px">
                <c:if test="${o.applicationStatus.status_id == 1}">
                    <button class="btn btn-primary">
                        <a style="color: white" href="send-response?application_id=${o.application_id}&reject=0">Response</a>
                    </button>
                    <button class="btn btn-danger">
                        <a style="color: white" href="send-response?application_id=${o.application_id}&reject=1">Reject</a>
                    </button>
                </c:if>
                <c:if test="${o.applicationStatus.status_id == 2}">
                    <div style="text-align: center">
                        <form id="viewResponseForm" action="send-response" method="get">
                            <input type="hidden" name="application_id" value="${o.application_id}">
                            <button id="viewResponseButton" class="btn btn-primary" type="button">
                                <a style="color: white" href="#">View Response</a>
                            </button>
                        </form>
                    </div>
                </c:if>
            </td>
            <c:if test="${o.applicationStatus.status_id == 1}">
                <td style="color: yellowgreen">Wait for a response</td>
            </c:if>
            <c:if test="${o.applicationStatus.status_id == 2}">
                <td style="color: green">Responsed</td>
            </c:if>
            <c:if test="${o.applicationStatus.status_id == 3}">
                <td style="color: red">Reject</td>
            </c:if>
            </tbody>
        </c:forEach>
    </table>
    <div class="pagination-container">
        <%--        <div class="hint-text">Showing <b>4</b> out of <b>25</b> entries</div>--%>
        <ul class="pagination">
            <%--Paging for search application--%>
            <c:if test="${searchtxt != null}" >
                <c:if test="${tag > 1}">
                    <li class="page-item"><a href="search-application?index=${tag-1}&search=${searchtxt}">Previous</a></li>
                </c:if>
                <c:if test="${tag ==1}">
                    <li class="page-item"><a href="#">Previous</a></li>
                </c:if>
                <c:forEach begin="1" end="${endPage}" var="i">
                    <li class="page-item ${i == tag ? 'active' : ''}">
                        <a href="search-application?page=${i}&search=${searchtxt}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${tag < endPage}" >
                    <li class="page-item" ><a href="search-application?page=${tag+1}&search=${searchtxt}" class="page-link">Next</a></li>
                </c:if>
                <c:if test="${tag == endPage}">
                    <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                </c:if>
            </c:if>
            <%--paging for application--%>
            <c:if test="${searchtxt == null}" >
                <c:if test="${tag > 1}">
                    <li class="page-item"><a href="manage-application?page=${tag-1}&status=${status}&applicationCategory=${applicationCategory}">Previous</a></li>
                </c:if>
                <c:if test="${tag ==1}">
                    <li class="page-item"><a href="#">Previous</a></li>
                </c:if>
                <c:forEach begin="1" end="${endPage}" var="i">
                    <li class="page-item ${i == tag ? 'active' : ''}">
                        <a href="manage-application?page=${i}&status=${status}&applicationCategory=${applicationCategory}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${tag < endPage}" >
                    <li class="page-item" ><a href="manage-application?page=${tag+1}&status=${status}&applicationCategory=${applicationCategory}" class="page-link">Next</a></li>
                </c:if>
                <c:if test="${tag == endPage}">
                    <li class="page-item" ><a href="#" class="page-link">Next</a></li>
                </c:if>
            </c:if>

        </ul>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="responseModal" tabindex="-1" role="dialog" aria-labelledby="responseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="responseModalLabel">Response</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <textarea id="responseTextArea" rows="10" cols="50"></textarea>
            </div>
        </div>
    </div>
</div>

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Include Bootstrap JS (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Your custom script -->
<script type="text/javascript">
    // Use jQuery's noConflict() to release the $ variable
    jQuery.noConflict();

    // Use jQuery instead of $ to avoid conflicts
    jQuery(document).ready(function($) {
        $('#viewResponseButton').click(function(event) {
            event.preventDefault(); // Prevent the default button click behavior

            // Get the application_id from the hidden input field
            var applicationId = $(this).closest('form').find('input[name="application_id"]').val();

            // Send AJAX request to the servlet to get the response data
            $.ajax({
                url: "view-response",
                type: "GET",
                data: { application_id: applicationId },
                success: function(response) {
                    // Update the modal content with the received response data
                    $('#responseTextArea').text(response);

                    // Show the modal
                    $('#responseModal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error("Failed to fetch response:", status, error);
                }
            });
        });
    });
</script>
</body>
</html>
