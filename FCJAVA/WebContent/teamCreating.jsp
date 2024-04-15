<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.TeamDB"></jsp:useBean>
 <%
 	String logo = request.getParameter("teamLogo");;
 	String id = (String) session.getAttribute("ID");
 	String name = request.getParameter("teamName");
 	String info = request.getParameter("teamInfo");
 	String sns = request.getParameter("teamSns");
 	String city = request.getParameter("city");
 	String[] weekTime = request.getParameterValues("week");
 	String week="";
 	for (String str : weekTime) {
 		week = week+str;
 	};
 	if(week.contains("월화수목금토일")) {
 		week = week.replace("월화수목금토일", "매일");
 	};
 	if(week.contains("월화수목금")) {
 		week = week.replace("월화수목금", "평일·");
 	};
 	if(week.contains("토일")){
 		week = week.replace("토일", "·주말");
 	};
 	String skill = request.getParameter("skill");
 	String age = request.getParameter("age");
 	String maxNum = request.getParameter("maxNum");
 	//db.insertTeam(id, name, logo, city, week, info, maxNum, skill, sns, age);
 	response.sendRedirect("teamlist.jsp");
 %>
