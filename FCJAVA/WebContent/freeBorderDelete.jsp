<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.FreeBorderDB"></jsp:useBean>
<%
	String number = request.getParameter("number");
	db.deleteFreeBorder(number);
	response.sendRedirect("freeBorder.jsp");
%> 