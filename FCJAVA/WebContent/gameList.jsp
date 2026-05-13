<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.GameDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	List<GameDTO> gameList = (List<GameDTO>) request.getAttribute("Games");
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	LocalDateTime currentDate = LocalDateTime.now();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>토너먼트 목록</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- gameList css -->
	<link rel="stylesheet" href="css/gameList.css" />
</head>

<body> 
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<div class="main">
		<div class="top-section">
			<div class="top-title">
				<h1>토너먼트 대회</h1>
				<div>FC JAVA 토너먼트에 참가하시는 여러분을 환영합니다!<br> 함께 흥미진진한 경기를 즐기고 승리를 향해 달려봅시다! 여러분의 열정과 실력을 기대합니다!</div>
			</div>
		</div>
		<div class="section">
			<div class="content">
				<div class="use-type">
					<div class="searchResult">총 <strong><%=gameList.size() %></strong> 개</div>
					<div class="search-holder">
						<p class="type">
							<input type="radio" name="status-tab" id="all" value="all" checked/>
							<label for="all">전체</label>
							<input type="radio" name="status-tab" id="ing" value="ing"/>
							<label for="ing">진행중</label>
							<input type="radio" name="status-tab" id="end" value="end"/>
							<label for="end">종료</label>
						</p>
						<div class="text-field">
							<span class="white">
								<input type="search" name="search-text" placeholder="검색어를 입력해주세요" />
								<span class="material-symbols-outlined closeBtn">close</span>
							</span>
						</div>
						<button type="button" class="btn-search"></button>
					</div>
				</div>
				<ul class="conten-area">
				<%
				int i=1;
				for(GameDTO game : gameList) {
					int per = (game.getGame_apply() * 100) / game.getGame_type();
					LocalDateTime substDate = game.getGame_subst_date();
					LocalDateTime subfnDate = game.getGame_subfn_date();
					LocalDateTime startDate = game.getGame_st_date();
					LocalDateTime finalDate = game.getGame_fn_date();
				%>
					<li>
						<a href="fcjava.game?page=detail&game_num=<%= game.getGame_num() %>" class="game-card">
							<div class="card-thumb">
								<div class="game-status">
								<% if (currentDate.isBefore(substDate)){%>
									<span class="status">접수예정</span>
								<% } else if(currentDate.isAfter(subfnDate) && currentDate.isBefore(startDate) || (currentDate.isAfter(substDate) && currentDate.isBefore(subfnDate) && per == 100)) { %>
									<span class="status end-status">접수마감</span>
								<% } else if (currentDate.isAfter(startDate) && currentDate.isBefore(finalDate)) {%>
									<span class="status start-status">진행중</span>
								<% } else if (currentDate.isAfter(finalDate) || (currentDate.isAfter(subfnDate) && per < 100)) { %>
									<span class="status end-status">종료</span>
								<% } else {%>
									<span class="status">접수중</span>
								<% } %>
								</div>
								<img src="png/gameposter<%= i %>.jpg"/>
							</div>
							<div class="card-title">
								<article class="gameDate">
									<p class="m"><%= startDate.getMonthValue() %>월</p>
									<p class="d"><%= startDate.getDayOfMonth() %></p>
								</article>
								<div class="title-holder">
									<h3><%= game.getGame_name() %></h3>
									<p><%= String.format("%02d", startDate.getHour()) %>:<%= String.format("%02d", startDate.getMinute()) %> • <%= game.getGame_place() %> • <%= game.getGame_type() %>강</p>
								</div>
							</div>
						</a>
					</li>
				<%
				i++;
				if(i>2) i=1;
				} %>
				</ul>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	<script src="js/gameList.js"></script>
</body>
</html>
