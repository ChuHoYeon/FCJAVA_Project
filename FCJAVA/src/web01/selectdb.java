package web01;

import java.sql.*;
import java.util.ArrayList;

public class selectdb {

    // ���� �ı� ����� �������� �޼���
    public ArrayList<board_get_set> exme() throws Exception {
        Connection conn = null;
        Statement stmt = null;

        ArrayList<board_get_set> cc = new ArrayList<board_get_set>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java", "root", "1234");
            if (conn == null) {
                throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
            }

            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from board_1;");

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

    // ���� �ı� �ۼ� �޼���
    public void exww(String title, String bon) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java", "root", "doqwls2014");
            if (conn == null) {
                throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
            }

            pstmt = conn.prepareStatement("INSERT INTO board_1 (title, bon, c_time, u_time, user) VALUES (?, ?, NOW(), NOW(), 'default_user')");
            pstmt.setString(1, title);
            pstmt.setString(2, bon);
            int insertedRows = pstmt.executeUpdate();
            if (insertedRows > 0) {
                System.out.println(insertedRows + "���� ���ڵ尡 ���ԵǾ����ϴ�.");
            } else {
                System.out.println("���ڵ� ���� ����");
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