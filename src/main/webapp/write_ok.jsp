<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-08
  Time: 오후 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, org.example.jspcrud_db_22100183.dao.UserDAO, org.example.jspcrud_db_22100183.bean.UserVO" %>
<%
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    UserDAO dao = new UserDAO();

    UserVO vo = new UserVO(name, age, email, phone);
    dao.insertUser(vo);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Added</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>User Added Successfully!</h1>
    <h2>User Information:</h2>

    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><%= request.getParameter("name") %></td>
            <td><%= request.getParameter("age") %></td>
            <td><%= request.getParameter("email") %></td>
            <td><%= request.getParameter("phone") %></td>
        </tr>
        </tbody>
    </table>

    <a href="write.jsp" class="btn btn-primary">Create Another User</a>
    <a href="list.jsp" class="btn btn-primary">Return to home</a>
</div>
</body>
</html>

<%@ include file="footer.jsp"%>