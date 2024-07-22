<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Teacher Session</title>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <style>
        /*body {*/
        /*    font-family: 'Arial', sans-serif;*/
        /*    background-color: #f8f9fa;*/
        /*    margin: 0;*/
        /*    padding: 20px;*/
        /*}*/
        /*.container {*/
        /*    background-color: #fff;*/
        /*    padding: 20px;*/
        /*    border-radius: 8px;*/
        /*    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
        /*}*/
        /*h1 {*/
        /*    color: #333;*/
        /*    border-bottom: 2px solid #4CAF50;*/
        /*    padding-bottom: 10px;*/
        /*    margin-bottom: 20px;*/
        /*}*/
        /*.form-group label {*/
        /*    font-weight: bold;*/
        /*}*/
        /*.btn-submit {*/
        /*    background-color: #007bff;*/
        /*    color: #fff;*/
        /*}*/
        /*.btn-submit:hover {*/
        /*    background-color: #0056b3;*/
        /*}*/

        .btn-loading {
            background-color: #6c757d;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Change Teacher Session</h1>
    <form id="changeSessionForm">
        <div class="form-group">
            <label for="currentTeacher">Current Teacher ID:</label>
            <input type="text" id="currentTeacher" name="currentTeacher" class="form-control" placeholder="Enter teacherID" required />
        </div>
        <div class="form-group">
            <label for="targetTeacher">Target Teacher ID:</label>
            <input type="text" id="targetTeacher" name="targetTeacher" class="form-control" placeholder="Enter teacherID" required/>
        </div>
        <div class="form-group">
            <label for="slot">Session Slot:</label>
            <select id="slot" name="slot" class="form-control">
                <option value="1">Slot 1</option>
                <option value="2">Slot 2</option>
                <option value="3">Slot 3</option>
                <option value="4">Slot 4</option>
            </select>
        </div>
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" class="form-control" required />
        </div>
        <div class="form-group">
            <input type="submit" class="btn-submit" value="Submit Request">
        </div>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
 $(document).ready(function() {
     $('#changeSessionForm').on('submit', function(event) {
         event.preventDefault();
         const $submitButton = $('.btn-submit');
         $submitButton.prop('disabled', true).addClass('btn-loading').val('Loading...');

         $.ajax({
             type: 'POST',
             url: '/MyStudySpace_war_exploded/admin/changeSessionTeacher',
             data: $('#changeSessionForm').serialize(),
             success: function(response) {
                 if(response.status == "success") {
                     alert(response.message);
                 } else {
                     alert(response.message);
                 }
             },
             error: function(xhr, status, error) {
                 alert(error);
             },
             complete: function() {
                 $submitButton.prop('disabled', false).removeClass('btn-loading').val('Submit Request');
             }

         });


     })
 })

</script>
</body>
</html>
