<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: #f9f9f9; /* Add a light gray background */
        }

        header {
            background-color: #333; /* Dark gray header */
            padding: 10px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1;
            color: #fff; /* White text */
        }

        footer {
            background-color: #333; /* Dark gray footer */
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 1;
            color: #fff; /* White text */
        }

        .container {
            padding: 20px;
            margin-top: 100px; /* Adjust for header height */
            margin-bottom: 60px; /* Adjust for footer height */
            background-color: #fff; /* White background */
            border: 1px solid #ddd; /* Light gray border */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
        }

        .current-term {
            padding: 10px;
            text-align: center;
            width: 100%;
            z-index: 1;
            background-color: #f7f7f7; /* Light gray background */
            border-bottom: 1px solid #ddd; /* Light gray border */
        }

        .set-time {
            padding: 10px;
            text-align: center;
            width: 100%;
            z-index: 1;
            background-color: #f7f7f7; /* Light gray background */
        }

        .form-settime {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="date"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 10px;
        }

        button {
            background-color: #4caf50; /* Green button */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #3e8e41; /* Darker green on hover */
        }

        /* Responsive design */
        @media only screen and (max-width: 768px) {
            header {
                padding: 5px;
            }

            footer {
                padding: 5px;
            }

            .container {
                padding: 10px;
            }
        }

        @media only screen and (max-width: 480px) {
            header {
                font-size: 14px;
            }

            footer {
                font-size: 14px;
            }

            .container {
                font-size: 14px;
            }
        }

        a.back-button {
            background-color: #4CAF50; /* Green background */
            color: #fff; /* White text */
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px; /* Add a rounded corner */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
            text-decoration: none; /* Remove the default underline */

            /* existing styles */
            position: absolute;
            top: 20px;
            left: 50px;
            margin: 10px;

        }

        a.back-button:hover {
            background-color: #3e8e41; /* Darker green on hover */
        }

        a.back-button:active {
            background-color: #3e8e41; /* Darker green on active */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Add a deeper shadow on active */
        }
    </style>
</head>
<body>
<header>
    <a class="back-button" href="dashboard">Back</a>
    <h1>Header</h1>
</header>

<div class="container">
    <div class="current-term">
        <h2>Current term: ${semester.detail}</h2>
        <p>SU24 from ${semester.start} to ${semester.end}</p>
    </div>

    <div class="set-time">
        <h2>
            Set time for students to register for courses for the next
            semester: ${nextSemester.detail}
        </h2>
        <p>${nextSemester.detail} start from ${nextSemester.start} to ${nextSemester.end}</p>

        <form id="myForm">

            <input type="hidden" name="description"
                   value="${requestScope.timePeriods == "null" ? "" : requestScope.timePeriods.semester.id}">
            <c:choose>
                <c:when test="${requestScope.timePeriods == 'null'}">
                    <h1 style="color: red">${requestScope.status}</h1>
                    <a href="registerTime" ><button type="button">Go set time register</button></a>
                </c:when>
                <c:when test="${requestScope.timePeriods != 'null'}">
                    <c:choose>
                        <c:when test="${requestScope.add == true}">
                         <div style="display: flex; justify-content: center; align-items: center">
                           <div style="width: fit-content;border: 3px solid black;border-radius: 10px">
                               <h2 style="color: red">Notice</h2>
                               <h3><i style="color:red">Start date</i> must be after <i style="color:red">end of register time</i>  and
                                   <i style="color:red">end date  </i>  must before <i style="color:red">end date of semester</i></h3>
                               <h3>Time register course end at: ${timePeriods.endRegister}</h3> <h3>Time Semester end at: ${semester.end}</h3>
                           </div>
                         </div>
                            <h4 id="error" style="color: red"></h4>
                            <c:choose>
                                <c:when test="${timePeriods.startChangeClass == null}">
                                    <label for="startDate">Change class time from: </label> <input type="date"
                                                                                                   id="startDate"
                                                                                                   name="startDate"/>
                                    <label for="endDate" style="margin-top: 20px"
                                    >To:</label
                                    > <input type="date" id="endDate" name="endDate"/>
                                </c:when>
                                <c:otherwise>
                                    <label for="startDate">
                                        Update Time Change Class from:
                                    </label> <input type="date" id="startDate" name="startDate"
                                                    value="${timePeriods.startChangeClass}"/> <label for="endDate"
                                                                                                     style="margin-top: 20px"
                                >To:</label
                                > <input type="date" id="endDate" name="endDate" value="${timePeriods.endChangeClass}"/>
                                </c:otherwise>
                            </c:choose>
                            <br/>
                            <button id="btn" type="submit" style="margin-top: 20px">
                                Save
                            </button>
                        </c:when>
                        <c:otherwise>
                            <h1 style="color: red">${requestScope.status}</h1>
                            <a href="registerTime" ><button type="button">Go set time register</button></a>
                        </c:otherwise>
                    </c:choose>


                </c:when>
            </c:choose>


        </form>
    </div>
</div>
<footer>
    <p>Footer</p>
</footer>
<script>
    $(document).ready(function () {
        $("#myForm").submit(function (event) {
            event.preventDefault(); // Prevent default form submission

            const startDate = $("#startDate").val();
            const endDate = $("#endDate").val();
            const description = $('[name="description"]').val();
            if (startDate === "" || endDate === "") {
                console.log("Start date or end date is empty");
                $("#error")
                    .css("color", "red")
                    .text("Start date or end date is empty");
                return;
            }
            $("#btn").attr("disabled", true).text("Submitting...");
            $.ajax({
                url: "timeChangeClass",
                type: "POST",
                data: {
                    startDate: startDate,
                    endDate: endDate,
                    description: description,
                },
                dataType: "json",
                success: function (response) {
                    console.log("response",response)
                    // Handle success response from backend here
                    $("#error")
                        .css("color", "green")
                        .text(response.res);
                    setTimeout(function () {
                        $("#successMessage").text(""); // Xóa thông báo sau 2 giây
                        $("#btn")
                            .attr("disabled", false)
                            .text("Submit"); // Bật nút Submit trở lại
                        location.reload(); // Reload trang
                    }, 2000); // Đợi 2 giây trước khi thực hiện
                },
                error: function (xhr, status, error) {
                    $("#btn").attr("disabled", false).text("Submit"); // Bật nút Submit trở lại
                    // Handle error response from backend here
                    console.error("Error:", error);
                    console.error("status:", status);
                    console.error("xhr:", xhr);
                    $("#error").text(xhr.responseJSON);
                },
            });
        });
    });
</script>
</body>
</html>

