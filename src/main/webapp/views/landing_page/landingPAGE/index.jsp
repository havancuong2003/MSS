<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>ECOURSES - Online Courses HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="Free HTML Templates" name="keywords" />
    <meta content="Free HTML Templates" name="description" />
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

<div class="container-fluid d-none d-lg-block">
    <div class="row align-items-center py-4 px-xl-5">
        <div class="col-lg-3">
            <a href="" class="text-decoration-none">
                <h1 class="m-0">
                    <span class="text-primary">E</span>COURSES
                </h1>
            </a>
        </div>
        <div class="col-lg-3 text-right">
            <div class="d-inline-flex align-items-center">
                <i
                        class="fa fa-2x fa-map-marker-alt text-primary mr-3"
                ></i>
                <div class="text-left">
                    <h6 class="font-weight-semi-bold mb-1">
                        Our Office
                    </h6>
                    <small>123 Street, New York, USA</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 text-right">
            <div class="d-inline-flex align-items-center">
                <i class="fa fa-2x fa-envelope text-primary mr-3"></i>
                <div class="text-left">
                    <h6 class="font-weight-semi-bold mb-1">Email Us</h6>
                    <small>info@example.com</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 text-right">
            <div class="d-inline-flex align-items-center">
                <i class="fa fa-2x fa-phone text-primary mr-3"></i>
                <div class="text-left">
                    <h6 class="font-weight-semi-bold mb-1">Call Us</h6>
                    <small>+012 345 6789</small>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a
                    class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none"
                    data-toggle="collapse"
                    href="#navbar-vertical"
                    style="height: 67px; padding: 0 30px"
            >
                <h5 class="text-primary m-0">
                    <i class="fa fa-book-open mr-2"></i>Subjects
                </h5>
                <i class="fa fa-angle-down text-primary"></i>
            </a>
            <nav
                    class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light"
                    id="navbar-vertical"
                    style="width: calc(100% - 30px); z-index: 9"
            >
                <div class="navbar-nav w-100">
                    <div class="nav-item dropdown">
                        <a
                                href="#"
                                class="nav-link"
                                data-toggle="dropdown"
                        >Web Design
                            <i
                                    class="fa fa-angle-down float-right mt-1"
                            ></i
                            ></a>
                        <div
                                class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0"
                        >
                            <a href="" class="dropdown-item">HTML</a>
                            <a href="" class="dropdown-item">CSS</a>
                            <a href="" class="dropdown-item">jQuery</a>
                        </div>
                    </div>
                    <a href="" class="nav-item nav-link">Apps Design</a>
                    <a href="" class="nav-item nav-link">Marketing</a>
                    <a href="" class="nav-item nav-link">Research</a>
                    <a href="" class="nav-item nav-link">SEO</a>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav
                    class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0"
            >
                <a
                        href=""
                        class="text-decoration-none d-block d-lg-none"
                >
                    <h1 class="m-0">
                        <span class="text-primary">E</span>COURSES
                    </h1>
                </a>
                <button
                        type="button"
                        class="navbar-toggler"
                        data-toggle="collapse"
                        data-target="#navbarCollapse"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div
                        class="collapse navbar-collapse justify-content-between"
                        id="navbarCollapse"
                >
                    <div class="navbar-nav py-0">
                        <a
                                href="index.jsp"
                                class="nav-item nav-link active"
                        >Home</a
                        >
                        <a href="about.jsp" class="nav-item nav-link"
                        >About</a
                        >
                        <a href="course.jsp" class="nav-item nav-link"
                        >Courses</a
                        >
                        <a href="teacher.jsp" class="nav-item nav-link"
                        >Teachers</a
                        >
                        <div class="nav-item dropdown">
                            <a
                                    href="#"
                                    class="nav-link dropdown-toggle"
                                    data-toggle="dropdown"
                            >Blog</a
                            >
                            <div class="dropdown-menu rounded-0 m-0">
                                <a
                                        href="blog.jsp"
                                        class="dropdown-item"
                                >Blog List</a
                                >
                                <a
                                        href="single.jsp"
                                        class="dropdown-item"
                                >Blog Detail</a
                                >
                            </div>
                        </div>
                        <a href="contact.jsp" class="nav-item nav-link"
                        >Contact</a
                        >
                    </div>
                    <!-- <a
                        class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block"
                        href=""
                        >Join Now</a
                    > -->
                    <button
                            class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block login-btn"
                    >
                        LOG IN
                    </button>
                </div>
            </nav>
        </div>
    </div>
</div>
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
                    <jsp:include page="load.jsp" />
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
                <div id="loading_token" style="display: none">
                    <jsp:include page="load.jsp" />
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
                <div id="loading_resetPassword" style="display: none">
                    <jsp:include page="load.jsp" />
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

<!-- Carousel Start -->
<div class="container-fluid p-0 pb-5 mb-5">
    <div
            id="header-carousel"
            class="carousel slide carousel-fade"
            data-ride="carousel"
    >
        <ol class="carousel-indicators">
            <li
                    data-target="#header-carousel"
                    data-slide-to="0"
                    class="active"
            ></li>
            <li data-target="#header-carousel" data-slide-to="1"></li>
            <li data-target="#header-carousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active" style="min-height: 300px">
                <img
                        class="position-relative w-100"
                        src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/carousel-1.jpg"
                        style="min-height: 300px; object-fit: cover"

                />
                <div
                        class="carousel-caption d-flex align-items-center justify-content-center"
                >
                    <div
                            class="p-5"
                            style="width: 100%; max-width: 900px"
                    >
                        <h5 class="text-white text-uppercase mb-md-3">
                            Best Online Courses
                        </h5>
                        <h1 class="display-3 text-white mb-md-4">
                            Best Education From Your Home
                        </h1>
                        <a
                                href=""
                                class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2"
                        >Learn More</a
                        >
                    </div>
                </div>
            </div>
            <div class="carousel-item" style="min-height: 300px">
                <img
                        class="position-relative w-100"
                        src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/carousel-2.jpg"
                        style="min-height: 300px; object-fit: cover"
                />
                <div
                        class="carousel-caption d-flex align-items-center justify-content-center"
                >
                    <div
                            class="p-5"
                            style="width: 100%; max-width: 900px"
                    >
                        <h5 class="text-white text-uppercase mb-md-3">
                            Best Online Courses
                        </h5>
                        <h1 class="display-3 text-white mb-md-4">
                            Best Online Learning Platform
                        </h1>
                        <a
                                href=""
                                class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2"
                        >Learn More</a
                        >
                    </div>
                </div>
            </div>
            <div class="carousel-item" style="min-height: 300px">
                <img
                        class="position-relative w-100"
                        src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/carousel-3.jpg"
                        style="min-height: 300px; object-fit: cover"
                />
                <div
                        class="carousel-caption d-flex align-items-center justify-content-center"
                >
                    <div
                            class="p-5"
                            style="width: 100%; max-width: 900px"
                    >
                        <h5 class="text-white text-uppercase mb-md-3">
                            Best Online Courses
                        </h5>
                        <h1 class="display-3 text-white mb-md-4">
                            New Way To Learn From Home
                        </h1>
                        <a
                                href=""
                                class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2"
                        >Learn More</a
                        >
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Carousel End -->

<!-- About Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-lg-5">
                <img
                        class="img-fluid rounded mb-4 mb-lg-0"
                        src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/about.jpg"
                        alt=""
                />
            </div>
            <div class="col-lg-7">
                <div class="text-left mb-4">
                    <h5
                            class="text-primary text-uppercase mb-3"
                            style="letter-spacing: 5px"
                    >
                        About Us
                    </h5>
                    <h1>Innovative Way To Learn</h1>
                </div>
                <p>
                    Aliquyam accusam clita nonumy ipsum sit sea clita
                    ipsum clita, ipsum dolores amet voluptua duo dolores
                    et sit ipsum rebum, sadipscing et erat eirmod diam
                    kasd labore clita est. Diam sanctus gubergren sit
                    rebum clita amet, sea est sea vero sed et.
                    Sadipscing labore tempor at sit dolor clita
                    consetetur diam. Diam ut diam tempor no et, lorem
                    dolore invidunt no nonumy stet ea labore, dolor
                    justo et sit gubergren diam sed sed no ipsum. Sit
                    tempor ut nonumy elitr dolores justo aliquyam ipsum
                    stet
                </p>
                <a
                        href=""
                        class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2"
                >Learn More</a
                >
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<!-- Category Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-5">
            <h5
                    class="text-primary text-uppercase mb-3"
                    style="letter-spacing: 5px"
            >
                Subjects
            </h5>
            <h1>Explore Top Subjects</h1>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-1.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Web Design
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-2.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Development
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-3.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Game Design
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-4.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Apps Design
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-5.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Marketing
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-6.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Research
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-7.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            Content Writing
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div
                        class="cat-item position-relative overflow-hidden rounded mb-2"
                >
                    <img class="img-fluid" src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/cat-8.jpg" alt="" />
                    <a
                            class="cat-overlay text-white text-decoration-none"
                            href=""
                    >
                        <h4 class="text-white font-weight-medium">
                            SEO
                        </h4>
                        <span>100 Courses</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Category Start -->

<!-- Courses Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h5
                    class="text-primary text-uppercase mb-3"
                    style="letter-spacing: 5px"
            >
                Courses
            </h5>
            <h1>Our Popular Courses</h1>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/course-1.jpg"
                            alt=""
                    />
                    <div class="bg-secondary p-4">
                        <div
                                class="d-flex justify-content-between mb-3"
                        >
                            <small class="m-0"
                            ><i
                                    class="fa fa-users text-primary mr-2"
                            ></i
                            >25 Students</small
                            >
                            <small class="m-0"
                            ><i
                                    class="far fa-clock text-primary mr-2"
                            ></i
                            >01h 30m</small
                            >
                        </div>
                        <a class="h5" href=""
                        >Web design & development courses for
                            beginner</a
                        >
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0">
                                    <i
                                            class="fa fa-star text-primary mr-2"
                                    ></i
                                    >4.5 <small>(250)</small>
                                </h6>
                                <h5 class="m-0">$99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/course-2.jpg"
                            alt=""
                    />
                    <div class="bg-secondary p-4">
                        <div
                                class="d-flex justify-content-between mb-3"
                        >
                            <small class="m-0"
                            ><i
                                    class="fa fa-users text-primary mr-2"
                            ></i
                            >25 Students</small
                            >
                            <small class="m-0"
                            ><i
                                    class="far fa-clock text-primary mr-2"
                            ></i
                            >01h 30m</small
                            >
                        </div>
                        <a class="h5" href=""
                        >Web design & development courses for
                            beginner</a
                        >
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0">
                                    <i
                                            class="fa fa-star text-primary mr-2"
                                    ></i
                                    >4.5 <small>(250)</small>
                                </h6>
                                <h5 class="m-0">$99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/course-3.jpg"
                            alt=""
                    />
                    <div class="bg-secondary p-4">
                        <div
                                class="d-flex justify-content-between mb-3"
                        >
                            <small class="m-0"
                            ><i
                                    class="fa fa-users text-primary mr-2"
                            ></i
                            >25 Students</small
                            >
                            <small class="m-0"
                            ><i
                                    class="far fa-clock text-primary mr-2"
                            ></i
                            >01h 30m</small
                            >
                        </div>
                        <a class="h5" href=""
                        >Web design & development courses for
                            beginner</a
                        >
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0">
                                    <i
                                            class="fa fa-star text-primary mr-2"
                                    ></i
                                    >4.5 <small>(250)</small>
                                </h6>
                                <h5 class="m-0">$99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/course-4.jpg"
                            alt=""
                    />
                    <div class="bg-secondary p-4">
                        <div
                                class="d-flex justify-content-between mb-3"
                        >
                            <small class="m-0"
                            ><i
                                    class="fa fa-users text-primary mr-2"
                            ></i
                            >25 Students</small
                            >
                            <small class="m-0"
                            ><i
                                    class="far fa-clock text-primary mr-2"
                            ></i
                            >01h 30m</small
                            >
                        </div>
                        <a class="h5" href=""
                        >Web design & development courses for
                            beginner</a
                        >
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0">
                                    <i
                                            class="fa fa-star text-primary mr-2"
                                    ></i
                                    >4.5 <small>(250)</small>
                                </h6>
                                <h5 class="m-0">$99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/course-5.jpg"
                            alt=""
                    />
                    <div class="bg-secondary p-4">
                        <div
                                class="d-flex justify-content-between mb-3"
                        >
                            <small class="m-0"
                            ><i
                                    class="fa fa-users text-primary mr-2"
                            ></i
                            >25 Students</small
                            >
                            <small class="m-0"
                            ><i
                                    class="far fa-clock text-primary mr-2"
                            ></i
                            >01h 30m</small
                            >
                        </div>
                        <a class="h5" href=""
                        >Web design & development courses for
                            beginner</a
                        >
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0">
                                    <i
                                            class="fa fa-star text-primary mr-2"
                                    ></i
                                    >4.5 <small>(250)</small>
                                </h6>
                                <h5 class="m-0">$99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/course-6.jpg"
                            alt=""
                    />
                    <div class="bg-secondary p-4">
                        <div
                                class="d-flex justify-content-between mb-3"
                        >
                            <small class="m-0"
                            ><i
                                    class="fa fa-users text-primary mr-2"
                            ></i
                            >25 Students</small
                            >
                            <small class="m-0"
                            ><i
                                    class="far fa-clock text-primary mr-2"
                            ></i
                            >01h 30m</small
                            >
                        </div>
                        <a class="h5" href=""
                        >Web design & development courses for
                            beginner</a
                        >
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0">
                                    <i
                                            class="fa fa-star text-primary mr-2"
                                    ></i
                                    >4.5 <small>(250)</small>
                                </h6>
                                <h5 class="m-0">$99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Courses End -->

<!-- Registration Start -->
<div
        class="container-fluid bg-registration py-5"
        style="margin: 90px 0"
>
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-lg-7 mb-5 mb-lg-0">
                <div class="mb-4">
                    <h5
                            class="text-primary text-uppercase mb-3"
                            style="letter-spacing: 5px"
                    >
                        Need Any Courses
                    </h5>
                    <h1 class="text-white">30% Off For New Students</h1>
                </div>
                <p class="text-white">
                    Invidunt lorem justo sanctus clita. Erat lorem
                    labore ea, justo dolor lorem ipsum ut sed eos, ipsum
                    et dolor kasd sit ea justo. Erat justo sed sed diam.
                    Ea et erat ut sed diam sea ipsum est dolor
                </p>
                <ul class="list-inline text-white m-0">
                    <li class="py-2">
                        <i class="fa fa-check text-primary mr-3"></i
                        >Labore eos amet dolor amet diam
                    </li>
                    <li class="py-2">
                        <i class="fa fa-check text-primary mr-3"></i
                        >Etsea et sit dolor amet ipsum
                    </li>
                    <li class="py-2">
                        <i class="fa fa-check text-primary mr-3"></i
                        >Diam dolor diam elitripsum vero.
                    </li>
                </ul>
            </div>
            <div class="col-lg-5">
                <div class="card border-0">
                    <div class="card-header bg-light text-center p-4">
                        <h1 class="m-0">Sign Up Now</h1>
                    </div>
                    <div
                            class="card-body rounded-bottom bg-primary p-5"
                    >
                        <form>
                            <div class="form-group">
                                <input
                                        type="text"
                                        class="form-control border-0 p-4"
                                        placeholder="Your name"
                                        required="required"
                                />
                            </div>
                            <div class="form-group">
                                <input
                                        type="email"
                                        class="form-control border-0 p-4"
                                        placeholder="Your email"
                                        required="required"
                                />
                            </div>
                            <div class="form-group">
                                <select
                                        class="custom-select border-0 px-4"
                                        style="height: 47px"
                                >
                                    <option selected>
                                        Select a course
                                    </option>
                                    <option value="1">Course 1</option>
                                    <option value="2">Course 1</option>
                                    <option value="3">Course 1</option>
                                </select>
                            </div>
                            <div>
                                <button
                                        class="btn btn-dark btn-block border-0 py-3"
                                        type="submit"
                                >
                                    Sign Up Now
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Registration End -->

<!-- Team Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-5">
            <h5
                    class="text-primary text-uppercase mb-3"
                    style="letter-spacing: 5px"
            >
                Teachers
            </h5>
            <h1>Meet Our Teachers</h1>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3 text-center team mb-4">
                <div class="team-item rounded overflow-hidden mb-2">
                    <div class="team-img position-relative">
                        <img
                                class="img-fluid"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/team-1.jpg"
                                alt=""
                        />
                        <div class="team-social">
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-twitter"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-facebook-f"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-linkedin-in"></i
                            ></a>
                        </div>
                    </div>
                    <div class="bg-secondary p-4">
                        <h5>Jhon Doe</h5>
                        <p class="m-0">Web Designer</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 text-center team mb-4">
                <div class="team-item rounded overflow-hidden mb-2">
                    <div class="team-img position-relative">
                        <img
                                class="img-fluid"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/team-2.jpg"
                                alt=""
                        />
                        <div class="team-social">
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-twitter"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-facebook-f"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-linkedin-in"></i
                            ></a>
                        </div>
                    </div>
                    <div class="bg-secondary p-4">
                        <h5>Jhon Doe</h5>
                        <p class="m-0">Web Designer</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 text-center team mb-4">
                <div class="team-item rounded overflow-hidden mb-2">
                    <div class="team-img position-relative">
                        <img
                                class="img-fluid"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/team-3.jpg"
                                alt=""
                        />
                        <div class="team-social">
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-twitter"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-facebook-f"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-linkedin-in"></i
                            ></a>
                        </div>
                    </div>
                    <div class="bg-secondary p-4">
                        <h5>Jhon Doe</h5>
                        <p class="m-0">Web Designer</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 text-center team mb-4">
                <div class="team-item rounded overflow-hidden mb-2">
                    <div class="team-img position-relative">
                        <img
                                class="img-fluid"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/team-4.jpg"
                                alt=""
                        />
                        <div class="team-social">
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-twitter"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-facebook-f"></i
                            ></a>
                            <a
                                    class="btn btn-outline-light btn-square mx-1"
                                    href="#"
                            ><i class="fab fa-linkedin-in"></i
                            ></a>
                        </div>
                    </div>
                    <div class="bg-secondary p-4">
                        <h5>Jhon Doe</h5>
                        <p class="m-0">Web Designer</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Team End -->

<!-- Testimonial Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h5
                    class="text-primary text-uppercase mb-3"
                    style="letter-spacing: 5px"
            >
                Testimonial
            </h5>
            <h1>What Say Our Students</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="owl-carousel testimonial-carousel">
                    <div class="text-center">
                        <i
                                class="fa fa-3x fa-quote-left text-primary mb-4"
                        ></i>
                        <h4 class="font-weight-normal mb-4">
                            Dolor eirmod diam stet kasd sed. Aliqu rebum
                            est eos. Rebum elitr dolore et eos labore,
                            stet justo sed est sed. Diam sed sed dolor
                            stet amet eirmod eos labore diam
                        </h4>
                        <img
                                class="img-fluid mx-auto mb-3"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/testimonial-1.jpg"
                                alt=""
                        />
                        <h5 class="m-0">Client Name</h5>
                        <span>Profession</span>
                    </div>
                    <div class="text-center">
                        <i
                                class="fa fa-3x fa-quote-left text-primary mb-4"
                        ></i>
                        <h4 class="font-weight-normal mb-4">
                            Dolor eirmod diam stet kasd sed. Aliqu rebum
                            est eos. Rebum elitr dolore et eos labore,
                            stet justo sed est sed. Diam sed sed dolor
                            stet amet eirmod eos labore diam
                        </h4>
                        <img
                                class="img-fluid mx-auto mb-3"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/testimonial-2.jpg"
                                alt=""
                        />
                        <h5 class="m-0">Client Name</h5>
                        <span>Profession</span>
                    </div>
                    <div class="text-center">
                        <i
                                class="fa fa-3x fa-quote-left text-primary mb-4"
                        ></i>
                        <h4 class="font-weight-normal mb-4">
                            Dolor eirmod diam stet kasd sed. Aliqu rebum
                            est eos. Rebum elitr dolore et eos labore,
                            stet justo sed est sed. Diam sed sed dolor
                            stet amet eirmod eos labore diam
                        </h4>
                        <img
                                class="img-fluid mx-auto mb-3"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/testimonial-3.jpg"
                                alt=""
                        />
                        <h5 class="m-0">Client Name</h5>
                        <span>Profession</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial End -->

<!-- Blog Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-5">
            <h5
                    class="text-primary text-uppercase mb-3"
                    style="letter-spacing: 5px"
            >
                Our Blog
            </h5>
            <h1>Latest From Our Blog</h1>
        </div>
        <div class="row pb-3">
            <div class="col-lg-4 mb-4">
                <div
                        class="blog-item position-relative overflow-hidden rounded mb-2"
                >
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/blog-1.jpg"
                            alt=""
                    />
                    <a
                            class="blog-overlay text-decoration-none"
                            href=""
                    >
                        <h5 class="text-white mb-3">
                            Lorem elitr magna stet eirmod labore amet
                            labore clita at ut clita
                        </h5>
                        <p class="text-primary m-0">Jan 01, 2050</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div
                        class="blog-item position-relative overflow-hidden rounded mb-2"
                >
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/blog-2.jpg"
                            alt=""
                    />
                    <a
                            class="blog-overlay text-decoration-none"
                            href=""
                    >
                        <h5 class="text-white mb-3">
                            Lorem elitr magna stet eirmod labore amet
                            labore clita at ut clita
                        </h5>
                        <p class="text-primary m-0">Jan 01, 2050</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div
                        class="blog-item position-relative overflow-hidden rounded mb-2"
                >
                    <img
                            class="img-fluid"
                            src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/blog-3.jpg"
                            alt=""
                    />
                    <a
                            class="blog-overlay text-decoration-none"
                            href=""
                    >
                        <h5 class="text-white mb-3">
                            Lorem elitr magna stet eirmod labore amet
                            labore clita at ut clita
                        </h5>
                        <p class="text-primary m-0">Jan 01, 2050</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog End -->

<!-- Footer Start -->
<div
        class="container-fluid bg-dark text-white py-5 px-sm-3 px-lg-5"
        style="margin-top: 90px"
>
    <div class="row pt-5">
        <div class="col-lg-7 col-md-12">
            <div class="row">
                <div class="col-md-6 mb-5">
                    <h5
                            class="text-primary text-uppercase mb-4"
                            style="letter-spacing: 5px"
                    >
                        Get In Touch
                    </h5>
                    <p>
                        <i class="fa fa-map-marker-alt mr-2"></i>123
                        Street, New York, USA
                    </p>
                    <p>
                        <i class="fa fa-phone-alt mr-2"></i>+012 345
                        67890
                    </p>
                    <p>
                        <i class="fa fa-envelope mr-2"></i
                        >info@example.com
                    </p>
                    <div class="d-flex justify-content-start mt-4">
                        <a
                                class="btn btn-outline-light btn-square mr-2"
                                href="#"
                        ><i class="fab fa-twitter"></i
                        ></a>
                        <a
                                class="btn btn-outline-light btn-square mr-2"
                                href="#"
                        ><i class="fab fa-facebook-f"></i
                        ></a>
                        <a
                                class="btn btn-outline-light btn-square mr-2"
                                href="#"
                        ><i class="fab fa-linkedin-in"></i
                        ></a>
                        <a
                                class="btn btn-outline-light btn-square"
                                href="#"
                        ><i class="fab fa-instagram"></i
                        ></a>
                    </div>
                </div>
                <div class="col-md-6 mb-5">
                    <h5
                            class="text-primary text-uppercase mb-4"
                            style="letter-spacing: 5px"
                    >
                        Our Courses
                    </h5>
                    <div
                            class="d-flex flex-column justify-content-start"
                    >
                        <a class="text-white mb-2" href="#"
                        ><i class="fa fa-angle-right mr-2"></i>Web
                            Design</a
                        >
                        <a class="text-white mb-2" href="#"
                        ><i class="fa fa-angle-right mr-2"></i>Apps
                            Design</a
                        >
                        <a class="text-white mb-2" href="#"
                        ><i class="fa fa-angle-right mr-2"></i
                        >Marketing</a
                        >
                        <a class="text-white mb-2" href="#"
                        ><i class="fa fa-angle-right mr-2"></i
                        >Research</a
                        >
                        <a class="text-white" href="#"
                        ><i class="fa fa-angle-right mr-2"></i
                        >SEO</a
                        >
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-5 col-md-12 mb-5">
            <h5
                    class="text-primary text-uppercase mb-4"
                    style="letter-spacing: 5px"
            >
                Newsletter
            </h5>
            <p>
                Rebum labore lorem dolores kasd est, et ipsum amet et at
                kasd, ipsum sea tempor magna tempor. Accu kasd sed ea
                duo ipsum. Dolor duo eirmod sea justo no lorem est diam
            </p>
            <div class="w-100">
                <div class="input-group">
                    <input
                            type="text"
                            class="form-control border-light"
                            style="padding: 30px"
                            placeholder="Your Email Address"
                    />
                    <div class="input-group-append">
                        <button class="btn btn-primary px-4">
                            Sign Up
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div
        class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5"
        style="border-color: rgba(256, 256, 256, 0.1) !important"
>
    <div class="row">
        <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
            <p class="m-0 text-white">
                &copy; <a href="#">Domain Name</a>. All Rights Reserved.
                Designed by
                <a href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-lg-6 text-center text-md-right">
            <ul class="nav d-inline-flex">
                <li class="nav-item">
                    <a class="nav-link text-white py-0" href="#"
                    >Privacy</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white py-0" href="#"
                    >Terms</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white py-0" href="#"
                    >FAQs</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white py-0" href="#"
                    >Help</a
                    >
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
><i class="fa fa-angle-double-up"></i
></a>

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
                    window.location.href = "mystudyspace";
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