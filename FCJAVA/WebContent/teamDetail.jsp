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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- teamDetail css -->
	<link rel="stylesheet" href="css/teamDetail.css" />
	
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<main>
		<div class="teamArea">
			<!-- side -->
			<div class="left-teamInfo">
				<div class="side-top">
					<div class="side-player">
						<span class="material-symbols-outlined">person</span>
						<span>1/<%=team.getMax_p_num() %></span>
					</div>
				</div>
				<div class="team-img"><img src="png/defaultLogo.png"/></div>
				<div class="team-info">
					<h2><%= team.getT_name() %></h2>
					<label>#<%= team.getHom_city() %></label>
					<label>#<%= team.getWeek_time() %></label>
					<label>#<%= team.getT_skill() %></label>
					<label>#<%= team.getT_age() %></label>
					<label>#<%=year+"/"+month+"/"+date %></label>
				</div>
				<div class="side-bottom">
					<h4>팀소개</h4>
					<div class="side-memo"><%=team.getT_info() %></div>
				</div>
				<div>
					<% if(team.getT_sns() != null && !team.getT_sns().equals("")) { %>
					<p><a href="https://www.instagram.com/movie"><%= team.getT_sns() %></a></p>
					<% } else { %>
					<p>등록된 홈페이지가 없습니다.</p>
					<% } %>
				</div>
				<div class="subArea"><button type="button" id="team-apply">가입하기</button></div>
			</div>
			<!-- main -->
			<div class="right-info">
				<div class="team-tab">
					<div class="tab tab-focus"><p>선수</p></div>
					<div class="tab"><p>일정</p></div>
					<div class="tab"><p>포메이션</p></div>
					<div class="tab"><p>게시판</p></div>
				</div>
				<div>
					<div class="player-number">
						<label>팀 선수 수 <strong>4</strong> 명</label>
					</div>
					<div class="player-area">
						<div class="player-sub-name">선수</div>
						<div class="player-sub-backnum">희망 등번호</div>
						<div class="player-sub-hei">키</div>
						<div class="player-sub-wei">몸무게</div>
						<div class="player-sub-memo">선수 소개</div>
						<div class="player-sub-date">가입일</div>
					</div>
					<ul>
					<% String memo="안녕하세요."; for(int i=0; i<4; i++) { %>
						<li class="player">
							<div class="player-name">
								<div class="player-img"><img src="png/defaultLogo.png" /></div>
								<div>홍길동</div>
							</div>
							<div class="player-backnum"><%= (int)(Math.random() * 100) %></div>
							<div class="player-hei">174cm</div>
							<div class="player-wei">74kg</div>
							<div class="player-memo">
								<div class="memo-in">
									<span class="player-me" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-trigger="hover" data-bs-content="<%= memo %>"><%= memo %></span>
								</div>
							</div>
							<div class="player-date">2024-04-12</div>
						</li>
					<% memo += "안녕하세요.안녕하세요."; } %>
					</ul>
				</div>
			</div>
		</div>
	</main>

	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	
	<!-- teamDetail js -->
	<script src="js/teamDetail.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
    });
	</script>
	
	
</body>
</html>