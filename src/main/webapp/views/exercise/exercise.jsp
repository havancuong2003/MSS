<%--
  Created by IntelliJ IDEA.
  User: FPT
  Date: 6/13/2024
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DashBoard</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="anime.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table tr th:first-child, .table tr td:first-child {
            width: 10%;
        }

        .table tr th:last-child, .table tr td:last-child {
            width: 15%;
        }

        .table tr th:nth-child(3), .table tr td:nth-child(3) {
            width: 15%;
        }
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        .back .bgimg {
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -1;
            top: 0;
            left: 0;
            object-fit: cover;
        }

        .container-fluid {
            padding-top: 50px;
        }

        .heading {
            color: #333;
            font-size: 2.5rem;
        }

        .btn-danger, .btn-primary {
            font-size: 1.5rem;
            padding: 10px 20px;
            margin: 10px;
        }

        .tbtn {
            width: 100%;
            text-align: center;
        }

        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .thead-dark th {
            background-color: #343a40;
            color: #fff;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .jumbotron {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .text-right.heading {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 10px;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .row1 {
            margin-bottom: 20px;
        }

        .animated {
            transition: all 0.5s ease-in-out;
        }

        .slideInLeft {
            animation: slideInLeft 1s forwards;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .slideInRight {
            animation: slideInRight 1s forwards;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        .modal-dialog {
            max-width: 600px;
            margin: 1.75rem auto;
        }

        .modal-content {
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .card {
            border: none;
            border-radius: 8px;
        }

        .card-header {
            background-color: #343a40;
            color: #fff;
            border-bottom: 2px solid #dee2e6;
            padding: 20px;
            text-align: center;
        }

        .card-header .custom-heading {
            margin: 0;
            font-size: 1.5rem;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: #fff;
        }

        .btn-success.bb:hover {
            background-color: #218838;
            border-color: #1e7e34;
            color: #fff;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .modal-header, .modal-body, .modal-footer {
            padding: 20px;
            border: none;
        }

        .modal-header {
            border-bottom: 1px solid #e9ecef;
        }

        .modal-footer {
            border-top: 1px solid #e9ecef;
            display: flex;
            justify-content: flex-end;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .modal-dialog {
                max-width: 100%;
                margin: 1rem;
            }

            .card-header, .card-body, .form-group, .btn {
                padding: 15px;
            }

            .form-control {
                font-size: 0.9rem;
            }

            .btn {
                font-size: 0.9rem;
                padding: 10px 15px;
            }
        }

    </style>
</head>
<body>
<div class="back">
    <img src="https://mega.com.vn/media/news/2707_background-pp-hoc-tap-lam-slide3.jpg" class="bgimg" type="jpg/jpeg">
</div>

<div class="container-fluid text-center">
    <div class="row1">
        <div class="col-md-12">
            <p class="text-right heading">
                <a class="btn btn-danger" href="Logout"><i
                        class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
            </p>
            <h1 class="heading">Welcome,!</h1>

        </div>
    </div>
    <div class="row" style="margin-top: 15vh">

        <div class="col animated slideInLeft">
            <a class="btn btn-primary tbtn" href="#createQuizModal"
               data-toggle="modal">
                <h1 class="q">
                    <i class="fa fa-plus" aria-hidden="true"></i> Create Quiz
                </h1></a>
        </div>
        <div class="col animated slideInRight">
            <a class="btn btn-danger tbtn" href="#participateModal"
               data-toggle="modal">
                <h1 class="q">
                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                    Participate
                </h1>
            </a>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-12">
            <table class="table table-hover table-light table-borderless"
                   style="width: 60%; margin: 0 auto;'">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Quiz Name</th>
                    <th scope="col">Rating</th>
                    <th scope="col">View</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row"></th>
                    <td></td>
                    <td>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </td>
                    <td><a class="btn btn-info"
                           href="#"><i
                            class="fa fa-eye" aria-hidden="true"></i> View</a></td>
                    <td><a class="btn btn-danger"
                           href="#"><i class="fa fa-trash"
                                       aria-hidden="true"></i> Delete</a></td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="jumbotron"><h2>You haven't created any quiz yet!</h2></div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

<!-- Create Modal HTML -->
<div id="createQuizModal" class="modal fade" style="z-index: 9999;"
     role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="post" action="create-exercise">
                    <div class="card-header">
                        <h2 class="custom-heading">Quiz</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input type="hidden" name="teacher_id" value="${teacher.teacher_id}">
                            <input type="text" name="excercise_name" class="form-control"
                                   placeholder="Quiz Name" required />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Create"
                                   class="btn btn-success bb">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Participate Modal HTML -->
<div id="participateModal" class="modal fade" style="z-index: 9999;"
     role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <form method="get" action="participate.jsp">
                    <div class="card-header">
                        <h2 class="custom-heading">Participate</h2>
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <input type="text" name="id" class="form-control"
                                   placeholder="Quiz ID" required />
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Participate"
                                   class="btn btn-success bb">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</html>
