<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("ID");
	Connection conn = null;
	Statement stmt = null;
	try {
		//Class.forName("com.mysql.jdbc.Driver");
		//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java", "root", "1234");
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://3.35.198.138/fc_java", "user1", "1234");
		if (conn == null) {
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM fc_java.mem_info WHERE BINARY id='"+id+"';");
		if (rs.next()) {
			out.print("1");
		} else {
			out.print("0");
		}
	} finally {
		try {
			stmt.close();
		} catch (Exception ignored) {
		}
		try {
			conn.close();
		} catch (Exception ignored) {	
		}
	}
%>