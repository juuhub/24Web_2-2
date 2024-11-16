package org.example.jspcrud_db_22100183.dao;

import org.example.jspcrud_db_22100183.bean.UserVO;
import org.example.jspcrud_db_22100183.util.JDBCUtil;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String USER_INSERT = "insert into user (name, age, email, phone) values (?, ?, ?, ?)";
    private final String USER_UPDATE =  "update user set name=?, age=?, email=?, phone=? where id=?";
    private final String USER_DELETE = "delete from user where id=?";
    private final String USER_GET = "select * from user where id=?";
    private final String USER_LIST = "select * from user order by id";
    private final String USER_SEARCH = "select * from user where name like ? or email like ?";

    public int insertUser(UserVO vo){
        try{
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_INSERT);
            stmt.setString(1, vo.getName());
            stmt.setInt(2, vo.getAge());
            stmt.setString(3, vo.getEmail());
            stmt.setString(4, vo.getPhone());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int updateUser(UserVO vo){
        try{
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_UPDATE);
            stmt.setString(1, vo.getName());
            stmt.setInt(2, vo.getAge());
            stmt.setString(3, vo.getEmail());
            stmt.setString(4, vo.getPhone());
            stmt.setInt(5, vo.getId());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public UserVO getUser(int id){
        UserVO user = new UserVO();

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_GET);
            System.out.println(id);
            System.out.println("Executing Query: " + USER_GET);
            System.out.println("Parameter ID: " + id);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            while(rs.next()){

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                System.out.println("Name from DB: " + rs.getString("name")); // 확인용 출력
                System.out.println("Name set in user: " + user.getName());   // 확인용 출력
                user.setAge(rs.getInt("age"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRegdate(rs.getDate("regdate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public void deleteUser(UserVO vo) {
        conn = JDBCUtil.getConnection(); // DB 연결
        try {
            // SQL 쿼리 준비
            stmt = conn.prepareStatement(USER_DELETE);

            // UserVO 객체에서 id 값 가져와서 쿼리에 설정
            stmt.setInt(1, vo.getId()); // id가 정수형이라고 가정 (UserVO에서 getId() 메서드를 사용)

            // 쿼리 실행 (삭제)
            int rowsAffected = stmt.executeUpdate(); // 삭제된 행 수 반환

            // 삭제 성공 여부 확인
            if (rowsAffected > 0) {
                System.out.println("사용자가 성공적으로 삭제되었습니다.");
            } else {
                System.out.println("주어진 ID에 해당하는 사용자가 없습니다.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<UserVO> getUserList(){
        List<UserVO> userList = new ArrayList<>();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_LIST);
            rs = stmt.executeQuery();
            while(rs.next()){
                UserVO user = new UserVO();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setAge(rs.getInt("age"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRegdate(rs.getDate("regdate"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public List<UserVO> searchUsers(String keyword) {
        List<UserVO> userList = new ArrayList<>();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_SEARCH);
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserVO user = new UserVO();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setAge(rs.getInt("age"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRegdate(rs.getDate("regdate"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}