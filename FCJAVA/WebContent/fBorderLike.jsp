<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.FreeBorderDB"></jsp:useBean>
<%
	String id = request.getParameter("ID");
	String number = request.getParameter("Num");
	db.insertFreeBorderLike(id, number);
%> 