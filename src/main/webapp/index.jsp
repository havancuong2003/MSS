<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>My Study Space - Online Learning</title>
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
<h1>${a}</h1>
<div class="container-fluid d-none d-lg-block">
    <div class="row align-items-center py-4 px-xl-5">
        <div class="col-lg-3">
            <a href="" class="text-decoration-none">
                <h1 class="m-0">
                    <span class="text-primary">MY</span>STUDYSPACE
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
                    <small>FPT University Ha Noi</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 text-right">
            <div class="d-inline-flex align-items-center">
                <i class="fa fa-2x fa-envelope text-primary mr-3"></i>
                <div class="text-left">
                    <h6 class="font-weight-semi-bold mb-1">Email Us</h6>
                    <small>mss@fpt.edu.vn</small>
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
                    <i class="fa fa-book-open mr-2"></i>Major
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
                        >Software Engineering

                            </a>

                    </div>
                    <a href="" class="nav-item nav-link">Digital Marketing</a>
                    <a href="" class="nav-item nav-link">Artificial Intelligence</a>

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
                        <span class="text-primary">MY</span>STUDYSPACE
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
                    <div class="navbar-nav nav-header py-0">
                        <a
                                href="${pageContext.request.contextPath}/mystudyspace"
                                class="nav-item nav-link active"
                        >Home</a
                        >
                        <a href="${pageContext.request.contextPath}/views/landing_page/landingPAGE/about.jsp" class="nav-item nav-link"
                        >About</a
                        >


                        <a href="${pageContext.request.contextPath}/views/landing_page/landingPAGE/contact.jsp" class="nav-item nav-link"
                        >Contact</a
                        >
                    </div>

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
                            Best Leanring Platform
                        </h5>
                        <h1 class="display-3 text-white mb-md-4">
                            Best Education Platform
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
                            Best Leanring Platform
                        </h5>
                        <h1 class="display-3 text-white mb-md-4">
                            Best Education Platform
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
                            Best Leanring Platform
                        </h5>
                        <h1 class="display-3 text-white mb-md-4">
                            Best Education Platform
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
                <p>At our institution, we believe in fostering a learning environment that nurtures curiosity and encourages growth. Our innovative approach to education combines traditional teaching methods with modern technology to create a dynamic and interactive learning experience. We are committed to providing our students with the skills and knowledge they need to succeed in an ever-changing world.</p>
                <p>Our programs are designed to be flexible and adaptive, ensuring that each student can learn at their own pace and in their own style. We offer a wide range of courses and resources that cater to different learning preferences and career goals. Whether you are looking to advance in your current career or explore new fields of interest, our comprehensive curriculum has something for everyone.</p>
                <p>We are proud of our diverse and inclusive community where students from all backgrounds can come together to learn and grow. Our dedicated faculty and staff are here to support you every step of the way, providing guidance, mentorship, and encouragement. Join us and discover a new way of learning that is both effective and enjoyable.</p>

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
                            Education is the passport to the future, for tomorrow belongs to those who prepare for it today.
                        </h4>
                        <img
                                class="img-fluid mx-auto mb-3"
                                src="views/landing_page/landingPAGE/img/testimonial-1.jpg"
                                alt=""
                        />
                        <h5 class="m-0">Malcolm X</h5>
                        <span>Profession</span>
                    </div>
                    <div class="text-center">
                        <i
                                class="fa fa-3x fa-quote-left text-primary mb-4"
                        ></i>
                        <h4 class="font-weight-normal mb-4">
                            Education is not the filling of a pail, but the lighting of a fire
                        </h4>
                        <img
                                class="img-fluid mx-auto mb-3"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/testimonial-2.jpg"
                                alt=""
                        />
                        <h5 class="m-0">William Butler Yeats</h5>
                        <span>Profession</span>
                    </div>
                    <div class="text-center">
                        <i
                                class="fa fa-3x fa-quote-left text-primary mb-4"
                        ></i>
                        <h4 class="font-weight-normal mb-4">
                            Education is the foundation of all we do in life. It shapes who we are and what we aspire to be.
                        </h4>
                        <img
                                class="img-fluid mx-auto mb-3"
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/testimonial-3.jpg"
                                alt=""
                        />
                        <h5 class="m-0">Julie Payette</h5>
                        <span>Profession</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial End -->


<jsp:include page="views/landing_page/footer.jsp" />


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
><i class="fa fa-angle-double-up"></i
></a>
<jsp:include page="views/landing_page/popupLogin.jsp" />

</body>
</html>
