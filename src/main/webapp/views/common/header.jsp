<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <style>
        .header {
            background-color: #fff;
            box-shadow: none;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }
        .profile-img {
            width: 40px;
            height: 40px;
        }
        .dropdown-menu {
            min-width: 150px;
        }
        nav{
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg header">
    <button class="btn btn-light" onclick="history.back()">
        <i class="fas fa-arrow-left"></i> Home
    </button>
    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Profile
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="setting">Setting</a>
                <a class="dropdown-item" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</nav>

<!-- Include Bootstrap JavaScript and FontAwesome for icons -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
