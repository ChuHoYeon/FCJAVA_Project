<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fcjava.dto.TeamDTO"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

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
		ResultSet rsId = stmt.executeQuery("SELECT * FROM fc_java.mem_info WHERE BINARY id='"+id+"' ;");
		if (rsId.next() == false) {
			out.print("id");
		} else {
			ResultSet rs = stmt.executeQuery("SELECT * FROM fc_java.mem_info WHERE BINARY id='"+id+"' and BINARY pw='"+pw+"' ;");
			if (rs.next() == false) {
				out.print("pw");
			} else {				
				List<TeamDTO> myTeamList = new ArrayList<>();
				ResultSet myTeamrs = stmt.executeQuery("SELECT fc_java.team_info.* FROM fc_java.team_info JOIN fc_java.pl_info ON fc_java.team_info.t_num = fc_java.pl_info.t_num WHERE fc_java.pl_info.id = '"+id+"' order by fc_java.pl_info.pl_ap_date desc;");
				while(myTeamrs.next()) {
					TeamDTO team = new TeamDTO();
					team.setT_num(myTeamrs.getInt("t_num"));
					team.setT_name(myTeamrs.getString("t_name"));
					team.setT_logo(myTeamrs.getString("t_logo"));
					team.setMax_p_num(myTeamrs.getInt("max_p_num"));
					myTeamList.add(team);
				}
				
				session.setAttribute("ID",id);
				session.setAttribute("MyTeamList", myTeamList);
				out.print("OK");
			}	
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