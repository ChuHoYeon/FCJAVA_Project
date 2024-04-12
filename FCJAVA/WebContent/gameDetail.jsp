<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.GameDTO" %>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="com.fcjava.dto.GameResultDTO" %>
<%@ page import="com.fcjava.dto.GameApplyTeam" %>
<%@ page import="com.fcjava.model.StringChange" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.*" %>
<%
	String sessionID = (String) session.getAttribute("ID");
	GameDTO game =(GameDTO) request.getAttribute("game");
	
	StringChange stringChange = new StringChange();
	//나의 팀 리스트
  	JSONArray myTeamListArray = new JSONArray();
	List<TeamDTO> myTeamList = (List<TeamDTO>) session.getAttribute("MyTeamList");
	if (myTeamList != null) {
        for (TeamDTO team : myTeamList) {
            JSONObject teamObject = new JSONObject();
            teamObject.put("num", team.getT_num());
            teamObject.put("name", team.getT_name());
            myTeamListArray.add(teamObject);
        }
    }
	String myTeamNameList = myTeamListArray.toJSONString();

	//신청 팀 리스트
	JSONArray applyTeamArray = new JSONArray();
	List<GameApplyTeam> applyTeamList = (List<GameApplyTeam>) request.getAttribute("applyTeamList");
	if (applyTeamList != null) {
        for (GameApplyTeam applyteam : applyTeamList) {
            JSONObject teamObject = new JSONObject();
            teamObject.put("num", applyteam.getGame_num());
            teamObject.put("name", applyteam.getT_name());
            applyTeamArray.add(teamObject);
        }
    }
	String applyTeamNameList = applyTeamArray.toJSONString();
	
	//게임 결과
	List<GameResultDTO> gameResultList = (List<GameResultDTO>) request.getAttribute("gameResultList");
	
	//신청 팀 비율
	int per = (applyTeamList.size() * 100) / game.getGame_type();
	String subst_date = game.getGame_subst_date();
	String subfn_date = game.getGame_subfn_date();
	String st_date = game.getGame_st_date();
	String fn_date = game.getGame_fn_date();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>대회상세페이지</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="css/gameDetail.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	
	<!-- Modal -->
	<div class="modal" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h1 class="modal-title fs-5" id="exampleModalLabel"><%= game.getGame_name() %></h1>
	      	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<%if(myTeamList != null){%>
      		<p>참가할 팀을 선택해주세요.</p>
			<ul class="teamList">
   			<% for (TeamDTO team : myTeamList){ %>
   				<li>
	   				<a href="fcjava.game?page=apply&game_num=<%= game.getGame_num() %>&team_num=<%= team.getT_num() %>" class="teamChoice">
		      			<div class="apply_team_area">
							<div class="teamLogo">
								<img src="png/defaultLogo.png" />
							</div>
							<div class="applyteamNameModal"><%= team.getT_name() %></div>
						</div>
					</a>
				</li>
   			<% }} else {out.print("<p>참가 할 수 있는 팀이 없습니다.</p>");} %>
	      	</ul>
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal -->
	
	<main class="gameInfo_Main">
		<div class="top-title-area">
			<div class="top-title">
				<button class="back-btn"><img alt="" src="png/arrow-left.svg"></button>
				<h3><%= game.getGame_name() %></h3>
			</div>
		</div>
		<div class="gameDetail_content">
			<section class="gameMain_area">
				<div class="img_area">
					<img src="https://png.pngtree.com/thumb_back/fw800/background/20230521/pngtree-4-tee-wallpapers-for-footballers-with-highresolution-image_2669464.jpg"/>
				</div>
				<% if(gameResultList == null) { %>
				<h4>참가팀 (<%= applyTeamList.size() %>)</h4>
				<div class="main_bottom">
					<% if(applyTeamList.size() > 0) { %>
					<ul class="teamList">
 					<%
					    for(GameApplyTeam team : applyTeamList) {
					%>
						<li>
						<a href="#<%= team.getGame_num() %>">
							<div class="apply_team_area">
									<div class="teamLogo">
										<img src="png/defaultLogo.png" />
									</div>
									<div class="applyteamName"><%= team.getT_name() %></div>
									<div class="applyDate">신청일 <%= team.getGame_apply_date().substring(0, team.getGame_apply_date().length()-3) %></div>
							</div>
						</a>
						</li>
					<%
					    }
					%>
					</ul>
					<% } else { %>
					<div class="no-apply"> 참가 신청한 팀이 없습니다.</div>
					<% } %>
				</div>
				<% } %>
			</section>
			<aside class="gameApply_area">
				<div class="apply_content">
					<div class="game_info">
						<span class="game_label">대회 타입</span>
						<div class="game_data">토너먼트 <%= game.getGame_type() %>강</div>
						<span class="game_label">대회 장소</span>
						<div class="game_data"><%= game.getGame_place() %></div>
						<span class="game_label">접수 기간</span>
						<div class="game_data"><%= game.getGame_subst_date().substring(0, game.getGame_subst_date().length()-5) %><br>~ <%= game.getGame_subfn_date().substring(0, game.getGame_subfn_date().length()-5) %></div>
						<span class="game_label">대회 기간</span>
						<div class="game_data"><%= game.getGame_st_date().substring(0, game.getGame_st_date().length()-5) %><br>~ <%= game.getGame_fn_date().substring(0, game.getGame_fn_date().length()-5) %></div>
						<span class="game_label">대회 정보</span>
						<div class="game_data"><% if(game.getGame_memo() != null) {out.print(game.getGame_memo());}%></div>
					</div>
					<div class="bar-container">
					    <div id="content_bar" class="bar"></div>
					    <div class="content_int"><%= per %>%</div>
					</div>
					<div class="apply_btn_area">
						<button type="button" class="apply_btn apply">신청 하기</button>
					</div>
				</div>
			</aside>
		</div>
		<% if(gameResultList != null) {%>
		<div class="gameResult_content">
			<h4>경기 결과</h4>
				<% if(gameResultList.size() > 0) { %>
					<ul class="resultList">
						<% 
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						for(GameResultDTO result : gameResultList) {
							Date gameDate = dateFormat.parse(result.getGame_date());
							String month = String.valueOf(gameDate.getMonth()+1);
							String date = String.valueOf(gameDate.getDate());
							String day = stringChange.getDay(gameDate.getDay());
							String hours = String.valueOf(gameDate.getHours());
							String minutes = String.valueOf(gameDate.getMinutes());
							String time = stringChange.lengthCheck(month)+"."+stringChange.lengthCheck(date)+" "+day+" "+stringChange.lengthCheck(hours)+":"+stringChange.lengthCheck(minutes);
							
							String team1 ="";
							String team2 ="";
							for(GameApplyTeam applyteam : applyTeamList){
								if(applyteam.getT_num() == result.getTeam1_num()){
									team1 = applyteam.getT_name();
								} else if(applyteam.getT_num() == result.getTeam2_num()){
									team2 = applyteam.getT_name();;
								}
							}
						%>
						<li>
							<div class="resultDate">
								<div><% if(result.getGame_type()==2){out.print("결승전");}else{out.print(result.getGame_type()+"강전");} %></div>
								<div><%= time %></div>
							</div>
							<div class="resultTeamList">
								<div class="resultTeam">
									<div class="resultTeamName">
										<div class="resultTeamLogo"><img alt="팀 로고" src="png/defaultLogo.png"></div>
										<div class="TeamName"><%= team1 %></div>
									</div>
									<div class="score"><%= result.getTeam1_score() %></div>
								</div>
								<div class="resultTeam">
									<div class="resultTeamName">
										<div class="resultTeamLogo"><img alt="팀 로고" src="png/teamlogo4.png"></div>
										<div class="TeamName"><%= team2 %></div>
									</div>
									<div class="score"><%= result.getTeam2_score() %></div>
								</div>
							</div>
						</li>
						<%
						}
						%>
					</ul>
				<% } else { %>
					<div style="text-align: center;">경기가 종료되었습니다. 결과가 준비되는 동안 잠시만 기다려주세요</div>
				<% } %>
		</div>
		<% } %>
	</main>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
<script>
	let per = <%= per %>;
	const subst_date = new Date("<%= subst_date %>");
	const subfn_date = new Date("<%= subfn_date %>");
	const st_date = new Date("<%= st_date %>");
	const fn_date = new Date("<%= fn_date %>");
	const myTeamNameList = <%= myTeamNameList %>;
	const applyTeamNameList = <%= applyTeamNameList %>;
	let duplication = false;
	let duplicationName = "";
	let duplicationNumber;
	let nowDate = new Date();
	let $scores = $('.score');
	
	$("#content_bar").css("width", per+"%");
	
	for(let i in myTeamNameList) {
		for(let j in applyTeamNameList) {
			if(myTeamNameList[i].name == applyTeamNameList[j].name) {
				duplication = true;
				duplicationName = myTeamNameList[i].name;
				duplicationNumber = myTeamNameList[i].num;
			}
		}
	}
	
	if(nowDate < subst_date) {
		$(".apply_btn").prop("disabled", true);
		$(".apply_btn").text("접수 예정");
		$(".apply_btn").addClass("ready-apply");		
	}
	else if(nowDate > subst_date && nowDate < subfn_date && duplication) {
		$(".apply_btn").text("신청 취소");
		$(".apply_btn").addClass("cancel-apply");
		$(".apply_btn").removeClass("apply");
	}
	else if(nowDate > subfn_date && nowDate < st_date || (nowDate > subst_date && nowDate < subfn_date && per == 100)) {
		$(".apply_btn").prop("disabled", true);
		$(".apply_btn").text("접수 마감");
		$(".apply_btn").addClass("end-apply");
	}
	else if(nowDate > st_date && nowDate < fn_date) {
		$(".apply_btn").prop("disabled", true);
		$(".apply_btn").text("진행중");
		$(".apply_btn").addClass("ready-apply");
	}
	else if(nowDate > fn_date || (nowDate > subfn_date && per < 100) ) {
		$(".apply_btn").prop("disabled", true);
		$(".apply_btn").text("종료");
		$(".apply_btn").addClass("end-apply");
	}
	
	for (var i = 0; i < $scores.length - 1; i += 2) {
	    let $score1 = $($scores[i]);
	    let $score2 = $($scores[i + 1]);
	    
	    let score1 = parseInt($score1.text());
	    let score2 = parseInt($score2.text());
	    
	    if (score1 > score2) {
	      $score1.addClass('win');
	    } else if (score1 < score2) {
	      $score2.addClass('win');
	    }
	  }
	
	//신청버튼
	$(".apply").click(function() {
		const sessionID = <%= sessionID %>;
		if (sessionID == null){
			const result = confirm("로그인해!");
			if(result){
				window.location.href="login.jsp";
				return false;
			}
		} else {
			$('#confirmModal').modal('show');			
		}
		
	})
	//신청버튼 - 팀선택
	$(".teamChoice").click(function(event) {
		let teamName = $(this).find(".applyteamNameModal").text();
		let alreadyApplied = false;
		$(".applyteamName").each(function(index, item) {
			let applyTeamName = $(item).text();
			if (teamName == applyTeamName) {
				alreadyApplied=true;
				return false;
			}
		});
		if (alreadyApplied) {
		    event.preventDefault();
		    alert("이미 참가한 팀입니다.");
		} else {
		    alert("참가 완료!");
		    $("#confirmModal").modal("hide");
		};
	})
	//취소 버튼
	$(".cancel-apply").on("click", function() {
		const gameNumber = <%= game.getGame_num() %>;
		const result = confirm("취소하시겠습니까?");
		if (result) {
			alert("취소!");
			const url = "fcjava.game?page=applyCancel&game_num="+gameNumber+"&team_num="+duplicationNumber;
			window.location.href = url;
		}
	});
	$(".back-btn").on("click", function() {
		//window.location.href = "fcjava.game?page=gameList";
		window.history.back();
	})
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>