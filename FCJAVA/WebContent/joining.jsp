<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String b_day = request.getParameter("bir");
	String p_num = request.getParameter("cell");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String email1 = request.getParameter("email1");
	if (email1.contains("@")){
		email += email1;
	}
	String add = request.getParameter("addr1") + " " + request.getParameter("addr2"); //나중에 db테이블 주소,상세주소 2개로 분리

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://13.125.248.45/fc_java", "user1", "1234");
		if (conn == null) {
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		String command = String.format("insert into mem_info values('%s','%s','%s','%s','%s','%s','%s','%s',now()) ;", id, pw, name, add, b_day, p_num, gender, email);
		int rowNum = stmt.executeUpdate(command);
		if(rowNum < 1){
			throw new Exception("데이터를 DB에 입력할 수 없습니다.");
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
	response.sendRedirect("index.jsp");
%>
