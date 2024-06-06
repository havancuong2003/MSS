<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 6/3/2024
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
            rel="stylesheet"
    />


    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link
            href="${pageContext.request.contextPath}/views/landing_page/landingPAGE/lib/owlcarousel/assets/owl.carousel.min.css"
            rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/views/landing_page/landingPAGE/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/landing_page/landingPAGE/style.css" />
    <style>
        .error-message {
            color: red;
            font-size: 0.9em;
        }
        .success-message {
            color: green;
            font-size: 0.9em;
        }
        .input-field {
            position: relative;
        }

        .input-field i {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
        }

        .input-field i:hover {
            color: #333;
        }
        .disabled-link {
            pointer-events: none;
            cursor: not-allowed;
            color: red;
        }

    </style>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<!-- Navbar End -->
<div class="blur-bg-overlay"></div>
<div class="form-popup">
    <span class="close-btn material-symbols-rounded">close</span>

    <!-- Login Form -->
    <div class="form-box login">
        <div class="form-details">
            <h2>Welcome Back</h2>
            <p>
                Please log in using your personal information to stay
                connected with us.
            </p>
        </div>
        <div class="form-content">
            <h2>LOGIN</h2>
            <h4 id="error" style="color: red"></h4>

            <form id="login-form">

                <div class="input-field">
                    <input
                            type="text"
                            name="username"
                            id="username-login"
                            required
                    />
                    <label>UserName</label>
                </div>
                <div class="input-field">
                    <input
                            type="password"
                            name="password"
                            id="password-login"
                            required
                    />
                    <label>Password</label>
                    <i class="bi bi-eye-fill" id="toggle-password-login" onclick="togglePasswordVisibility('password-login')"></i>
                </div>
                <a
                        href="#"
                        id="forgot-password-link"
                        class="forgot-pass-link"
                >Forgot password?</a
                >
                <button type="submit">Log In</button>
            </form>
        </div>
    </div>

    <!-- Forgot Password Form -->
    <div class="form-box forgot-password">
        <div class="form-details"></div>
        <div class="form-content">
            <h2>RESET PASSWORD</h2>
            <h4 id="error_email" style="color: red"></h4>
            <form id="reset-password-token">
                <div class="input-field">
                    <input
                            type="text"
                            id="email"
                            name="email"
                            required
                    />
                    <label>Email</label>
                </div>
                <div id="loading_resetPassword" style="display: none">
                    <jsp:include page="landingPAGE/load.jsp" />
                </div>

                <button type="submit" id="send-reset-link">
                    Send Reset Link
                </button>
            </form>
            <div class="bottom-link">
                Remembered your password?
                <a href="#" id="login-link">Login</a>
            </div>
        </div>
    </div>

    <!-- Input Token Form -->
    <div class="form-box input-token">
        <div class="form-details"></div>
        <div class="form-content">
            <h2>INPUT TOKEN</h2>
            <h4 id="error_token" style="color: red"></h4>
<%--            <div id="countdown"></div>--%>
            <input type="hidden" id="countdown-seconds"  />
            <form id="token-form">
                <div class="input-field">
                    <input
                            type="text"
                            id="token"
                            name="token"
                            required
                    />
                    <input
                            type="hidden"
                            id="email_reset"
                            value=""
                            name="email_reset"
                    />
                    <label>Token</label>
                </div>
                <div id="loading_email_send_token" style="display: none">
                    <jsp:include page="landingPAGE/load.jsp" />
                </div>
                <button type="submit" id="verify-token">
                    Verify Token
                </button>
            </form>
            <div class="bottom-link">
                Didn't receive the token?
                <a href="#" id="resend-token-link">Resend Token</a><span style="color: #FF6600" id="countdown"></span>
            </div>
        </div>
    </div>

    <div class="form-box reset-password">
        <div class="form-details">
        </div>
        <div class="form-content">
            <h2>NEW PASSWORD</h2>
            <h4 id="error_password" style="color: red"></h4>

            <form id="new-password-form">
                <div id="error_new_password" class="error-message"></div>
                <input
                        type="hidden"
                        id="email_to_change"
                        value=""
                        name="email_to_change"
                />
                <div class="input-field">
                    <input type="password" id="new-password" name="new-password" required/>
                    <label for="new-password">New Password</label>
                    <i class="bi bi-eye-fill" id="toggle-new-password" onclick="togglePasswordVisibility('new-password')"></i>
                </div>
                <div id="error_confirm_password" class="error-message"></div>
                <div class="input-field">
                    <input type="password" id="confirm-password" name="confirm-password" required/>
                    <label for="confirm-password">Confirm Password</label>
                    <i class="bi bi-eye-fill" id="toggle-confirm-password" onclick="togglePasswordVisibility('confirm-password')"></i>
                </div>
                <div id="loading_email_new_password" style="display: none">
                    <jsp:include page="landingPAGE/load.jsp" />
                </div>
                <button type="submit" id="reset-password">
                    Reset Password
                </button>
            </form>
            <div class="bottom-link">
                Remembered your password?
                <a href="#" id="login-link">Login</a>
            </div>
        </div>
    </div>
</div>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/lib/owlcarousel/owl.carousel.min.js"></script>



<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    const navbarMenu = document.querySelector(".navbar .links");

    const showPopupBtn = document.querySelector(".login-btn");
    const formPopup = document.querySelector(".form-popup");
    const hidePopupBtn = formPopup.querySelector(".close-btn");
    const forgotPasswordLink = document.getElementById(
        "forgot-password-link"
    );
    const loginLink = document.getElementById("login-link");
    const sendResetLinkBtn = document.getElementById("send-reset-link");
    const rememberedPasswordLink = document.querySelector(
        ".reset-password .bottom-link a"
    );


    showPopupBtn.addEventListener("click", () => {
        document.body.classList.toggle("show-popup");
    });

    // Hide login popup
    hidePopupBtn.addEventListener("click", () => showPopupBtn.click());

    // Show forgot password form
    forgotPasswordLink.addEventListener("click", (e) => {
        e.preventDefault();
        formPopup.classList.add("show-forgot-password");
        $("#username-login").val("");
        $("#password-login").val("");
        $("#error").text("");
    });

    // Show login form
    loginLink.addEventListener("click", (e) => {
        e.preventDefault();
        $("#username-login").val("");
        $("#password-login").val("");
        $("#new-password").val("");
        $("#confirm-password").val("");
        $("#token").val("");
        $("#email").val("");
        $("#error").text("");
        $("#error_token").text("");
        $("#error_password").text("");
        $("#error_email").text("");
        formPopup.classList.remove("show-forgot-password");
        formPopup.classList.remove("show-reset-password");
    });

    rememberedPasswordLink.addEventListener("click", (e) => {
        e.preventDefault();
        formPopup.classList.remove("show-reset-password");
        formPopup.classList.remove("show-forgot-password");
    });
</script>

<script>
    $(document).ready(function () {
        $("#login-form").submit(function (event) {
            console.log("login");
            event.preventDefault(); // Prevent default form submission
            event.stopPropagation(); // Prevent event propagation
            const formData = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/login",
                data: formData,
                dataType: "json",
                success: function (response) {
                    console.log("response", response.role);
                    switch (response.role) {
                        case "admin":
                            window.location.href = "${pageContext.request.contextPath}/admin/dashboard";
                            break;
                        case "staff":
                            window.location.href = "${pageContext.request.contextPath}/staff/dashboard";
                            break;
                        case "student":
                            window.location.href = "${pageContext.request.contextPath}/student/dashboard";
                            break;
                        case "teacher":
                            window.location.href = "${pageContext.request.contextPath}/teacher/dashboard";
                            break;

                    }
                },
                error: function (xhr, status, error) {
                    if (xhr.status === 401) {
                        // Handle login error
                        const response = JSON.parse(xhr.responseText);
                        $("#error").text(response); // Display error message
                    } else {
                        // Handle other errors
                        $("#error").text("Error: " + error); // Display error message
                    }
                },
            });
        });
    });
</script>

<script>
    $(document).ready(function () {
        $("#reset-password-token").submit(function (event) {
            event.preventDefault();
            event.stopPropagation();

            const emailInput = $("#email").val();
            const emailPattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;

            if (!emailPattern.test(emailInput)) {
                $("#error_email").text(
                    "Please enter a valid email address."
                );

                return;
            }
            $("#send-reset-link").css("opacity", "0");
            $("#send-reset-link").css("pointer-events", "none");

            $("#loading_resetPassword").css("display", "block");

            const formData = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/SendTokenServlet",
                data: formData,
                dataType: "json",
                success: function (response) {
                    console.log("response", response);
                    $("#loading_resetPassword").css("display", "none");
                    $("#send-reset-link").css("opacity", "1");
                    $("#send-reset-link").css("pointer-events", "auto");
                    $("#email_reset").val(emailInput);
                    $("#error_email").text("");
                    $("#email").val("");

                    $('#resend-token-link').css("display", "none");
                    formPopup.classList.remove("show-forgot-password");
                    formPopup.classList.add("show-input-token");
                    formPopup.classList.remove("show-reset-password");


                    $('#countdown-seconds').val(response.expirationTime);
                    // Thời gian hết hạn (ở đây là một timestamp dưới dạng số nguyên, tính bằng milliseconds)
                    const expirationTime = $('#countdown-seconds').val(); // Thay bằng giá trị thực tế từ database
                    console.log("expirationTime", expirationTime);
                    console.log("count",$('#countdown-seconds').val());
                    // Chuyển đổi expirationTime từ milliseconds sang giây
                    // Kiểm tra nếu expirationTime là null, ẩn phần đếm ngược
                    if (expirationTime === null) {
                        document.getElementById('countdown').innerText = 'NUll roi';
                    } else {
                        // Nếu không phải null, tiến hành đếm ngược như bình thường
                        const expirationTimeInSeconds = Math.floor(expirationTime / 1000);
                        let countdownInterval;

                        function updateCountdown() {
                            const currentTime = Math.floor(Date.now() / 1000);
                            const timeRemaining = expirationTimeInSeconds - currentTime;

                            if (timeRemaining <= 0) {
                                $('#resend-token-link').css("display", "block");
                                $('#countdown').css("display", "none");
                                clearInterval(countdownInterval);
                            } else {
                                const hours = Math.floor(timeRemaining / 3600);
                                const minutes = Math.floor((timeRemaining % 3600) / 60);
                                const seconds = timeRemaining % 60;
                                document.getElementById('countdown').innerText = `Remaining time for the next token deposit: \${hours} h \${minutes} m \${seconds} s`;
                            }
                        }

                        countdownInterval = setInterval(updateCountdown, 1000);
                        updateCountdown();
                    }
                },
                error: function (xhr, status, error) {
                    $("#loading_resetPassword").css("display", "none");
                    $("#send-reset-link").css("opacity", "1");
                    $("#send-reset-link").css("pointer-events", "auto");
                    if (xhr.status === 400) {
                        const response = JSON.parse(xhr.responseText);
                        $("#error_email").text(response.error);
                    } else {
                        $("#error_email").text(
                            "Server error: " + error
                        );
                    }
                },
            });
        });
    });
</script>

<script>
    $(document).ready(function () {
        $("#token-form").submit(function (event) {
            event.preventDefault();
            event.stopPropagation();
            $("#verify-token").css("opacity", "0");
            $("#loading_token").css("display", "block");

            const formData = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/checktoken",
                data: formData,
                dataType: "json",
                success: function (response) {
                    console.log("response token input", response);
                    $("#verify-token").css("opacity", "1");
                    $("#loading_token").css("display", "none");
                    if (response.tokenValid) {
                        $("#token").val("");
                        $("#error_token").text("");
                        formPopup.classList.remove("show-input-token");
                        formPopup.classList.add("show-reset-password");
                        $("#email_to_change").val(response.email);
                    } else {
                        $("#error_token").text(
                            "Token is invalid or expired."
                        );
                    }
                },
                error: function (xhr, status, error) {
                    $("#verify-token").css("opacity", "1");
                    $("#loading_token").css("display", "none");
                    $("#error_token").text("Server error: " + error);
                },
            });
        });
    });

    $("#resend-token-link").click(function (event) {
        event.preventDefault();
        const email = $("#email_reset").val();
        $("#loading_email_send_token").css("display", "block");
        $("#verify-token").css("opacity", "0");
        $("#loading_token").css("display", "block");
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/SendTokenServlet",
            data: { email: email },
            success: function (response) {
                $("#loading_email_send_token").css("display", "none");
                $("#token").val("");
                $("#verify-token").css("opacity", "1");
                $("#loading_token").css("display", "none");
                $("#error_token").css("color", "green");
                $("#error_token").text("Token resend successfully.");
                console.log("response", response);

                $('#countdown').css("display", "block");

                $('#resend-token-link').css("display", "none");
                $('#countdown-seconds').val(response.expirationTime);
                // Thời gian hết hạn (ở đây là một timestamp dưới dạng số nguyên, tính bằng milliseconds)
                const expirationTime = $('#countdown-seconds').val(); // Thay bằng giá trị thực tế từ database
                console.log("expirationTime", expirationTime);
                console.log("count",$('#countdown-seconds').val());
                // Chuyển đổi expirationTime từ milliseconds sang giây
                // Kiểm tra nếu expirationTime là null, ẩn phần đếm ngược
                if (expirationTime === null) {
                    document.getElementById('countdown').innerText = 'NUll roi';
                } else {
                    // Nếu không phải null, tiến hành đếm ngược như bình thường
                    const expirationTimeInSeconds = Math.floor(expirationTime / 1000);
                    let countdownInterval;

                    function updateCountdown() {
                        const currentTime = Math.floor(Date.now() / 1000);
                        const timeRemaining = expirationTimeInSeconds - currentTime;

                        if (timeRemaining <= 0) {
                            $('#resend-token-link').css("display", "block");
                            $('#countdown').css("display", "none");
                            clearInterval(countdownInterval);
                        } else {
                            const hours = Math.floor(timeRemaining / 3600);
                            const minutes = Math.floor((timeRemaining % 3600) / 60);
                            const seconds = timeRemaining % 60;
                            document.getElementById('countdown').innerText = `Remaining time for the next token deposit: \${hours} h \${minutes} m \${seconds} s`;
                        }
                    }

                    countdownInterval = setInterval(updateCountdown, 1000);
                    updateCountdown();
                }
            },
            error: function (xhr, status, error) {
                $("#verify-token").css("opacity", "1");
                $("#loading_token").css("display", "none");
                $("#loading_email_send_token").css("display", "none");
                console.error("Error resending token:", error);
                // Optionally show an error message
            },
        });
    });
</script>
<script>
    function togglePasswordVisibility(inputId) {
        var input = document.getElementById(inputId);
        var icon = document.getElementById("toggle-" + inputId);

        if (input.type === "password") {
            input.type = "text";
            icon.classList.remove("bi-eye-fill");
            icon.classList.add("bi-eye-slash");
        } else {
            input.type = "password";
            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye-fill");
        }
    }
</script>
<script>


    function checkNewPassword(newPassword) {
        let errorMessages = [

            { message: 'Missing at least one digit.', resolved: false },
            { message: 'Missing at least one lower case letter.', resolved: false },
            { message: 'Missing at least one capital letter.', resolved: false },
            { message: 'Missing at least one special character.', resolved: false },
            { message: 'Contains whitespace.', resolved: false },
            { message: 'The length must be between 8 and 20 characters.', resolved: false }
        ];

        if (newPassword.trim() !== '') {
            if (/[0-9]/.test(newPassword)) {
                errorMessages[0].resolved = true;
            }
            if (/[a-z]/.test(newPassword)) {
                errorMessages[1].resolved = true;
            }
            if (/[A-Z]/.test(newPassword)) {
                errorMessages[2].resolved = true;
            }
            if (/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(newPassword)) {
                errorMessages[3].resolved = true;
            }
            if (!/\s/.test(newPassword)) {
                errorMessages[4].resolved = true;
            }
            if (newPassword.length >= 8 && newPassword.length <= 20) {
                errorMessages[5].resolved = true;
            }
        }

        return errorMessages;
    }

    function checkConfirmPassword(newPassword, confirmPassword) {

        return newPassword === confirmPassword;
    }


    document.addEventListener('DOMContentLoaded', function () {
        const newPasswordInput = document.getElementById('new-password');
        const confirmPasswordInput = document.getElementById('confirm-password');
        const errorNewPassword = document.getElementById('error_new_password');
        const errorConfirmPassword = document.getElementById('error_confirm_password');
        const resetPasswordButton = document.getElementById('reset-password');

        const checkAllDone = () => {
            const newErrorMessages = checkNewPassword(newPasswordInput.value);
            const isConfirmPasswordValid = checkConfirmPassword(newPasswordInput.value, confirmPasswordInput.value);
            return newErrorMessages.every(error => error.resolved) && isConfirmPasswordValid
        }

        function validateForm() {
            const newPasswordValue = newPasswordInput.value;
            const confirmPasswordValue = confirmPasswordInput.value;
            const newErrorMessages = checkNewPassword(newPasswordValue);

            errorNewPassword.innerHTML = newErrorMessages.map(error => error.resolved ? `<span class="success-message">\${error.message}</span>` : `<span class="error-message">\${error.message}</span>`).join('<br>');

            const isNewPasswordValid = newErrorMessages.every(error => error.resolved);
            const isConfirmPasswordValid = checkConfirmPassword(newPasswordValue, confirmPasswordValue);

            errorConfirmPassword.innerHTML = isNewPasswordValid && isConfirmPasswordValid ? '' : 'Password do not match';
            errorConfirmPassword.className = isNewPasswordValid && isConfirmPasswordValid ? 'success-message' : 'error-message';
        }

        resetPasswordButton.addEventListener('click', function () {
            validateForm();
        });

        newPasswordInput.addEventListener('input', validateForm);
        confirmPasswordInput.addEventListener('input', validateForm);

        // Kích hoạt validate ngay từ khi tải trang
        validateForm();


            $(document).ready(function () {
            $("#new-password-form").submit(function (event) {
                event.preventDefault();
                event.stopPropagation();

                const newPassword = $("#new-password").val();
                const confirmPassword = $("#confirm-password").val();
                const emailToChange = $("#email_to_change").val();


                const check = checkAllDone();
                console.log(check);
                if (!check) {
                    $("#error_password").text("Please check your password");
                    return;
                }

                const formData = {
                    newPassword: newPassword,
                    email_to_change: emailToChange,
                };
                $("#reset-password").css("opacity", "0");
                $("#reset-password").css("pointer-events", "none");

                $("#loading_email_new_password").css("display", "block");
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/ChangePasswordServlet",
                    data: formData,
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            $("#new-password").val("");
                            $("#confirm-password").val("");
                            $("#email_to_change").val("");

                            setTimeout(function () {
                                $("#error_password").css("color", "green");
                                $("#error_password").text(
                                    "Password change successfully"
                                );
                            }, 500);
                            setTimeout(function () {
                                formPopup.classList.remove(
                                    "show-reset-password"
                                );
                                $("#loading_email_new_password").css(
                                    "display",
                                    "none"
                                );
                                $("#reset-password").css("opacity", "1");
                                $("#reset-password").css(
                                    "pointer-events",
                                    "auto"
                                );
                            }, 2000);
                        } else {
                            $("#error_password").text(
                                response.error || "An unknown error."
                            );
                        }
                    },
                    error: function (xhr, status, error) {
                        $("#loading_resetPassword").css("display", "none");
                        $("#reset-password").css("opacity", "1");
                        $("#reset-password").css("pointer-events", "auto");
                        $("#error_password").text("Server error: " + error);
                    },
                });
            });
        });

});
</script>
</body>
</html>
