<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.TeamDB"></jsp:useBean>
<%
	String teamName = request.getParameter("teamName");
	boolean overlap = db.isTeamName(teamName);
	if(overlap) {
		out.println("있음");
	}
	else {
		out.println("없음");
	}
%> 