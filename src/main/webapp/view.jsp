<%@ include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, org.example.jspcrud_db_22100183.dao.UserDAO, org.example.jspcrud_db_22100183.bean.UserVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show User</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">User Details</h1>

    <!-- UserVO 객체 초기화 -->
    <jsp:useBean id="userDAO" class="org.example.jspcrud_db_22100183.dao.UserDAO" scope="page" />
    <jsp:useBean id="user" class="org.example.jspcrud_db_22100183.bean.UserVO" scope="request" />
    <jsp:setProperty name="user" property="*" />

    <%
        // DAO에서 사용자 정보 가져오기
        int id = Integer.parseInt(request.getParameter("id"));
        UserVO fetchedUser = userDAO.getUser(id);
        if (fetchedUser != null) {
            request.setAttribute("user", fetchedUser);
        } else {
            request.setAttribute("error", "User not found.");
        }
    %>

    <%
        // 에러 메시지 출력
        if (request.getAttribute("error!") != null) {
    %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error!") %>
    </div>
    <%
    } else {
    %>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><jsp:getProperty name="user" property="id" /></td>
            <td><jsp:getProperty name="user" property="name" /></td>
            <td><jsp:getProperty name="user" property="age" /></td>
            <td><jsp:getProperty name="user" property="email" /></td>
            <td><jsp:getProperty name="user" property="phone" /></td>
        </tr>
        </tbody>
    </table>
    <%
        }
    %>

    <!-- 버튼을 테이블 아래에 배치 -->
    <div class="text-end">
        <a href="list.jsp" class="btn btn-primary">Return to home</a>
    </div>
</div>

</body>
<%@ include file="footer.jsp"%>
</html>
