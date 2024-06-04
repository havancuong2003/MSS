<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ECOURSES - Online Courses HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>


<jsp:include page="toolbarHeader.jsp" />
<%--    <!-- Navbar Start -->--%>
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                    <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>Subjects</h5>
                    <i class="fa fa-angle-down text-primary"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Web Design <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
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
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0"><span class="text-primary">MY</span>STUDYSPACE</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav py-0">
                            <a href="${pageContext.request.contextPath}/mystudyspace" class="nav-item nav-link">Home</a>
                            <a href="about.jsp" class="nav-item nav-link active">About</a>

                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
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
<%--    <!-- Navbar End -->--%>


    <!-- Header Start -->
    <div class="container-fluid page-header" style="margin-bottom: 90px;">
        <div class="container">
            <div class="d-flex flex-column justify-content-center" style="min-height: 300px">
                <h3 class="display-4 text-white text-uppercase">About</h3>
                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">About</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-5">
                    <img class="img-fluid rounded mb-4 mb-lg-0" src="img/about.jpg" alt="">
                </div>
                <div class="col-lg-7">
                    <div class="text-left mb-4">
                        <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">About Us</h5>
                        <h1>Innovative Way To Learn</h1>
                    </div>
                    <p>Aliquyam accusam clita nonumy ipsum sit sea clita ipsum clita, ipsum dolores amet voluptua duo dolores et sit ipsum rebum, sadipscing et erat eirmod diam kasd labore clita est. Diam sanctus gubergren sit rebum clita amet, sea est sea vero sed et. Sadipscing labore tempor at sit dolor clita consetetur diam. Diam ut diam tempor no et, lorem dolore invidunt no nonumy stet ea labore, dolor justo et sit gubergren diam sed sed no ipsum. Sit tempor ut nonumy elitr dolores justo aliquyam ipsum stet</p>
                    <a href="" class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2">Learn More</a>
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
                                src="${pageContext.request.contextPath}/views/landing_page/landingPAGE/img/testimonial-1.jpg"
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

<jsp:include page="../footer.jsp" />



    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>

<jsp:include page="../popupLogin.jsp"/>
</body>

</html>