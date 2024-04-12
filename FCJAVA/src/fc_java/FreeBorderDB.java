package fc_java;

import java.sql.*;
import java.util.ArrayList;


public class FreeBorderDB {
	//DB 시작
	Connection startConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java", "root", "1234");
		if (conn == null) {
			throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
		}
		return conn;
	}
	//DB 종료
	void endConnection(Connection conn, Statement stmt) throws Exception {
		stmt.close();
		conn.close();
	}
	//자유게시판 - 전체
	public ArrayList<FreeBorder> selectAllFreeBorder() throws Exception {
		ArrayList<FreeBorder> freeBorderList = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		String sql = "SELECT * FROM fc_java.freeborder ORDER BY number DESC;";
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FreeBorder freeBorder = new FreeBorder();
				freeBorder.setNumber(rs.getInt("number"));
				freeBorder.setId(rs.getString("id"));
				freeBorder.setTitle(rs.getString("title"));
				freeBorder.setMemo(rs.getString("memo"));
				freeBorder.setTime(rs.getString("time"));
				freeBorderList.add(freeBorder);
			}
		} finally {
			endConnection(conn, stmt);
		}
		return freeBorderList;
	}	
	//자유게시판 - 검색
	public ArrayList<FreeBorder> selectFreeBorder(String selectText, String searchText) throws Exception {
		ArrayList<FreeBorder> freeBorderList = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		String sql = "SELECT * FROM fc_java.freeborder WHERE "+selectText+" like '%"+searchText+"%'  ORDER BY number DESC;";
		if (selectText.equals("titlememo")) {
			sql = "SELECT * FROM fc_java.freeborder WHERE title like '%"+searchText+"%' or memo like '%"+searchText+"%'  ORDER BY number DESC;";
		}
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FreeBorder freeBorder = new FreeBorder();
				freeBorder.setNumber(rs.getInt("number"));
				freeBorder.setId(rs.getString("id"));
				freeBorder.setTitle(rs.getString("title"));
				freeBorder.setMemo(rs.getString("memo"));
				freeBorder.setTime(rs.getString("time"));
				freeBorderList.add(freeBorder);
			}
		} finally {
			endConnection(conn, stmt);
		}
		return freeBorderList;
	}
	//자유게시판 - 좋아요 전체
	public ArrayList<FreeBorderLikes> selectAllFreeBorderLikes(String id) throws Exception {
		ArrayList<FreeBorderLikes> freeBorderLikes = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		String sql = "SELECT * FROM fc_java.freeborderlikes WHERE id='"+id+"';";
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FreeBorderLikes freeBorder = new FreeBorderLikes();
				freeBorder.setId(rs.getString("id"));
				freeBorder.setNumber(rs.getInt("number"));
				freeBorderLikes.add(freeBorder);
			}
		} finally {
			endConnection(conn, stmt);
		}
		return freeBorderLikes;
	}
	//글 작성
	public void insertFreeBorder(String id, String tilte, String memo) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		String sql = String.format("insert into fc_java.freeborder (id, title, memo) values('%s','%s','%s');",id, tilte, memo);
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			int rowNum = stmt.executeUpdate(sql);
			if(rowNum < 1){
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			endConnection(conn, stmt);
		}
	}
	//자유게시판 - 좋아요 추가
		public void insertFreeBorderLike(String id, String number) throws Exception {
			Connection conn = null;
			Statement stmt = null;
			String sql = String.format("insert into fc_java.freeborderlikes values('%s','%s');",id, number);
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				int rowNum = stmt.executeUpdate(sql);
				if(rowNum < 1){
					throw new Exception("데이터를 DB에 입력할 수 없습니다.");
				}
			} finally {
				endConnection(conn, stmt);
			}
		}
	//자유게시판 - 글 불러오기
	public FreeBorder choiceFreeBorder(String number) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		FreeBorder freeBorder = new FreeBorder();
		String sql = "SELECT * FROM fc_java.freeborder WHERE number='"+number+"';";
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				freeBorder.setNumber(rs.getInt("number"));
				freeBorder.setId(rs.getString("id"));
				freeBorder.setTitle(rs.getString("title"));
				freeBorder.setMemo(rs.getString("memo"));
				freeBorder.setTime(rs.getString("time"));
			}
		} finally {
			endConnection(conn, stmt);
		}
		return freeBorder;
	}
	//자유게시판 - 좋아요 불러오기
		public Boolean choiceFreeBorderLike(String id, String number) throws Exception {
			Connection conn = null;
			Statement stmt = null;
			Boolean isLike = false;
			String sql = "SELECT * FROM fc_java.freeborderlikes WHERE id='"+id+"' and number='"+number+"';";
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					isLike = true;
				}
			} finally {
				endConnection(conn, stmt);
			}
			return isLike;
		}
	//글 수정
	public void updateFreeBorder (String number, String title, String memo) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		String sql = "update fc_java.freeborder set title='"+title+"', memo = '"+memo+"' where number = '"+number+"';";
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			int rowNum = stmt.executeUpdate(sql);
			if(rowNum < 1){
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			endConnection(conn, stmt);
		}
	}
	//글 삭제
	public void deleteFreeBorder(String number) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		String sql = "delete from fc_java.freeborder where number = '"+number+"';";
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			int rowNum = stmt.executeUpdate(sql);
			if(rowNum < 1){
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			endConnection(conn, stmt);
		}
	}
	//자유게시판 - 좋아요 취소
	public void deleteFreeBorderLike(String id, String number) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		String sql = "delete from fc_java.freeborderlikes where id = '"+id+"' and number='"+number+"';";
		try {
			conn = startConnection();
			stmt = conn.createStatement();
			int rowNum = stmt.executeUpdate(sql);
			if(rowNum < 1){
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			endConnection(conn, stmt);
		}
	}
}
