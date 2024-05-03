<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="java.util.List" %>
<%
	String id = request.getParameter("id");
	String sessionID = (String) session.getAttribute("ID");
	List<TeamDTO> myTeamList = (List<TeamDTO>) session.getAttribute("MyTeamList");
	if (id != null){
	    session.setAttribute("ID",id);
	    sessionID = (String) session.getAttribute("ID");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
	<!-- 헤더 css -->
	<link rel="stylesheet" href="css/header.css" type="text/css">
</head>
<script>
    $(document).ready(function(){
        //로그인
        let id = "<%= id %>";
        let sessionID = "<%= sessionID %>";

        if((id === 'null' && sessionID === 'null') ||id === ''){
            $("#loginNav").html("<a href='login.jsp' class='f-10' >로그인</a>");
            $("#joinNav").html("<a href='join.jsp' class='f-10'>회원가입</a>");
        } else {

            $("#loginNav").html("<span class='material-symbols-outlined'>person</span>");
            $("#joinNav").html("<a href='logout.jsp' class='f-10'>로그아웃</a>");
        }
        
        $("#myTeam").click(function(event) {
        	if((id === 'null' && sessionID === 'null') ||id === ''){
        		$('#myTeamListModal').modal('hide');
                alert("로그인이 필요합니다.");
                window.location.href = "login.jsp";
        	} else {
                // 로그인되어 있으면 모달을 엽니다.
                $('#myTeamListModal').modal('show');
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
        	<div class="logo">
            	<a href="index.jsp">FC JAVA</a>
            </div>
            <ul id="headerNav">
            	<li>
                	<a href="fcjava.team?page=list">팀 </a>
                </li>
                <li>
                	<a href="fcjava.game?page=gameList">토너먼트</a>
                </li>
                <li>
                	<a href="fcjava.stadium1?page=2">구장</a>
                </li>
                <li>
                	<a href="freeBorder.jsp">게시판</a>
                </li>
                <li>
                	<a href="fcjava.prd?page=prdUniform">쇼핑</a>
                </li>
            </ul>
            <div class="userMenu">
                <div id="myTeam" data-bs-toggle="modal" data-bs-target="#myTeamListModal">
                    <span class="material-symbols-outlined">groups</span>
                </div>
               	<div id="loginNav"><!--<a href="login.jsp" class="right1 f-10">로그인 </a>--></div>
               	<div id="joinNav"><!--<a href="join.jsp" class="right1 f-10">회원가입</a>--></div>
            </div>
        </div> <!-- hed1 -->
        <div id="layer">
            <div class="layerInner">
                <ul>
                    <li><img src="png/navimg0.webp" class="navImg"></li>
                    <li><a href="fcjava.team?page=list">팀목록</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg1.webp" class="navImg"></li>
                    <li><a href="fcjava.game?page=gameList">대회목록</a></li>
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
                    <li><a href="fcjava.prd?page=prdUniform">축구용품</a></li>
                </ul>
            </div>
        </div> <!-- layer -->
    </header>
    <!-- 헤더 js -->
	<script src="js/header.js"></script>
    <!-- bootstrap js -->
    <script src="./js/bootstrap.bundle.min.js"></script>
</body>
</html>