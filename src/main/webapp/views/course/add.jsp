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
            width: calc(50% - 10px);
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
    </style>
    <script>
        var cateCount = 0;

        function addCate() {
            var assCount = 0;
            cateCount++;  // Tăng biến đếm lên mỗi lần hàm được gọi

            var newDiv = document.createElement("div");
            newDiv.id="assInput"+cateCount;
            // Tạo nhãn mới cho Category
            var newLabel = document.createElement("label");
            newLabel.innerText = "Name Category: ";
            newLabel.className="text";
            newLabel.htmlFor="name";
            // Tạo một thẻ input mới cho Category
            var newInput = document.createElement("input");
            newInput.type = "text";
            newInput.name = "cate" + cateCount;  // Đặt tên cho thẻ input mới
            newInput.required="";
            newInput.autocomplete="off";
            // Tạo nút bấm để thêm Assessment
            var newButton = document.createElement("button");
            newButton.type = "button";
            newButton.onclick = function () {
                assCount++;
                addAss(cateCount, assCount);
            };
            newButton.innerText = "Add Assessment";

            // Tạo một thẻ <br> để ngắt dòng sau mỗi input
            var br = document.createElement("br");

            // Tạo một div container cho mỗi Category và các Assessment của nó
            var categoryContainer = document.createElement("div");
            categoryContainer.id = "category" + cateCount;

            // Thêm nhãn, thẻ input, nút bấm và thẻ <br> vào div container
            categoryContainer.appendChild(newLabel);
            categoryContainer.appendChild(newInput);
            categoryContainer.appendChild(newButton);
            categoryContainer.appendChild(br);
            categoryContainer.appendChild(newDiv);
            // Thêm div container vào div có id="cateInput"
            var container = document.getElementById("cateInput");
            container.appendChild(categoryContainer);
        }

        function addAss(cateId, assCount) {

            // Tạo nhãn mới cho Assessment
            var newLabel = document.createElement("label");
            newLabel.innerText = "Name Assessment: ";
            newLabel.className="text";
            newLabel.htmlFor="input";
            // Tạo một thẻ input mới cho Assessment
            var newInput = document.createElement("input");
            newInput.type = "text";
            newInput.name = "asscate" + cateId ;  // Đặt tên cho thẻ input mới
            newInput.required="";
            newInput.autocomplete="off";

            var weiLabel = document.createElement("label");
            weiLabel.innerText = "Weight (%): ";
            weiLabel.className="text";
            weiLabel.htmlFor="input";

            var newWeight = document.createElement("input")
            newWeight.type = "number";
            newWeight.name = "weicate" + cateId ;
            newWeight.required="";
            newWeight.autocomplete="off";

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
<header>
    <img src="logo.png" alt="MyStudySpace Logo">
    <span>MyStudySpace</span>
</header>
<form action="addCourse" method="POST">
    <p>Code: <input type="text" name="code"/></p>
    <p>Detail: <input type="text" name="detail"/></p>
    <div id="cateInput" class="coolinput">
        <div id="assInput" class="coolinput">

        </div>
    </div>
    <br>
    <button type="button" onclick="addCate()">Add Category</button><br><br>
    <button type="submit" style="background-color: cornflowerblue">Add Course</button>
    ${requestScope.ms}
</form>
</body>
</html>
