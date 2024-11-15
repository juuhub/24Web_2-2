package org.example.jspcrud_db_22100183.util;

import org.mariadb.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            if (conn == null) {
                conn = (Connection) DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/OSS24_22100183?user=OSS24_22100183&password=Olo8ee1X");
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    public static void main(String[] a) {
        Connection conn = JDBCUtil.getConnection();
        if(conn != null){
            System.out.println("DB연결 완료!");
        }
    }
}
