<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/17/2024
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyStudySpace</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            display: flex;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header img {
            height: 50px;
            margin-right: 20px;
        }

        header span {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            padding-left: 10px;
        }

        form {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        input[type="text"], input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }


        .input-group {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .input-group input[type="text"], .input-group input[type="number"] {
            width: calc(30% - 10px);
            margin-bottom: 10px;
        }

        .input-group input[type="text"] {
            width: calc(33% - 10px);
        }

        button {
            padding: 15px 30px;
            border-radius: 25px;
            cursor: pointer;
            border: 0;
            background-color: #6200ea;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-transform: uppercase;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #3700b3;
        }

        button:active {
            background-color: #6200ea;
            transform: translateY(3px);
        }
        .tag {
            display: inline-block;
            padding: 5px;
            background-color: #e1e1e1;
            border-radius: 3px;
            margin: 5px;
        }
        .tag button {
            background-color: red;
            color: white;
            border: none;
            border-radius: 50%;
            padding: 2px 5px;
            cursor: pointer;
        }
        .header {
            background-color: #fff;
            box-shadow: none;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }

        .dropdown-menu {
            min-width: 150px;
            display: none; /* Ẩn menu dropdown mặc định */
        }
        .dropdown-menu.show {
            display: block; /* Hiện menu khi có lớp 'show' */
        }
        nav {
            margin-bottom: 50px;
        }
        * {
            margin: 0;
            padding: 0;
            color: #000;
        }


        footer {
            width: 100%;
            margin-top: 100px;
        }

        h3 {
            font-size: 25px;
        }

        .footer-container {
            position: relative;
            bottom: 0;
            background: #E8E8E8;
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            padding: 15px 0;
        }

        .left-area ul {
            display: flex;
            justify-content: space-between;
            margin-top: 10px
        }

        .center-area, .right-area, .left-area {
            height: 50%;
            margin-bottom: 10px;
        }


        .center-area a {
            position: relative;
            text-decoration: none;
            color: #333;

        }

        .center-area a::after {
            content: "";

            width: 100%;
            height: 2px;
            left: 0;
            bottom: -5px;
            background-color: #495464;
            border-radius: 40px;
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .center-area a:hover::after {
            transform-origin: center;
            transform: scaleX(1);
        }


        .center-area a, .right-area li {
            font-size: 20px;
            padding: 5px 0;
        }

        .center-area li, .right-area li {
            padding: 5px;
        }

        ul {
            list-style-type: none;
        }

        a {
            text-decoration: none;
        }




        .left-area i:hover {
            color: rgb(205, 127, 50);
            transition: 0.3s;
        }

        @media screen and (max-width: 576px) {
            .footer-container {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }

            h3 {
                font-size: 18px;
            }

            a, li {
                font-size: 14px;
            }

            .center-area a, .right-area li {
                font-size: 18px;
            }

            ul {
                margin-bottom: 14px;
            }
        }
    </style>
    <script>
        var cateCount = 0;

        function addCate() {
            if (cateCount >= 5) {
                alert("You can only add 5 assessment items !");
                return;
            }
            var assCount = 0;
            cateCount++;  // Tăng biến đếm lên mỗi lần hàm được gọi
            var newHr = document.createElement("hr");
            var newDiv = document.createElement("div");
            newDiv.id = "assInput" + cateCount;
            var cateDiv = document.createElement("div");
            cateDiv.style = "display: block";
            // Tạo nhãn mới cho Category
            var cateInputDiv = document.createElement("div");
            var newLabel = document.createElement("label");
            newLabel.innerText = "Name Assessment: ";
            newLabel.className = "abc";
            newLabel.htmlFor = "name";
            // Tạo một thẻ input mới cho Category
            var newInput = document.createElement("input");
            newInput.type = "text";
            newInput.style = "width: 50%";
            newInput.name = "cate" + cateCount;  // Đặt tên cho thẻ input mới
            newInput.required = "";
            newInput.autocomplete = "off";
            cateInputDiv.appendChild(newLabel);
            cateInputDiv.appendChild(newInput);
            // Tạo nút bấm để thêm Assessment
            var cateButtonDiv = document.createElement("div");
            var newButton = document.createElement("button");
            newButton.type = "button";
            newButton.style = "margin-left: 5%";
            newButton.onclick = function () {
                assCount++;
                addAss(cateCount, assCount);
            };
            newButton.innerText = "Add Grade Item";
            cateInputDiv.appendChild(newButton);
            cateDiv.appendChild(cateInputDiv);
            // cateDiv.appendChild(cateButtonDiv);
            // Tạo một thẻ <br> để ngắt dòng sau mỗi input
            var br = document.createElement("br");
            var newHr2 = document.createElement("hr");
            // Tạo một div container cho mỗi Category và các Assessment của nó
            var categoryContainer = document.createElement("div");
            categoryContainer.id = "category" + cateCount;

            // Thêm nhãn, thẻ input, nút bấm và thẻ <br> vào div container
            categoryContainer.appendChild(newHr);
            categoryContainer.appendChild(cateDiv);
            categoryContainer.appendChild(br);
            categoryContainer.appendChild(newDiv);
            categoryContainer.appendChild(newHr2);
            // Thêm div container vào div có id="cateInput"
            var container = document.getElementById("cateInput");
            container.appendChild(categoryContainer);
        }

        function addAss(cateId, assCount) {
            if (assCount >= 10) {
                alert("You can only add 10 grade items for an assessment!");
                return;
            }
            // Tạo nhãn mới cho Assessment
            var newLabel = document.createElement("label");
            newLabel.innerText = "Grade Item: ";
            newLabel.className = "abc";
            newLabel.htmlFor = "input";
            // Tạo một thẻ input mới cho Assessment
            var newInput = document.createElement("input");
            newInput.type = "text";
            newInput.name = "asscate" + cateId;  // Đặt tên cho thẻ input mới
            newInput.required = "";
            newInput.autocomplete = "off";

            var weiLabel = document.createElement("label");
            weiLabel.innerText = "Weight (%): ";
            weiLabel.className = "abc";
            weiLabel.htmlFor = "input";

            var newWeight = document.createElement("input")
            newWeight.type = "number";
            newWeight.name = "weicate" + cateId;
            newWeight.required = "";
            newWeight.autocomplete = "off";

            // Tạo một div container để chứa các thẻ input trong cùng một dòng
            var inputGroup = document.createElement("div");
            inputGroup.className = "input-group";

            // Thêm nhãn, thẻ input vào div container
            inputGroup.appendChild(newLabel);
            inputGroup.appendChild(newInput);
            inputGroup.appendChild(weiLabel);
            inputGroup.appendChild(newWeight);

            // Thêm inputGroup vào div container tương ứng với Category
            var container = document.getElementById("assInput" + cateId);
            container.appendChild(inputGroup);
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg header">
    <button class="btn btn-light" onclick="window.location.href='dashboard';">
        <i class="fas fa-arrow-left"></i> Home
    </button>

    <div class="ml-auto">
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                Profile
            </button>
            <div class="dropdown-menu" id="dropdownMenu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="setting">Setting</a>
                <a class="dropdown-item" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
<script>
    document.getElementById('dropdownMenuButton').addEventListener('click', function () {
        var menu = document.getElementById('dropdownMenu');
        if (menu) {
            menu.classList.toggle('show');
        }
    });

    // Đóng menu nếu nhấp ra ngoài
    document.addEventListener('click', function (event) {
        var menu = document.getElementById('dropdownMenu');
        if (menu && !menu.contains(event.target) && !document.getElementById('dropdownMenuButton').contains(event.target)) {
            menu.classList.remove('show');
        }
    });
</script>
<form action="addCourse" method="POST">
    <p>Code: <input type="text" style="width: calc(92% - 20px); margin-left: 1%" name="code"/></p>
    <p>Name: <input type="text" style="width: calc(95% - 20px);" name="detail"/></p>
    <p>Description: <input type="text" style="width: calc(87% - 20px);" name="description"/></p>
    <p>Credit: <input type="number" style="width: calc(94% - 20px);" name="credit"/></p>
    <p>Prerequisite: <input oninput="searchCourse()" type="text" style="width: calc(87% - 20px);" name="codeCourse"/></p>
    <table>
        <thead>
        <tr>
            <td>Code</td>
            <td>Name</td>
            <td>Credit</td>
            <td></td>
        </tr>
        </thead>
        <tbody id="CourseTableBodyData">
        </tbody>
    </table>
    <h2>Prequisite Courses: </h2>
    <div id="preList">

    </div>
    <input type="hidden" id="tagData" name="tagData"/>

    <div id="cateInput" class="coolinput">
        <div id="assInput" class="coolinput">

        </div>
    </div>
    <br>
    <button type="button" onclick="addCate()">Add Assessment Item</button>
    <br><br><br><br>
    <button type="submit" style="background-color: cornflowerblue">Add Course</button>
    ${requestScope.ms}
</form>
<jsp:include page="../common/footer.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function searchCourse() {
        // let mid = document.getElementById("mid").value;
        let codeCourse = document.getElementsByName("codeCourse")[0].value;
        // console.log(mid);
        console.log(codeCourse);
        $.ajax({
            url: "${pageContext.request.contextPath}/loadCourse",
            type: "GET",
            dataType: "JSON",
            data: {
                codeCourse: codeCourse
            },
            success: function (data) {
                let listCourse = data
                let bodyTable = $("#CourseTableBodyData")
                bodyTable.html("");
                let htmlValue = ''
                listCourse.forEach((c)=>{
                    htmlValue += "<tr><td>" + c.code + "</td><td>" + c.detail + "</td><td>" + c.credit + "</td><td><button type='button' onclick='addToPre(\"" + c.id + "\", \"" + c.code + "\")'>Add</button></td></tr>";
                })
                bodyTable.html(htmlValue);
            }
        });
    }
    var addedTags = [];
    function addToPre(id, code) {
        if (addedTags.some(tag => tag.id === id)) {
            alert("This tag is already added.");
            return;
        }

        if (addedTags.length >= 3) {
            alert("You can only add up to 3 tags.");
            return;
        }

        var tagList = document.getElementById("preList");
        var tag = document.createElement("span");
        tag.className = "tag";
        tag.id = id; // Gán ID cho thẻ span để xác định tag khi xóa
        tag.innerHTML = code + '<button onclick="removeTag(this)">X</button>';
        tagList.appendChild(tag);

        addedTags.push({id: id, code: code});
        prepareData(); // Cập nhật dữ liệu thẻ tag
    }
    function prepareData() {
        var tagDataInput = document.getElementById("tagData");
        var tagIds = [...document.querySelectorAll("#preList .tag")].map(tag => tag.id); // Lấy ra mảng các id của các tag trong preList
        tagDataInput.value = tagIds.join(","); // Nối các id lại với nhau bằng dấu phẩy và gán vào trường ẩn `tagData`
    }
    function removeTag(button) {
        var tag = button.parentElement;
        tag.parentElement.removeChild(tag);
        var id = tag.id; // Lấy ID từ thuộc tính "id" của thẻ tag

        // Loại bỏ tag từ danh sách
        addedTags = addedTags.filter(tag => tag.id !== id);

        // Cập nhật giá trị tagData sau khi xóa tag
        prepareData();
    }


</script>
</body>
</html>
