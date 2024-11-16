<%@ include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, org.example.jspcrud_db_22100183.dao.UserDAO, org.example.jspcrud_db_22100183.bean.UserVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
</head>
<body>
<%
    UserDAO dao = new UserDAO();
    String id = request.getParameter("id");  // URL에서 id 파라미터 값 가져오기
    String message = "";  // 메시지를 출력할 변수 선언

    if (id != null && !id.isEmpty()) {
        // UserVO 객체를 생성하고 ID를 설정
        UserVO userVO = new UserVO();
        userVO.setId(Integer.parseInt(id));  // ID 값을 정수로 변환하여 설정

        try {
            // deleteUser 메서드를 호출하여 사용자를 삭제
            dao.deleteUser(userVO);
            message = "user id : " + id + " was successfully deleted";
        } catch (Exception e) {
            message = "사용자 삭제 중 오류가 발생했습니다: " + e.getMessage();
        }
    } else {
        message = "삭제할 ID 값이 제공되지 않았습니다.";
    }
%>

<!-- 삭제된 ID와 메시지 출력 -->
<h2><%= message %></h2>
<a href="list.jsp" class="btn btn-primary">Return to home</a>
</body>
</html>

<%@ include file="footer.jsp"%>
