<%@page import="com.fcjava.model.GameSearch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.GameDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	List<GameDTO> gameList = (List<GameDTO>) request.getAttribute("Games");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date currentDate = new Date();
	Date startDate = null;
	Date finalDate = null;
	Date substDate = null;
	Date subfnDate = null;
	
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
					for(GameDTO game : gameList) {
						substDate = dateFormat.parse(game.getGame_subst_date());
			            subfnDate = dateFormat.parse(game.getGame_subfn_date());
						startDate = dateFormat.parse(game.getGame_st_date());
						finalDate = dateFormat.parse(game.getGame_fn_date());
						String hours = String.valueOf(startDate.getHours());
						String minutes = String.valueOf(startDate.getMinutes());
						if(hours.length() == 1) {
							hours = "0"+hours;
						}
						if(minutes.length() == 1) {
							minutes = "0"+minutes;
						}
				%>
					<li>
						<a href="fcjava.game?page=2&game_num=<%= game.getGame_num() %>" class="game-card">
							<div class="card-thumb">
								<div class="game-status">
								<% if (currentDate.before(substDate)){%>
									<span class="status">접수예정</span>
								<% } else if(currentDate.after(substDate) && currentDate.before(subfnDate)) { %>
									<span class="status">접수중</span>
								<% } else if (currentDate.after(subfnDate) && currentDate.before(finalDate)) {%>
									<span class="status start-status">진행중</span>
								<% } else if (currentDate.after(finalDate)) { %>
									<span class="status end-status">종료</span>
								<% } %>
								</div>
								<img src="https://cdn.life-sports.kr/news/photo/202401/2333_2856_3017.jpg"/>
							</div>
							<div class="card-title">
								<article class="gameDate">
									<p class="m"><%= startDate.getMonth()+1 %>월</p>
									<p class="d"><%= startDate.getDate() %></p>
								</article>
								<div class="title-holder">
									<h3><%= game.getGame_name() %></h3>
									<p><%= hours %>:<%= minutes %> • <%= game.getGame_place() %> • <%= game.getGame_type() %>강</p>
								</div>
							</div>
						</a>
					</li>
				<% } %>
				</ul>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	
<script>
	$(function() {
		//clear버튼
		$(".closeBtn").hide();
		$("input[name='search-text']").keyup(function(){
			  $(".closeBtn").toggle(Boolean($(this).val()));
		});
		$(".closeBtn").click(function() {
			$("input[name='search-text']").val('').focus();
			$(this).hide();
		})
		//검색 탭
		$("input[name='status-tab']").on("change", function () {
			let search = $("input[name='search-text']").val();
			let status = $(this).val();
			let currentTime = new Date();
			getSearching(search, status, currentTime);
		});
		//검색버튼
		$(".btn-search").on("click", function() {
			let search = $("input[name='search-text']").val();
			let status = $("input[name='status-tab']:checked").val();
			let currentTime = new Date();
			getSearching(search, status, currentTime);
		});
		//검색 엔터키
		$("input[name='search-text']").keypress(function(event) {
		    if (event.which === 13) {
		        $(".btn-search").click();
		    }
		});
		//검색ajax
		function getSearching(search, status, currentTime) {
			$.ajax({
                url: "fcjava.game?page=gameSearch",
                data: {
                    "search-text": search,
                    "status-tab": status
                },
                dataType: 'json',
                success: function(data) {
               		$(".conten-area").empty();
               		$(".searchResult").empty();
                	if(data.length > 0) {
                		$(".no-search").remove();
	                	for (let i = 0; i < data.length; i++) {
	                		const substDate = new Date(data[i].subst_date);
	                        const subfnDate = new Date(data[i].subfn_date);
	                        const startDate = new Date(data[i].st_date);
	                        const finalDate = new Date(data[i].fn_date);
	                        
	                        const month = startDate.getMonth() + 1;
	                        const day = startDate.getDate();
	                        const hours = startDate.getHours();
	                        const minutes = startDate.getMinutes();
	                       	
	                		let state = "";
	                		if(currentTime < substDate) {
	                			state = "<span class='status'>접수예정</span>";
	                		} else if (currentTime > substDate && currentTime < subfnDate) {
	                			state = "<span class='status'>접수중</span>";
	                		} else if (currentTime > subfnDate && currentTime < finalDate) {
	                			state = "<span class='status start-status'>진행중</span>";
	                		} else if (currentTime > finalDate) {
	                			state = "<span class='status end-status'>종료</span>";
	                		}
	                		let str = "<li><a href='fcjava.game?page=2&game_num="+data[i].num+"' class='game-card'><div class='card-thumb'><div class='game-status'>"+state+"</div>";
	                		let str1 = "<img src='https://cdn.life-sports.kr/news/photo/202401/2333_2856_3017.jpg'/></div><div class='card-title'><article class='gameDate'><p class='m'> "+month+"월</p><p class='d'> "+day+" </p></article><div class='title-holder'><h3>"+data[i].name+"</h3>";
	                		let str2 = "<p> "+hours+":"+minutes+"  •  "+data[i].place+"  • "+data[i].type+"강</p></div></div></a></li>";
	                		
	                		$(".conten-area").append(str+str1+str2);
	                	}
	                	$(".searchResult").append("총 <strong>"+data.length+"</strong> 개");
                	} else {
                		$(".searchResult").append("총 <strong>"+data.length+"</strong> 개");
                		$(".no-search").remove();
                		$(".content").append("<div class='no-search'>검색된 결과가 없습니다.</div>");
                	}
                },
            });
		}
	})
</script>
</body>
</html>