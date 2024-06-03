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
                <div id="loading_email" style="display: none">
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
                <div id="loading_email" style="display: none">
                    <jsp:include page="landingPAGE/load.jsp" />
                </div>
                <button type="submit" id="verify-token">
                    Verify Token
                </button>
            </form>
            <div class="bottom-link">
                Didn't receive the token?
                <a href="#" id="resend-token-link">Resend Token</a>
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
                <input
                        type="hidden"
                        id="email_to_change"
                        value=""
                        name="email_to_change"
                />
                <div class="input-field">
                    <input
                            type="password"
                            id="new-password"
                            name="new-password"
                            required
                    />
                    <label>New Password</label>
                </div>
                <div class="input-field">
                    <input
                            type="password"
                            id="confirm-password"
                            name="confirm-password"
                            required
                    />
                    <label>Confirm Password</label>
                </div>
                <div id="loading_email" style="display: none">
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

<%--<!-- Contact Javascript File -->--%>
<%--<script src="mail/jqBootstrapValidation.min.js"></script>--%>
<%--<script src="mail/contact.js"></script>--%>

<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    const navbarMenu = document.querySelector(".navbar .links");
    // const hamburgerBtn = document.querySelector(".hamburger-btn");
    //     const hideMenuBtn = navbarMenu.querySelector(".close-btn");
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

    // Show mobile menu
    // hamburgerBtn.addEventListener("click", () => {
    //     navbarMenu.classList.toggle("show-menu");
    // });

    // Hide mobile menu
    //    hideMenuBtn.addEventListener("click", () => hamburgerBtn.click());

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

            $("#loading_email").css("display", "block");

            const formData = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/SendTokenServlet",
                data: formData,
                dataType: "json",
                success: function (response) {
                    console.log("response", response);
                    $("#loading_email").css("display", "none");
                    $("#send-reset-link").css("opacity", "1");
                    $("#send-reset-link").css("pointer-events", "auto");
                    $("#email_reset").val(emailInput);
                    $("#error_email").text("");
                    $("#email").val("");
                    formPopup.classList.remove("show-forgot-password");
                    formPopup.classList.add("show-input-token");
                    formPopup.classList.remove("show-reset-password");
                },
                error: function (xhr, status, error) {
                    $("#loading_email").css("display", "none");
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
        $("#verify-token").css("opacity", "0");
        $("#loading_token").css("display", "block");
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/SendTokenServlet",
            data: { email: email },
            success: function (response) {
                $("#token").val("");
                $("#verify-token").css("opacity", "1");
                $("#loading_token").css("display", "none");
                $("#error_token").css("color", "green");
                $("#error_token").text("Token resend successfully.");
                console.log("response", response);
            },
            error: function (xhr, status, error) {
                $("#verify-token").css("opacity", "1");
                $("#loading_token").css("display", "none");
                console.error("Error resending token:", error);
                // Optionally show an error message
            },
        });
    });
</script>

<script>
    $(document).ready(function () {
        $("#new-password-form").submit(function (event) {
            event.preventDefault();
            event.stopPropagation();

            const newPassword = $("#new-password").val();
            const confirmPassword = $("#confirm-password").val();
            const emailToChange = $("#email_to_change").val();

            if (newPassword !== confirmPassword) {
                $("#error_password").text(
                    "The new password and confirmation password do not match."
                );
                return;
            }

            const formData = {
                newPassword: newPassword,
                email_to_change: emailToChange,
            };
            $("#reset-password").css("opacity", "0");
            $("#reset-password").css("pointer-events", "none");

            $("#loading_resetPassword").css("display", "block");
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
                            $("#loading_resetPassword").css(
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
</script>
</body>
</html>
