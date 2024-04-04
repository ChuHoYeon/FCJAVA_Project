<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.TeamDB"></jsp:useBean>
 <%
 	String logo = "img";
 	String id = (String) session.getAttribute("ID");
 	String name = request.getParameter("teamName");
 	String info = request.getParameter("teamInfo");
 	String sns = request.getParameter("teamSns");
 	String city = request.getParameter("city");
 	String[] weekTime = request.getParameterValues("week");
 	String week="";
 	for (String str : weekTime) {
 		week = week+str;
 	}
 	String skill = request.getParameter("skill");
 	String age = request.getParameter("age");
 	String maxNum = request.getParameter("maxNum");
 	db.insertTeam(id, name, logo, city, week, info, maxNum, skill, sns, age);
 	response.sendRedirect("teamlist.jsp");
 %>
