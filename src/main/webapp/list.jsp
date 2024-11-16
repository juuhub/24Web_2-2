<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-08
  Time: 오후 9:20
  To change this template use File | Settings | File Templates.
--%>
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
    <h1 class="mb-4">User List</h1>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <!-- 검색 폼 -->
        <form class="d-flex" action="search.jsp" method="get">
            <input type="text" name="keyword" class="form-control me-2" placeholder="Search by name or email" required>
            <button type="submit" class="btn btn-outline-primary">Search</button>
        </form>
    </div>

    <!-- Display error message if any -->
    <div id="errorMessage" style="color: red;"></div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            // UserDAO를 이용해 데이터베이스에서 사용자 목록 가져오기
            UserDAO userDAO = new UserDAO();
            List<UserVO> users = userDAO.getUserList();

            // 사용자 데이터가 존재하는 경우 테이블에 출력
            if (users != null && !users.isEmpty()) {
                for (UserVO user : users) {
        %>

        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getAge() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhone() %></td>
            <td>
                <!-- 편집, 보기, 삭제 버튼 -->
                <a href="edit.jsp?id=<%= user.getId() %>" class="btn btn-primary btn-sm">
                    <i class="fa fa-pencil-alt"></i> Edit
                </a>
                <a href="view.jsp?id=<%= user.getId() %>" class="btn btn-info btn-sm">
                    <i class="fa fa-eye"></i> View
                </a>
                <a href="javascript:void(0);" onclick="handleDelete('<%= user.getId() %>')" class="btn btn-danger btn-sm">
                    <i class="fa fa-trash-alt"></i> Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" style="text-align: center; color: gray;">No users found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JavaScript 및 jQuery -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>

<script>
    function handleDelete(id) {
        if (confirm('Are you sure you want to delete this user?')) {
            // delete_ok.jsp로 이동하며, id를 URL 파라미터로 전달
            window.location.href = 'delete_ok.jsp?id=' + id;
        }
    }
</script>

</body>
</html>

<%@ include file="footer.jsp"%>
