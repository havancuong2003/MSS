<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="styleindex.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="file"] {
        width: 50%; /* Độ rộng của input type "file" */
        margin-bottom: 10px; /* Khoảng cách dưới của input */
    }

    input[type="submit"] {
        width: 50%; /* Độ rộng của nút submit */
        padding: 10px; /* Kích thước padding */
        background-color: #007bff; /* Màu nền của nút */
        color: #fff; /* Màu chữ của nút */
        border: none; /* Không có viền */
        border-radius: 5px; /* Bo góc */
        cursor: pointer; /* Con trỏ chuột khi di chuyển vào nút */
    }

    input[type="submit"]:hover {
        background-color: #0056b3; /* Màu nền khi di chuột vào nút */
    }
    .rounded-circle {
        border-radius: 50%; /* Làm tròn ảnh */
        width: 200px; /* Độ rộng của ảnh */
        height: 200px; /* Chiều cao của ảnh */
    }
</style>
<body>
<div class="container">
    <div class="main-body">
        <div class="row gutters-sm justify-content-center">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <img src="data:image/jpeg;base64,${photoBase64}" alt="Admin" class="rounded-circle" width="200">
                        <form id="uploadForm" action="load-photo" method="post"  enctype="multipart/form-data">
                            <label>Profile Photo: </label>
                            <input type="hidden" name="account_id" value="${account.id}">
                            <input  type="file" id="fileInput" name="photo" size="50"  accept=".png, .jpg, .jpeg"/>
                            <input type="submit" value="Save">
                        </form>
                        <div class="mt-3">
                            <h4>${account.username}</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">User name</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ${account.username}
                                <div  class="text-danger">${mess_username}</div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#editUserNameModal">Edit</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Phone</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ${account.phone}
                                <div  class="text-danger">${mess_phone}</div>
                            </div>

                            <div class="col-sm-2">
                                <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#editPhoneNumberModal">Edit</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Password</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ********
                                <div  class="text-danger">${mess_password}</div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#editPasswordModal">Edit</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ${account.email}
                                <div  class="text-danger">${mess_email}</div>
                            </div>
                            <%--                            <div class="col-sm-2">--%>
                            <%--                                <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#editEmailModal">Edit</button>--%>
                            <%--                            </div>--%>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ${account.fullname}
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Date of birth</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ${account.dob}
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                ${account.address}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <a class="btn btn-info" target="__blank" href="${role}/dashboard">Back to home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Modal for Editing username -->
<div class="modal fade" id="editUserNameModal" tabindex="-1" aria-labelledby="editUserNameModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserNameModalLabel">Edit Nick Name</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="load-profile" method="post"  >
                    <div class="form-group">
                        <label for="newUserName">User Name</label>
                        <input type="hidden" name="account_id" value="${account.id}">
                        <input type="text" class="form-control" id="newUserName" name="account_username" value="${account.username}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Editing Phone -->
<div class="modal fade" id="editPhoneNumberModal" tabindex="-1" aria-labelledby="editPhoneNumberModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editPhoneNumberModalLabel">Edit Phone Number</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="load-profile" method="post">
                    <div class="form-group">
                        <label for="newPhoneNumber">Phone Number</label>
                        <input type="hidden" name="account_id" value="${account.id}">
                        <input type="tel" class="form-control" id="newPhoneNumber" name="account_phone" value="${account.phone}" required>
                        <%--                        <div id="phoneError" class="text-danger"></div>--%>
                    </div>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Editing Email -->
<div class="modal fade" id="editEmailModal" tabindex="-1" aria-labelledby="editEmailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editEmailModalLabel">Edit Email</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="load-profile" method="post">
                    <div class="form-group">
                        <label for="newEmail">Email</label>
                        <input type="hidden" name="account_id" value="${account.id}">
                        <input type="tel" class="form-control" id="newEmail" name="account_email" value="${account.email}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Editing Password -->
<div class="modal fade" id="editPasswordModal" tabindex="-1" aria-labelledby="editPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editPasswordModalLabel">Change Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="load-profile" method="post">
                    <div class="form-group">
                        <input type="hidden" name="account_id" value="${account.id}">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" class="form-control" name="currentpassword" id="currentPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" name="newpassword" id="newPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input type="password" class="form-control" name="confirmnewpassword" id="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];
        if (file) {
            var fileType = file.type;
            if (fileType !== 'image/png' && fileType !== 'image/jpeg' && fileType !== 'image/jpg') {
                alert('Please upload a PNG or JPG file.');
                event.preventDefault();
            }
        } else {
            alert('No file selected.');
            event.preventDefault();
        }
    });
</script>
</body>
</html>
