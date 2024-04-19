<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="com.fcjava.dto.PlayerDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%
	String sessionID = (String)session.getAttribute("ID");
	TeamDTO team = (TeamDTO) request.getAttribute("team");
	List<PlayerDTO> playerList = (List<PlayerDTO>) request.getAttribute("playerList");
	
	int year = team.getT_c_day().getYear()+1900;
	int month = team.getT_c_day().getMonth()+1;
	int date = team.getT_c_day().getDate();
	int applyCheck = 3;

    int[] genders = (int[]) request.getAttribute("genders"); // [0]남자, [1]여자
    int[] ages = (int[]) request.getAttribute("ages"); // [0]10대, [1]20대, [2]30대, [3]40대, [4]50대, [5]60대 이상
    int[] positions = (int[]) request.getAttribute("positions"); // [0]공격수, [1]미드필더, [2]수비수, [3]골키퍼
    
	String savePath = "/png/playerPhoto";
	ServletContext context = getServletContext();
	String sRealPath = context.getRealPath(savePath);
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
	<!-- bootstrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- teamDetail css -->
	<link rel="stylesheet" href="css/teamDetail.css" />
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<!-- 팀 가입 Modal -->
	<form action="fcjava.team?page=apply" id="applygoing" method="post" enctype="multipart/form-data" >
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel"><%= team.getT_name() %> 신청</h1>
		      </div>
		      <div class="modal-body">
		        <div id="teamApplyForm">
		        	<input type="hidden" name="t_num" value="<%= team.getT_num() %>" />
		        	<input type="hidden" name="id" value="<%= sessionID %>" />
		        	<div class="photo-area">
		        		<div class="player-photo">
		        			<img alt="선수 사진" src="png/default-profile.jpg">
		        		</div>
		        		<div class="photo-change-label">
			        		<label for="pl_pic">사진 변경</label>
			        		<input type="file" id="pl_pic" name="pl_pic" accept="image/*"/>
		        		</div>
		        	</div>
		        	<div class="player-info">
		        		<label for="back_num">희망 등번호</label>
		        		<input type="text" id="back_num" name="back_num" maxlength="3" placeholder="최대 숫자3글자"/>
		        		<label for="position">희망 포지션</label>
		        		<select name="position">
		        			<option value="공격수">공격수</option>
		        			<option value="미드필더">미드필더</option>
		        			<option value="수비수">수비수</option>
		        			<option value="골키퍼">골키퍼</option>
		        		</select>
		        		<label for="height">키</label>
		        		<input type="text" id="height" name="height" maxlength="3" placeholder="선택사항"/>
		        		<label for="weight">몸무게</label>
		        		<input type="text" id="weight" name="weight" maxlength="3" placeholder="선택사항"/>
		        	</div>
		        	<div class="player-intro">
		        		<p>선수소개</p>
		        		<textarea id="pl_memo" name="pl_memo" placeholder="선택사항" maxlength="50"></textarea>
		        	</div>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="applycancle" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary">가입하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	<!-- 팀 가입 Modal end -->
	<main>
		<div class="teamArea">
			<!-- side -->
			<div class="left-teamInfo">
				<div class="side-top">
					<div class="side-player">
						<span class="material-symbols-outlined">person</span>
						<span><%=playerList.size() %>/<%=team.getMax_p_num() %></span>
					</div>
				</div>
				<div class="team-img"><img src="png/teamlogo3.png"/></div>
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
					<p><a href="https://www.naver.com"><%= team.getT_sns() %></a></p>
					<% } else { %>
					<p>등록된 홈페이지가 없습니다.</p>
					<% } %>
				</div>
				<div class="subArea">
				<%
				for(int i=0; i<playerList.size(); i++) {
					if(playerList.get(i).getId().equals(sessionID) && team.getId().equals(sessionID)){
						applyCheck = 1; break;
					}else if(playerList.get(i).getId().equals(sessionID)){
						applyCheck = 2; break;
					}
				}
				switch (applyCheck){
					case 1:%><button type="button" id="team-delete" class="applyleaveBtn deleteTeam">삭제하기</button><%break;
					case 2:%><button type="button" id="team-leave" class="applyleaveBtn leaveTeam">탈퇴하기</button><%break;
					case 3:default:%><button type="button" id="team-apply" class="applyleaveBtn joinTeam">가입하기</button><%break;
				}
				%>
				</div>
				<div class="stopApply"></div>
			</div> <!-- class="left-teamInfo" -->
			<!-- main -->
			<div class="right-info">
				<div class="team-tab">
					<div class="tab tab-focus"><p>선수</p></div>
					<div class="tab"><p>일정</p></div>
					<div class="tab"><p>기록</p></div>
					<div class="tab"><p>포메이션</p></div>
					<div class="tab"><p>게시판</p></div>
				</div>
				<div class="team-tab-info">
					<div class="tab-content player-content">
						<div class="chart-area">
							<div class="gender-chart"><canvas id="genderChart" ></canvas></div>
							<div class="age-chart"><canvas id="ageChart"></canvas></div>
							<div class="position-chart"><canvas id="positionChart"></canvas></div>
						</div>
						<div class="player-number">
							<label>팀 선수 수 <strong><%= playerList.size() %></strong> 명</label>
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
						<%for(PlayerDTO player : playerList) {
							int p_year = player.getPl_ap_date().getYear()+1900;
							int p_month = player.getPl_ap_date().getMonth()+1;
							int p_date = player.getPl_ap_date().getDate();
							String playerDate = p_year+"/"+p_month+"/"+p_date;
	
							String sFilePath = "/FCJAVA/png/playerPhoto/" + player.getPl_pic();
							if(player.getPl_pic() == null) sFilePath="png/default-profile.jpg";
						%>
							<li class="player">
								<div class="player-name">
									<div class="player-img"><img src="<%=sFilePath %>" /></div>
									<div><%= player.getId() %></div>
									<% if(team.getId().equals(player.getId())) { %>
									<div class="player-captain"><img alt="팀장 아이콘" src="png/captain.png"></div>
									<% } %>
								</div>
								<div class="player-backnum"><%= player.getBack_num() %></div>
								<div class="player-hei"><% if(player.getHeight() != null) { out.print(player.getHeight()+"cm");} else { out.print("미입력"); }%></div>
								<div class="player-wei"><% if(player.getWeight() != null) { out.print(player.getWeight()+"cm");} else { out.print("미입력"); }%></div>
								<div class="player-memo">
									<div class="memo-in">
										<% if(player.getPl_memo() != null) { %>
										<span class="player-me" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-trigger="hover" data-bs-content="<%= player.getPl_memo() %>"><%= player.getPl_memo() %></span>
										<% } else { %>
										<span class="player-me"></span>
										<% } %>
									</div>
								</div>
								<div class="player-date"><%= playerDate %></div>
							</li>
						<% } %>
						</ul>
					</div>
					<div class="tab-content schedule-content">
						<h2>일정칸</h2>
					</div>
					<div class="tab-content record-content">
						<h2>기록칸</h2>
					</div>
					<div class="tab-content formation-content">
						<div class="formation-box">
							<div class="formation-slide">
								<div class="team-formation-list">
									<div class="savedformation">1</div>
									<div class="savedformation">2</div>
									<div class="savedformation">3</div>
									<div class="savedformation">4</div>
									<div class="savedformation">5</div>
									<div class="savedformation">6</div>
									<div class="savedformation">7</div>
								</div>
							</div>
							<button class="back"><span class="material-symbols-outlined">arrow_back_ios</span></button>
							<button class="next"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
						</div>
						<div class="select-formation">
							<div id="field" data-formation="433">
								<div class="player-card" data-cardid="1"></div>
								<div class="player-card" data-cardid="2"></div>
								<div class="player-card" data-cardid="3"></div>
								<div class="player-card" data-cardid="4"></div>
								<div class="player-card" data-cardid="5"></div>
								<div class="player-card" data-cardid="6"></div>
								<div class="player-card" data-cardid="7"></div>
								<div class="player-card" data-cardid="8"></div>
								<div class="player-card" data-cardid="9"></div>
								<div class="player-card" data-cardid="10"></div>
								<div class="player-card" data-cardid="11"></div>
							</div>
							<div class="formation-info">
								<div class="formation-players">
									<h3>플레이어</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-content board-content">
						<h2>게시판칸</h2>
					</div>
				</div> <!-- class="team-tab-info" -->
			</div>
		</div>
	</main>

	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	
	<!-- teamDetail js -->
	<script src="js/teamDetail.js"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
	
	<script>
    $(document).ready(function(){
       	const sessionID = <%= sessionID %>;//로그인한 아이디
       	const t_num = "<%= team.getT_num() %>"; //팀 번호
       	const teamName = "<%= team.getT_name() %>"; //팀 이름
       	const nowCount = <%=playerList.size() %>; //현재 가입한 인원
       	const maxCount = <%=team.getMax_p_num() %>; //최대 가입 인원
       	const genders = JSON.parse('<%= Arrays.toString(genders) %>');
       	const ages = JSON.parse('<%= Arrays.toString(ages) %>');
       	const positions = JSON.parse('<%= Arrays.toString(positions) %>');
       	
       	
       	if(nowCount >= maxCount) {
       		$(".applyleaveBtn").prop('disabled', true);
       		$(".applyleaveBtn").css('cursor', 'auto');
       		$(".stopApply").html("<p>더이상 가입할 수 없습니다.</p>");
       	}
       	//성별 차트
       	const genderCt = $('#genderChart');
       	const ageCt = $('#ageChart');
       	const positionCt = $('#positionChart');
       	const genderData = {
       		labels: ['남','여'],
       		datasets: [{
       			data: genders,
       			backgroundColor: ['rgba(54, 162, 235, 1)','rgba(255, 99, 132, 1)'],
       			hoverOffset: 4
       		}]
       	};
       	const ageData = {
       		labels: ['10대','20대','30대','40대','50대','60대 이상'],
       		datasets: [{
       			data: ages,
       			backgroundColor: ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(203, 170, 203, 1)','rgba(198, 219, 218, 1)'],
       			hoverOffset: 4
       		}]
       	};
       	const positionData = {
       		labels: ['공격수','미드필더','수비수','골키퍼'],
       		datasets: [{
       			data: positions,
       			backgroundColor: ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)'],
       		}]
       	};
       	const genderChart = new Chart(genderCt, {
       	  type: 'doughnut',
       	  data: genderData,
       	  options: {
       		  borderWidth: 0
       	  },
       	});
       	const agerChart = new Chart(ageCt, {
       	  type: 'doughnut',
       	  data: ageData,
       	  options: {
       		  plugins: {
       			  legend: {display: false},
       			  title: {
       				  display: true,
       				  text: '선수 나이대'
       			  }
       		  },
       		  borderWidth: 0
       	  },
       	  borderJoinStyle: 'round'
       	});
       	const positionChart = new Chart(positionCt, {
       	  type: 'bar',
       	  data: positionData,
       	  options: {
       		  plugins: {
       			  legend: {display: false},
       			  title: {
       				  display: true,
       				  text: '선호 포지션'
       			  }
       		  },
       		  scales: {
       			  x: {
       				  grid: {
       					  display: false
       				  }
       			  },
       			  y: {
       				  grid: {
       					  display: false
       				  },
       				  min: 0,
       				  ticks: {
       					  stepSize: 1
       				  }
       			  }
       		  }
       	  }
       	});
       	
    	//가입하기 버튼
        $("#team-apply").on("click", function() {
        	let alrim = confirm("["+teamName+"]팀에 가입 하시겠습니까?");
        	if(alrim) {
        		if(sessionID != null) {
        			$.ajax({
        				url : 'fcjava.team?page=teamApplyCheck',
           				data: {id : sessionID},
           				success : function(result) {
           					if(result.indexOf("OK") != -1){
           	        			$("#staticBackdrop").modal('show');
           					} else {
           						alert("팀3개 소속. 더이상 가입 불가");
           					}
           				},
            		});
        		} else {
        			let loging = confirm("팀 가입을 위해서는 로그인이 필요합니다. 로그인 후에 팀에 가입하세요.");
        			if(loging) {window.location.href="login.jsp";}
        		}
        	}
    	});
    	//탈퇴하기 버튼
    	$("#team-leave").on("click", function() {
    		let alrim = confirm("["+teamName+"]팀에서 탈퇴 하시겠습니까?");
    		if(alrim) {
    			if(sessionID != null) {
    				alert("탈퇴하셨습니다.");
    				window.location.href="fcjava.team?page=secession&t_num="+t_num+"&id="+sessionID;
    			}
    		}
		});
    	//신청 취소버튼
    	$("#staticBackdrop").on('hidden.bs.modal', function() {
			$(".player-photo").html('<img alt="선수 사진" src="png/son.jpg">');
			$("input[name='pl_pic']").val('');
			$("input[name='back_num']").val('');
			$("input[name='height']").val('');
			$("input[name='weight']").val('');
			$("textarea[name='pl_memo']").val('');
		});
    });
	</script>
</body>
</html>