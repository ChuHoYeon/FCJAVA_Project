<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="java.util.Date" %>
<%
	TeamDTO team = (TeamDTO) request.getAttribute("team");
	int year = team.getT_c_day().getYear()+1900;
	int month = team.getT_c_day().getMonth()+1;
	int date = team.getT_c_day().getDate();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>팀테스트2</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<style>
.teamArea {
	display: flex;
    width: 1280px;
    margin: 0 auto;
    padding: 50px 0;
    gap: 20px;
}
.left-teamInfo {
	display: flex;
    flex-direction: column;
    align-items: center;
    width: 290px;
    gap: 20px;
    padding: 30px 15px;
    border: 1px solid #ebebeb;
}
.team-img {
	width: 150px;
	height: 150px;
}
.team-img img {
	border: 1px solid #ebebeb;
    border-radius: 50%;
    width: 150px;
    height: 150px;
}
.team-info {
	width: 100%;
	text-align: center;
}
.team-info h2 {
	margin-bottom: 15px;
}
.team-info label {
	font-size: 10pt;
    font-weight: 600;
    color: #7F7F7F;
}
.subArea {
	width: 100%;
}
.subArea button {
	width: -webkit-fill-available;
	height: 40px;
	background-color: #035177;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.right-info {
	width: 80%;
    border: 1px solid #ebebeb;
    padding: 0 20px;
}
.team-tab {
	display: flex;
	gap: 20px;
	padding: 16px 0;
}
.team-tab .tab {
	cursor: pointer;
	padding: 6px 4px;
	font-weight: 600;
    color: gray;
}
.team-tab .tab-focus {
	border-bottom: 2px solid;
	color: black;
}

</style>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<main>
		<div class="teamArea">
			<div class="left-teamInfo">
				<div class="team-img"><img src="png/defaultLogo.png"/></div>
				<div class="team-info">
					<h2><%= team.getT_name() %></h2>
					<label>#<%= team.getHom_city() %></label>
					<label>#<%= team.getWeek_time() %></label>
					<label>#<%= team.getT_skill() %></label>
					<label>#<%= team.getT_age() %></label>
					<label>#<%=year+"/"+month+"/"+date %></label>
				</div>
				<div>
					<h4>가입인원</h4>
					<div>1/<%=team.getMax_p_num() %></div>
				</div>
				<div>
					<p><a href="https://www.instagram.com/movie"><span class="material-symbols-outlined">share</span></a></p>
				</div>
				<div>
					<h4>팀소개</h4>
					<div><%=team.getT_info() %></div>
				</div>
				<div class="subArea"><button>가입하기</button></div>
			</div>
			<div class="right-info">
				<div class="team-tab">
					<div class="tab tab-focus"><p>선수</p></div>
					<div class="tab"><p>일정</p></div>
					<div class="tab"><p>포메이션</p></div>
					<div class="tab"><p>게시판</p></div>
				</div>
				<div>
				</div>
			</div>
		</div>
	</main>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	
<script>
$(document).ready(function(){
    $('.tab').click(function(){
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
    });
});
</script>
</body>
</html>