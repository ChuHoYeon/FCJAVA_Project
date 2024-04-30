<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="java.util.List" %>
<%
	String id = request.getParameter("id");
	String sessionID = (String) session.getAttribute("ID");
	List<TeamDTO> myTeamList = (List<TeamDTO>) session.getAttribute("MyTeamList");
	//System.out.println(sessionID);
	//System.out.println(myTeamList.size());
	if (id != null){
	    session.setAttribute("ID",id);
	    sessionID = (String) session.getAttribute("ID");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Header Page</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- bootstrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 헤더 css -->
	<link rel="stylesheet" href="css/header.css" type="text/css">
	<!-- 헤더 js -->
	<script src="js/header.js"></script>
</head>
<script>
    $(document).ready(function(){
        //로그인
        let id = "<%= id %>";
        let sessionID = "<%= sessionID %>";

        if((id === 'null' && sessionID === 'null') |id === ''){

            $(".join1 #loginNav").html("<a href='login.jsp' class='right1 f-10' >로그인</a>");
            $(".join1 #joinNav").html("<a href='join.jsp' class='right1 f-10'>회원가입</a>");
        } else {

            $(".join1 #loginNav").html("<a href='#' class='right2 f-10' ><span class='material-symbols-outlined'>person</span></a>");
            $(".join1 #joinNav").html("<a href='logout.jsp' class='right1 f-10'>로그아웃</a>");
        }
        
        $("#myTeam").click(function() {
        	if((id === 'null' && sessionID === 'null') |id === ''){
        		event.preventDefault();
                alert("로그인이 필요합니다.");
                window.location.href = "login.jsp";
        	}
		})
    });
</script>
<body>
	<!-- 팀  Modal -->
	<div class="modal" id="myTeamListModal" data-bs-backdrop="static" tabindex="-1">
	  <div class="modal-dialog"> <!-- modal-dialog-centered -->
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">내 팀</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="header-team-areaList">
      		<%
      		int teamCount = (myTeamList != null) ? myTeamList.size() : 0;
      		for(int i=0; i<3; i++) {
      			if(i < teamCount && myTeamList != null) { %>
      			<a href="fcjava.team?page=detail&teamNumber=<%= myTeamList.get(i).getT_num() %>">
		      		<div class="header-team-area">
		      			<div class="header-team-logo"><img alt="팀 로고" src="png/defaultLogo.png"></div>
		      			<div class="header-team-name"><%= myTeamList.get(i).getT_name() %></div>
		      		</div>
      			</a>
      		<% } else { %>
      			<a href="teamCreate.jsp">
      				<div class="teamCreatingGo">+</div>
      			</a>
   			<% }} %>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 팀  Modal -->
	
	<header class="hed0">
        <div class="hed1">
            <div class="join1">
                <span id="joinNav"><!--<a href="join.jsp" class="right1 f-10">회원가입</a>--></span>
                <span id="loginNav"><!--<a href="login.jsp" class="right1 f-10">로그인 </a>--></span>
                <a class="right1" id="myTeam" data-bs-toggle="modal" data-bs-target="#myTeamListModal">
                    <span class="material-symbols-outlined">
                        groups
                    </span>
                </a>
            </div>
            <a href="index.jsp" class="logo">FC JAVA</a>
            <ul id="headerNav">
                <a href="fcjava.team?page=list">
                    <li>팀 </li>
                </a>
                <a href="fcjava.game?page=gameList">
                    <li>토너먼트</li>
                </a>
                <a href="fcjava.stadium1?page=2">
                    <li>구장</li>
                </a>
                <a href="freeBorder.jsp">
                    <li>게시판</li>
                </a>
                <a href="shop_main.jsp">
                    <li>쇼핑</li>
                </a>
            </ul>
        </div> <!-- hed1 -->
        <div id="layer">
            <div class="layerInner">
                <ul>
                    <li><img src="png/navimg0.webp" class="navImg"></li>
                    <li><a href="fcjava.team?page=list">팀목록</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg1.webp" class="navImg"></li>
                    <li><a href="#">경기기록</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg2.jpg" class="navImg">
                    </li>
                    <li><a href="fcjava.stadium1?page=2">구장예약</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg3.webp" class="navImg"></li>
                    <li><a href="freeBorder.jsp">자유게시판</a></li>
                    <li><a href="str_qa.jsp">구장후기</a></li>
                    <li><a href="board_1.jsp">쇼핑몰후기</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg4.avif" class="navImg"></li>
                    <li><a href="fcjava.prd?page=prdUniform">유니폼</a></li>
                    <li><a href="shop_list2.jsp">축구용품</a></li>
                    <li><a href="shop_list3.jsp">운동화</a></li>
                </ul>
            </div>
        </div> <!-- layer -->
    </header>
    <!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>