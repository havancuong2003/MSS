<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="styleindex.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<style>
    .header {
        background-color: #fff;
        box-shadow: none;
        border-bottom: 1px solid #ddd;
        padding: 10px;
    }

    .dropdown-menu {
        min-width: 150px;
        display: none; /* Ẩn menu dropdown mặc định */
    }
    .dropdown-menu.show {
        display: block; /* Hiện menu khi có lớp 'show' */
    }
    nav {
        margin-bottom: 50px;
    }
    input[type="file"] {
        width: 50%; /* Độ rộng của input type "file" */
        margin-bottom: 10px; /* Khoảng cách dưới của input */
    }

    input[type="submit"] {
        width: 30%; /* Độ rộng của nút submit */
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
    .container {
        padding: 20px;
    }

    .card {
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .card-body {
        padding: 20px;
    }

    .profile-photo {
        border-radius: 50%;
        border: 5px solid #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .profile-photo-form {
        margin-top: 20px;
    }

    .profile-photo-form input[type="file"] {
        display: block;
        margin: 10px 0;
    }

    .profile-details .row {
        margin-bottom: 20px;
    }

    .profile-details h6 {
        font-weight: bold;
        color: #555;
    }

    .profile-details .text-secondary {
        font-size: 1rem;
        color: #666;
    }

    .profile-details input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    .profile-details input[type="text"][readonly] {
        background-color: #f0f0f0; /* Màu nền khác để phân biệt */
        color: #666; /* Màu chữ */
        cursor: not-allowed; /* Con trỏ chuột thay đổi khi di chuyển qua trường readonly */
        border: 1px solid #ccc; /* Màu viền */
        pointer-events: none; /* Ngăn chặn tương tác với trường input readonly */
    }

    .profile-details .text-danger {
        font-size: 0.875rem;
        color: #d9534f;
    }

    .profile-back-btn {
        display: inline-block;
        padding: 10px 20px;
        border-radius: 5px;
        color: #fff;
        background-color: #17a2b8;
        text-decoration: none;
        text-align: center;
    }

    .profile-back-btn:hover {
        background-color: #138496;
    }
    .profile-photo-form {
        display: flex; /* Sử dụng Flexbox để căn chỉnh các phần tử con */
        flex-direction: column; /* Đặt các phần tử theo chiều dọc */
        gap: 10px; /* Khoảng cách giữa các phần tử */
        margin-bottom: 20px; /* Khoảng cách dưới form */
    }

    .file-label {
        /* Thêm một chút cách biệt giữa label và các phần tử nhập */
        margin-bottom: 10px; /* Khoảng cách dưới label */
    }

    .file-submit-container {
        display: flex; /* Dùng Flexbox cho container chứa file input và submit button */
        align-items: center; /* Căn giữa các phần tử theo chiều dọc */
        gap: 10px; /* Khoảng cách giữa file input và submit button */
    }

    input[type="file"] {
        /* Tùy chỉnh kích thước của input file nếu cần */
        flex: 1; /* Chiếm không gian còn lại của container */
    }

    input[type="submit"].btn-save {
        /* Tùy chỉnh kích thước của nút submit */
        padding: 5px 10px; /* Thay đổi kích thước padding của nút */
        font-size: 15px; /* Thay đổi kích thước font của nút */
        flex-shrink: 0; /* Không co lại khi không gian không đủ */
    }
    /*.btn-save {*/
    /*    padding: 5px 10px; !* Thay đổi kích thước padding của nút để làm cho nó nhỏ hơn *!*/
    /*    font-size: 14px; !* Thay đổi kích thước font của nút để làm cho nó nhỏ hơn *!*/
    /*    border-radius: 4px; !* Đặt bo góc cho nút *!*/
    /*    height: auto; !* Đảm bảo chiều cao của nút phù hợp với padding và font-size *!*/
    /*}*/

</style>
<body>
<nav class="navbar navbar-expand-lg header">
    <button class="btn btn-light">
        <a href="${pageContext.request.contextPath}/${role}/dashboard"> <i class="fas fa-arrow-left"></i> Home</a>
    </button>

    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                Profile
            </button>
            <div class="dropdown-menu" id="dropdownMenu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="setting">Setting</a>
                <a class="dropdown-item" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="main-body">
        <div class="row gutters-sm justify-content-center">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <img src="data:image/jpeg;base64,${photoBase64}" alt="Admin" class="profile-photo" width="200">
                        <form id="uploadForm" action="load-photo" method="post" enctype="multipart/form-data" class="profile-photo-form">
                            <label for="fileInput" class="file-label">Profile Avatar: </label>
                            <div class="file-submit-container">
                                <input type="hidden" name="account_id" value="${account.id}">
                                <input type="file" id="fileInput" name="photo" accept=".png, .jpg, .jpeg"/>
                                <input type="submit" value="Save" style="background-color: #FF6600" class="btn btn-primary btn-save">
                            </div>
                        </form>
                        <div class="mt-3">
                            <h4>${account.username}</h4>
                        </div>
                        <div class="mt-3 d-flex align-items-center">
                            <i class="fa fa-lock mr-2" aria-hidden="true"></i>
                            <a href="#" data-toggle="modal" data-target="#editPasswordModal" class="btn btn-link">Change Password</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body profile-details">
                        <form action="load-profile" method="post">
                            <input type="hidden" name="account_id" value="${account.id}">
                            <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">User name</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                <input type="text" id="username" name="account_username" value="${account.username}">
                                <div class="text-danger" id="mess_username">${mess_username}</div>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Phone</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                <input type="text" id="phone" name="account_phone" value="${account.phone}">
                                <div class="text-danger" id="mess_phone">${mess_phone}</div>
                            </div>
                        </div>
                        <hr>
<%--                        <div class="row align-items-center">--%>
<%--                            <div class="col-sm-3">--%>
<%--                                <h6 class="mb-0">Password</h6>--%>
<%--                            </div>--%>
<%--                            <div class="col-sm-7 text-secondary">--%>
<%--                                <input type="text" value="********" readonly>--%>
<%--&lt;%&ndash;                                <div class="text-danger">${mess_password}</div>&ndash;%&gt;--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                <input type="text" value="${account.email}" readonly>
<%--                                <div class="text-danger">${mess_email}</div>--%>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                <input type="text" value="${account.fullname}" readonly>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Date of birth</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                <input type="text" value="${account.dob}" readonly>
                            </div>
                        </div>
                        <hr>
                        <div class="row align-items-center">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div class="col-sm-7 text-secondary">
                                <input type="text" value="${account.address}" readonly>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12 d-flex justify-content-between">
<%--                                <a class="profile-back-btn" href="${pageContext.request.contextPath}/${role}/dashboard">Back to home</a>--%>
                                <button type="submit" style="background-color: #FF6600" class="btn btn-primary profile-save-btn">Save Changes</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
        document.addEventListener('DOMContentLoaded', function() {
        const usernameInput = document.getElementById('username');
        const messUsername = document.getElementById('mess_username');

        usernameInput.addEventListener('input', function() {
        const usernameValue = usernameInput.value.trim();
        messUsername.textContent = ''; // Xóa thông báo lỗi trước khi kiểm tra lại

        // Kiểm tra tên người dùng không được để trống
        if (usernameValue === '') {
        messUsername.textContent = 'Username cannot be empty.';
        usernameInput.classList.add('is-invalid');
        return;
    }
    });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const phoneInput = document.getElementById('phone');
        const phoneError = document.getElementById('mess_phone');

        phoneInput.addEventListener('input', function() {
            const phoneValue = phoneInput.value;
            const phonePattern = /^[0-9]{10}$/;
            const hasNonDigit = /[^0-9]/;
            const allZeroPattern = /^0{10}$/;

            let errorMessage = '';

            if (hasNonDigit.test(phoneValue)) {
                errorMessage = 'Phone numbers must not contain characters';
            } else if (phoneValue.length !== 10) {
                errorMessage = 'The phone number must be exactly 10 digits';
            } else if (allZeroPattern.test(phoneValue)) {
                errorMessage = 'The phone number is not valid';
            }

            phoneError.textContent = errorMessage;
        });
    });
</script>
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
                <form id="changePasswordForm" action="load-profile" method="post">
                    <div class="form-group">
                        <input type="hidden" name="account_id" value="${account.id}">
                        <input type="hidden" id="serverCurrentPassword" value="${account.password}">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" class="form-control" name="currentpassword" id="currentPassword" >
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" name="newpassword" id="newPassword" >
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input type="password" class="form-control" name="confirmnewpassword" id="confirmPassword">
                    </div>
                    <div class="form-group">
                        <div id="errorMessages" class="text-danger"></div> <!-- Phần tử để hiển thị thông báo lỗi -->
                    </div>
                    <button type="submit" class="btn btn-primary" id="saveChangesBtn">Save changes</button>
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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('changePasswordForm');
        const saveButton = document.getElementById('saveChangesBtn');
        const serverCurrentPassword = document.getElementById('serverCurrentPassword').value;
        const errorMessages = document.getElementById('errorMessages'); // Phần tử để hiển thị thông báo lỗi

        saveButton.addEventListener('click', function(event) {
            const currentPassword = document.getElementById('currentPassword').value.trim();
            const newPassword = document.getElementById('newPassword').value.trim();
            const confirmPassword = document.getElementById('confirmPassword').value.trim();

            let isValid = true;
            let errorMessage = '';

            // Reset error messages
            errorMessages.textContent = '';

            // Kiểm tra xem currentPassword có bị để trống không hoặc chỉ chứa khoảng trắng
            if (currentPassword === '') {
                errorMessage += 'Current password cannot be empty or contain only spaces.\n';
                isValid = false;
            } else if (currentPassword !== serverCurrentPassword) {
                errorMessage += 'Current password is incorrect.\n';
                isValid = false;
            }

            // Kiểm tra xem newPassword và confirmPassword có bị để trống không hoặc chỉ chứa khoảng trắng
            if (newPassword === '' || confirmPassword === '') {
                errorMessage += 'Both new password fields must be filled and cannot contain only spaces.\n';
                isValid = false;
            }

            // Kiểm tra xem newPassword và confirmPassword có khớp nhau không
            if (newPassword !== '' && confirmPassword !== '' && newPassword !== confirmPassword) {
                errorMessage += 'New password and confirm password do not match.\n';
                isValid = false;
            }

            // Hiển thị thông báo lỗi
            if (!isValid) {
                event.preventDefault(); // Ngăn chặn gửi form
                errorMessages.textContent = errorMessage; // Hiển thị thông báo lỗi
            }
        });
    });

</script>
<jsp:include page="/views/common/footer.jsp"></jsp:include>
</body>
</html>
