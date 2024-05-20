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
    <script src="${pageContext.request.contextPath}/views/home/script.js" defer></script>
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
                    <span class="close-btn material-symbols-rounded"
                    >close</span
                    >
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
            <form action="login" method="post">
                <div class="input-field">
                    <input type="text" name="username" required/>
                    <label>UserName</label>
                </div>
                <div class="input-field">
                    <input type="password" required name="password"/>
                    <label>Password</label>
                </div>
                <a href="#" class="forgot-pass-link"
                >Forgot password?</a
                >
                <button type="submit">Log In</button>
            </form>

        </div>
    </div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
    $(document).ready(function(){
        $('form').submit(function(event){
            event.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                type: 'POST',
                url: 'login',
                data: formData,
                dataType: 'json',
                success: function(response){
                   window.location.href = "mystudyspace";
                },
                error: function(xhr, status, error){
                    if (xhr.status === 401) {
                        // Xử lý lỗi đăng nhập
                        var response = JSON.parse(xhr.responseText);
                        $('#error').text(response); // Hiển thị thông báo lỗi trong thẻ <h1>
                    } else {
                        // Xử lý lỗi khác
                        $('#error').text('Error: ' + error); // Hiển thị thông báo lỗi trong thẻ <h1>
                    }
                }
            });
        });
    });


</script>
</body>
</html>
