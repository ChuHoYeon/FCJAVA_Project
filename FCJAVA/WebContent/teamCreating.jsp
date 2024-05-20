<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="fc_java.TeamDB"></jsp:useBean>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.fcjava.model.TeamApply" %>
<%@ page import="com.fcjava.model.TeamBoardTable" %>
<%@ page import="java.util.List"%>
<%@ page import="com.fcjava.dto.TeamDTO"%>
 <%
	String uploadPath = request.getRealPath("/png/playerPhoto"); //어느위치에 저장할것인지. 폴더위치
	int size = 10*1024*1024; //업로드하는 용량
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();//모든 파일의 정보를 읽어온다
	String file1 =(String)files.nextElement();
	String filePl =(String)files.nextElement();
 	
 	String id = (String) session.getAttribute("ID");
 	String name = multi.getParameter("teamName");
 	String logo = multi.getFilesystemName(filePl);
 	String city = multi.getParameter("city");
 	String[] weekTime = multi.getParameterValues("week");
 	String week="";
 	for (String str : weekTime) {
 		week = week+str;
 	};
 	String info = multi.getParameter("teamInfo");
 	String maxNum = multi.getParameter("maxNum");
 	String skill = multi.getParameter("skill");
 	String sns = multi.getParameter("teamSns");
 	String age = multi.getParameter("age");
 	db.insertTeam(id, name, logo, city, week, info, maxNum, skill, sns, age);
 	
 	String t_num = db.getTeamNum(id);
	String pl_pic = multi.getFilesystemName(file1);
 	String back_num = multi.getParameter("back_num");
	String position = multi.getParameter("position");
	String pl_memo = multi.getParameter("pl_memo");
	String height = multi.getParameter("height");
	String weight = multi.getParameter("weight");
	
	TeamApply teamApply = TeamApply.getTeamApply();
	teamApply.insertTeamApply(t_num, id, pl_pic, back_num, position, pl_memo, height, weight);
	
	TeamBoardTable teamTable = TeamBoardTable.getTeamBoardTable();
	teamTable.createTeamBoardTable(t_num);
	
	List<TeamDTO> myTeamList = db.getTeamList(id);
	session.setAttribute("MyTeamList", myTeamList);
 	response.sendRedirect("fcjava.team?page=detail&teamNumber="+t_num);
 %>
