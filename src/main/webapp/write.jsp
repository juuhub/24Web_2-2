<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-08
  Time: 오후 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-text {
            color: red;
            font-size: 0.875em;
        }
    </style>
    <script>
        // 유효성 검사 함수
        function validateForm() {
            let name = document.getElementById("name").value;
            let age = document.getElementById("age").value;
            let email = document.getElementById("email").value;
            let phone = document.getElementById("phone").value;
            let isValid = true;

            // 모든 에러 메시지를 초기화
            document.getElementById("nameError").textContent = "";
            document.getElementById("ageError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("phoneError").textContent = "";

            // 이름 체크: 빈 값이거나 공백만 입력된 경우
            if (name.trim() === "") {
                document.getElementById("nameError").textContent = "Name is required.";
                isValid = false;
            }

            // 나이 체크: 숫자이고 0보다 큰 값이어야 함
            if (isNaN(age) || age <= 0) {
                document.getElementById("ageError").textContent = "Age must be a valid positive number.";
                isValid = false;
            }

            // 이메일 체크: 정규식을 사용하여 이메일 형식 확인
            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("emailError").textContent = "Please enter a valid email address.";
                isValid = false;
            }

            // 전화번호 체크: 정규식을 사용하여 전화번호 형식 확인
            let phonePattern = /^\(\d{3}\)\s\d{3}-\d{4}$/;
            if (!phonePattern.test(phone)) {
                document.getElementById("phoneError").textContent = "Phone number must be in the format (555) 555-1234.";
                isValid = false;
            }

            // 폼 검증이 실패하면 제출을 중지
            return isValid;
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <h1>Add User</h1>
    <form action="write_ok.jsp" method="POST" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
            <span id="nameError" class="error-text"></span>
        </div>
        <div class="mb-3">
            <label for="age" class="form-label">Age</label>
            <input type="number" class="form-control" id="age" name="age" required>
            <span id="ageError" class="error-text"></span>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
            <span id="emailError" class="error-text"></span>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
            <span id="phoneError" class="error-text"></span>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="list.jsp" class="btn btn-primary">Return to home</a>
    </form>
</div>
</body>
</html>


<%@ include file="footer.jsp"%>