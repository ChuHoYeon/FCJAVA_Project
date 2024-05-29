package web01;

import java.sql.*;
import java.util.ArrayList;

public class selectdb {

    // 구매 후기 목록을 가져오는 메서드
    public ArrayList<board_get_set> exme() throws Exception {
        Connection conn = null;
        Statement stmt = null;

        ArrayList<board_get_set> cc = new ArrayList<board_get_set>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://13.125.248.45/fc_java", "user1", "1234");
            if (conn == null) {
                throw new Exception("데이터베이스에 연결할 수 없습니다.");
            }

            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from prd_board;");

            while (rs.next()) {
                board_get_set aa = new board_get_set();
                aa.setNum(rs.getInt("num"));
                aa.setTitle(rs.getString("title"));
                aa.setBon(rs.getString("bon"));
                aa.setC_time(rs.getString("c_time"));
                aa.setU_time(rs.getString("u_time"));
                cc.add(aa);
            }
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (Exception ignored) {}
            try {
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
        return cc;
    }

    // 구매 후기 작성 메서드
    public void exww(String title, String bon) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://13.125.248.45/fc_java", "user1", "1234");
            if (conn == null) {
                throw new Exception("데이터베이스에 연결할 수 없습니다.");
            }

            pstmt = conn.prepareStatement("INSERT INTO prd_board (title, bon, c_time, u_time, user) VALUES (?, ?, NOW(), NOW(), 'default_user')");
            pstmt.setString(1, title);
            pstmt.setString(2, bon);
            int insertedRows = pstmt.executeUpdate();
            if (insertedRows > 0) {
                System.out.println(insertedRows + "개의 레코드가 삽입되었습니다.");
            } else {
                System.out.println("레코드 삽입 실패");
            }
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception ignored) {}
            try {
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
    }
}