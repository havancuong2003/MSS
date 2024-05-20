<%-- Created by IntelliJ IDEA. User: -MSI- Date: 5/20/2024 Time: 4:19 AM To
change this template use File | Settings | File Templates. --%>
<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Coding By CodingNepal - www.codingnepalweb.com -->
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Website with Login & Signup Form | CodingNepal</title>
    <!-- Google Fonts Link For Icons -->
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/home/style.css"/>
    <%--    <script src="${pageContext.request.contextPath}/views/home/script.js" defer></script>--%>

</head>
<body>
<header>
    <nav class="navbar">
        <span class="hamburger-btn material-symbols-rounded">menu</span>
        <a href="#" class="logo">
            <img src="images/logo.jpg" alt="logo"/>
            <h2>CodingNepal</h2>
        </a>
        <ul class="links">
            <span class="close-btn material-symbols-rounded">close</span>
            <li><a href="#">Home</a></li>
            <li><a href="#">Portfolio</a></li>
            <li><a href="#">Courses</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Contact us</a></li>
        </ul>
        <button class="login-btn">LOG IN</button>
    </nav>
</header>

<div class="blur-bg-overlay"></div>
<div class="form-popup">
    <span class="close-btn material-symbols-rounded">close</span>

    <!-- Login Form -->
    <div class="form-box login">
        <div class="form-details">
            <h2>Welcome Back</h2>
            <p>Please log in using your personal information to stay connected with us.</p>
        </div>
        <div class="form-content">
            <h2>LOGIN</h2>
            <h4 id="error" style="color: red"></h4>
            <form id="login-form">
                <div class="input-field">
                    <input type="text" name="username" required/>
                    <label>UserName</label>
                </div>
                <div class="input-field">
                    <input type="password" name="password" required/>
                    <label>Password</label>
                </div>
                <a href="#" id="forgot-password-link" class="forgot-pass-link">Forgot password?</a>
                <button type="submit">Log In</button>
            </form>
        </div>
    </div>

    <!-- Forgot Password Form -->
    <div class="form-box forgot-password">
        <div class="form-details">
            <h2>Forgot Password</h2>
            <p>Enter your email address and we'll send you a link to reset your password.</p>
        </div>
        <div class="form-content">
            <h2>RESET PASSWORD</h2>
            <form id="reset-password-token">
                <div class="input-field">
                    <input type="email" id="email" name="email" required/>
                    <label>Email</label>
                </div>
                <button type="submit" id="send-reset-link">Send Reset Link</button>
            </form>
            <div class="bottom-link">
                Remembered your password?
                <a href="#" id="login-link">Login</a>
            </div>
        </div>
    </div>

    <!-- Input Token Form -->
    <div class="form-box input-token">
        <div class="form-details">
            <h2>Enter Token</h2>
            <p>Enter the token you received in your email to proceed.</p>
        </div>
        <div class="form-content">
            <h2>INPUT TOKEN</h2>
            <form id="token-form">
                <div class="input-field">
                    <input type="text" id="token" name="token" required/>
                    <label>Token</label>
                </div>
                <button type="submit" id="verify-token">Verify Token</button>
            </form>
            <div class="bottom-link">
                Didn't receive the token? <a href="#" id="resend-token-link">Resend Token</a>
            </div>
        </div>
    </div>

    <!-- Reset Password Form -->
    <div class="form-box reset-password">
        <div class="form-details">
            <h2>Reset Password</h2>
            <p>Enter your new password below to reset your account password.</p>
        </div>
        <div class="form-content">
            <h2>NEW PASSWORD</h2>
            <form id="new-password-form">
                <div class="input-field">
                    <input type="password" id="new-password" name="new-password" required/>
                    <label>New Password</label>
                </div>
                <div class="input-field">
                    <input type="password" id="confirm-password" name="confirm-password" required/>
                    <label>Confirm Password</label>
                </div>
                <button type="submit">Reset Password</button>
            </form>
            <div class="bottom-link">
                Remembered your password?
                <a href="#" id="login-link">Login</a>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    const navbarMenu = document.querySelector(".navbar .links");
    const hamburgerBtn = document.querySelector(".hamburger-btn");
    const hideMenuBtn = navbarMenu.querySelector(".close-btn");
    const showPopupBtn = document.querySelector(".login-btn");
    const formPopup = document.querySelector(".form-popup");
    const hidePopupBtn = formPopup.querySelector(".close-btn");
    const forgotPasswordLink = document.getElementById("forgot-password-link");
    const loginLink = document.getElementById("login-link");
    const sendResetLinkBtn = document.getElementById("send-reset-link");
    const rememberedPasswordLink = document.querySelector(".reset-password .bottom-link a");

    // Show mobile menu
    hamburgerBtn.addEventListener("click", () => {
        navbarMenu.classList.toggle("show-menu");
    });

    // Hide mobile menu
    hideMenuBtn.addEventListener("click", () => hamburgerBtn.click());

    // Show login popup
    showPopupBtn.addEventListener("click", () => {
        document.body.classList.toggle("show-popup");
    });

    // Hide login popup
    hidePopupBtn.addEventListener("click", () => showPopupBtn.click());

    // Show forgot password form
    forgotPasswordLink.addEventListener("click", (e) => {
        e.preventDefault();
        formPopup.classList.add("show-forgot-password");
    });

    // Show login form
    loginLink.addEventListener("click", (e) => {
        e.preventDefault();
        formPopup.classList.remove("show-forgot-password");
        formPopup.classList.remove("show-reset-password");
    });

    // Show reset password form
    sendResetLinkBtn.addEventListener("click", (e) => {
        e.preventDefault();
        formPopup.classList.remove("show-forgot-password");
        formPopup.classList.add("show-reset-password");
    });

    // Navigate back to login form from reset password form
    rememberedPasswordLink.addEventListener("click", (e) => {
        e.preventDefault();
        formPopup.classList.remove("show-reset-password");
        formPopup.classList.remove("show-forgot-password");
    });

    sendResetLinkBtn.addEventListener("click", (e) => {
        e.preventDefault(); // Ngăn chặn hành động mặc định của nút gửi liên kết đặt lại mật khẩu

        // Ẩn form gửi liên kết đặt lại mật khẩu và hiển thị form nhập token
        formPopup.classList.remove("show-forgot-password");
        formPopup.classList.add("show-input-token");
        formPopup.classList.remove("show-reset-password");
    });
    $('#token-form').submit(function (event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của form

        // Ẩn form nhập token và hiển thị form nhập mật khẩu mới
        formPopup.classList.remove("show-input-token");
        formPopup.classList.add("show-reset-password");
    });

</script>


<script>
    $(document).ready(function () {
        $('#login-form').submit(function (event) {
            console.log("login")
            event.preventDefault(); // Prevent default form submission
            event.stopPropagation(); // Prevent event propagation
            const formData = $(this).serialize();
            $.ajax({
                type: 'POST',
                url: 'login',
                data: formData,
                dataType: 'json',
                success: function (response) {
                    window.location.href = "mystudyspace";
                },
                error: function (xhr, status, error) {
                    if (xhr.status === 401) {
                        // Handle login error
                        const response = JSON.parse(xhr.responseText);
                        $('#error').text(response); // Display error message
                    } else {
                        // Handle other errors
                        $('#error').text('Error: ' + error); // Display error message
                    }
                }
            });
        });

    });

</script>
<script>
    $(document).ready(function () {
            $('#reset-password-token').submit(function (event) {
                event.preventDefault(); // Prevent default form submission
                event.stopPropagation(); // Prevent event propagation
                const formData = $(this).serialize();
                $.ajax({
                    type: 'POST',
                    url: 'SendTokenServlet',
                    data: formData,
                    dataType: 'json',
                    success: function (response) {
                        console.log("response", response);
                    },
                    error: function (xhr, status, error) {
                        if (xhr.status === 401) {
                            // Handle login error
                            const response = JSON.parse(xhr.responseText);
                            $('#error').text(response); // Display error message
                        } else {
                            // Handle other errors
                            $('#error').text('Error: ' + error); // Display error message
                        }
                    }
                });
            });

        });
</script>
</body>
</html>
