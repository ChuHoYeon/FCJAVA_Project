<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.FreeBorderDB"></jsp:useBean>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String sessionID = (String) session.getAttribute("ID");
	
	db.insertFreeBorder(sessionID, title, content);
	response.sendRedirect("freeBorder.jsp");
%>
 