<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.TeamDB"></jsp:useBean>
<%
	String teamName = request.getParameter("teamNAME");
	Boolean result = db.isTeamName(teamName);
	if(result) {
		out.println("1");
	}
	else {
		out.println("0");
	}
%>