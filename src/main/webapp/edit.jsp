<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-08
  Time: 오후 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, org.example.jspcrud_db_22100183.dao.UserDAO, org.example.jspcrud_db_22100183.bean.UserVO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserDAO dao = new UserDAO();

    UserVO vo = dao.getUser(id);
    if(vo == null) {
        System.out.println("error fetching the data");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
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

            // 이름 체크
            if (name.trim() === "") {
                document.getElementById("nameError").textContent = "Name is required.";
                isValid = false;
            }

            // 나이 체크
            if (isNaN(age) || age <= 0) {
                document.getElementById("ageError").textContent = "Age must be a valid positive number.";
                isValid = false;
            }

            // 이메일 체크
            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("emailError").textContent = "Please enter a valid email address.";
                isValid = false;
            }

            // 전화번호 체크
            let phonePattern = /^\(\d{3}\)\s\d{3}-\d{4}$/;
            if (!phonePattern.test(phone)) {
                document.getElementById("phoneError").textContent = "Phone number must be in the format (555) 555-1234.";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <h1>Edit User</h1>

    <!-- 폼 데이터 제출 시 update_ok.jsp로 전달 -->
    <form action="edit_ok.jsp" method="POST" onsubmit="return validateForm()">
        <!-- 사용자 ID를 숨겨서 전달 -->
        <input type="hidden" id="id" name="id" value="<%= request.getParameter("id") %>">

        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" value="<%= vo.getName() %>" id="name" name="name" required>
            <span id="nameError" class="error-text"></span>
        </div>
        <div class="mb-3">
            <label for="age" class="form-label">Age</label>
            <input type="number" class="form-control" value="<%= vo.getAge() %>" id="age" name="age" required>
            <span id="ageError" class="error-text"></span>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" value="<%= vo.getEmail() %>" id="email" name="email" required>
            <span id="emailError" class="error-text"></span>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" value="<%= vo.getPhone() %>" id="phone" name="phone" required>
            <span id="phoneError" class="error-text"></span>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
</body>
<%@ include file="footer.jsp"%>
</html>