<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.FreeBorderDB"></jsp:useBean>
<%
	String number = request.getParameter("number");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	
	db.updateFreeBorder(number, title, memo);
	response.sendRedirect("freeBorderDetail.jsp?number="+number);
%>
