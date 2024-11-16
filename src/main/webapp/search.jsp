<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-16
  Time: 오후 6:44
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, org.example.jspcrud_db_22100183.dao.UserDAO, org.example.jspcrud_db_22100183.bean.UserVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Search Results</h1>

    <%
        String keyword = request.getParameter("keyword");
        UserDAO userDAO = new UserDAO();
        List<UserVO> users = userDAO.searchUsers(keyword);
    %>

    <!-- 검색어 표시 -->
    <h3>Results for "<%= keyword %>"</h3>

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
        <%
            if (users != null && !users.isEmpty()) {
                for (UserVO user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getAge() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhone() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="text-center text-muted">No results found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="text-end">
        <a href="list.jsp" class="btn btn-primary">Return to home</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
<%@ include file="footer.jsp"%>
</html>