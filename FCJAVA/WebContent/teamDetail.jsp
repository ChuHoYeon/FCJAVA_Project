<%@page import="com.google.gson.internal.GsonBuildConfig"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="com.fcjava.dto.PlayerDTO" %>
<%@ page import="com.fcjava.dto.TeamFormationDTO" %>
<%@ page import="com.fcjava.dto.PageDTO" %>
<%@ page import="com.fcjava.dto.TeamBoardDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.fcjava.dto.TeamGameResultDTO" %>
<%@ page import="com.fcjava.model.StringChange" %>
<%@ page import="com.google.gson.Gson" %>
<%
	String sessionID = (String)session.getAttribute("ID");
	TeamDTO team = (TeamDTO) request.getAttribute("team"); //팀 정보
	List<PlayerDTO> playerList = (List<PlayerDTO>) request.getAttribute("playerList"); //선수 목록
	List<TeamFormationDTO> teamFormations = (List<TeamFormationDTO>) request.getAttribute("teamFormations"); //포메이션 목록
	List<TeamGameResultDTO> teamGameResultList = (List<TeamGameResultDTO>) request.getAttribute("teamGameResultList"); //경기결과 목록
	List<TeamBoardDTO> teamBoardList = (List<TeamBoardDTO>) request.getAttribute("teamBoardList"); //게시판 목록
	PageDTO pageInfo = (PageDTO) request.getAttribute("pageInfo"); //게시판 페이지 정보
	String boardpage = request.getParameter("boardpage");
	int tabNumber = (Integer) request.getAttribute("tabNumber");
	
    int[] genders = (int[]) request.getAttribute("genders"); // [0]남자, [1]여자
    int[] ages = (int[]) request.getAttribute("ages"); // [0]10대, [1]20대, [2]30대, [3]40대, [4]50대, [5]60대 이상
    
    int[] positions = (int[]) request.getAttribute("positions"); // [0]공격수, [1]미드필더, [2]수비수, [3]골키퍼
    
	boolean isTeamPlayer = false;
	int year = team.getT_c_day().getYear()+1900;
	int month = team.getT_c_day().getMonth()+1;
	int date = team.getT_c_day().getDate();
   	String formationChk = "";
	String formationName = "";
	boolean firstFormation = true;
	
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	int applyCheck = 3;
	for(int i=0; i<playerList.size(); i++) {
		if(playerList.get(i).getId().equals(sessionID) && team.getId().equals(sessionID)){
			applyCheck = 1; break;
		}else if(playerList.get(i).getId().equals(sessionID)){
			applyCheck = 2; break;
		}
	}
	
	JSONArray formationjsonArray = new JSONArray();
	for (TeamFormationDTO formation : teamFormations) {
	    JSONObject jsonFormation = new JSONObject();
	    jsonFormation.put("formation", formation.getFormation());
	    jsonFormation.put("formation_name", formation.getFormation_name());
	    jsonFormation.put("position_num", formation.getPosition_num());
	    jsonFormation.put("player_id", formation.getPlayer_id());
	    for(PlayerDTO player : playerList) {
	    	if(player.getId().equals(formation.getPlayer_id())) { 
	    		if(player.getPl_pic() !=null){
	    			jsonFormation.put("player_pic", "/FCJAVA/png/playerPhoto/"+player.getPl_pic());break;
    			}else{
    				jsonFormation.put("player_pic", "png/default-profile.jpg");
   				}
    		} else {jsonFormation.put("player_pic", "png/default-profile.jpg");}
	    }
	    formationjsonArray.add(jsonFormation);
	}
	
	String jsonTeamBoardList = new Gson().toJson(teamBoardList);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC JAVA</title>
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
<script type="text/javascript">
	let formationjsonArray = <%= formationjsonArray%>;
	let tabNumber = <%=tabNumber%>;
	let jsonTeamBoardList = <%= jsonTeamBoardList %>;
</script>
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
			<div class="left-teamInfo">
				<div class="side-top">
					<div class="side-player">
						<span class="material-symbols-outlined">person</span>
						<span><%=playerList.size() %>/<%=team.getMax_p_num() %></span>
					</div>
				</div>
				<div class="team-img">
				<% if(team.getT_logo() != null){ %>
					<img src="/FCJAVA/png/playerPhoto/<%=team.getT_logo()%>"/>
				<% }else{ %>
					<img src="png/defaultLogo.png"/>
				<% } %>
				</div>
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
					<p><a href="<%= team.getT_sns() %>" target="_blank" rel="noopener noreferrer"><%= team.getT_sns() %></a></p>
					<% } else { %>
					<p>등록된 홈페이지가 없습니다.</p>
					<% } %>
				</div>
				<div class="subArea">
				<%
				
				switch (applyCheck){
					case 1:%><button type="button" id="team-delete" class="applyleaveBtn deleteTeam">삭제하기</button><%break;
					case 2:%><button type="button" id="team-leave" class="applyleaveBtn leaveTeam">탈퇴하기</button><%break;
					case 3:default:%><button type="button" id="team-apply" class="applyleaveBtn joinTeam">가입하기</button><%break;
				}
				%>
				</div>
				<div class="stopApply"></div>
			</div><!-- class="left-teamInfo" -->
			<!-- --------------------------- -->
			<div class="right-info">
				<div class="team-tab">
					<div class="tab"><p>선수</p></div>
					<div class="tab"><p>일정</p></div>
					<div class="tab"><p>결과</p></div>
					<div class="tab"><p>포메이션</p></div>
					<div class="tab"><p>게시판</p></div>
				</div><!-- 탭 -->
				
				<div class="team-tab-info">
					<div class="tab-content player-content">
						<div class="chart-area">
							<div class="gender-chart"><canvas id="genderChart" ></canvas></div>
							<div class="age-chart"><canvas id="ageChart"></canvas></div>
							<div class="position-chart"><canvas id="positionChart"></canvas></div>
						</div><!-- 선수 차트 -->
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
							String playerDate = p_year+"-"+p_month+"-"+p_date;
							if(player.getId().equals(sessionID)) isTeamPlayer = true;
	
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
					</div><!-- 선수 -->
					
					<div class="tab-content schedule-content">
						<h2>일정칸</h2>
					</div><!-- 일정 -->
					
					<div class="tab-content record-content">
					<%if(!teamGameResultList.isEmpty()) { 
					  	for(TeamGameResultDTO gameResult : teamGameResultList){
					  		int gameYear = gameResult.getGame_date().getYear()+1900;
					  		String gameMonth = StringChange.lengthCheck(String.valueOf(gameResult.getGame_date().getMonth()+1));
					  		String gameDate = StringChange.lengthCheck(String.valueOf(gameResult.getGame_date().getDate()));
					  		String gameDay = StringChange.getDay(gameResult.getGame_date().getDay());
					  		String gameTime = StringChange.lengthCheck(String.valueOf(gameResult.getGame_date().getHours()))+":"+StringChange.lengthCheck(String.valueOf(gameResult.getGame_date().getMinutes()));
					%>
						<div class="gameResult">
							<div class="gameTitle">
								<%= gameResult.getGame_name() %> <label><%if(gameResult.getGame_type()==2){out.print("결승전");}else{ out.print(gameResult.getGame_type()+"강전"); }%></label>
							</div>
							<div class="gameResultInfo">
								<div class="gameDate">
									<p><%= gameYear+"."+gameMonth+"."+gameDate+"("+gameDay+")"+gameTime %></p>
									<p><%= gameResult.getGame_place() %></p>
								</div>
								<div class="team1">
									<div class="team1Name"><%= gameResult.getTeam1_name() %></div>
									<div class="team1Logo">
										<% if(gameResult.getTeam1_logo() != null){ %>
										<img alt="" src="/FCJAVA/png/playerPhoto/<%=gameResult.getTeam1_logo()%>">
										<% }else{ %>
										<img alt="" src="/FCJAVA/png/defaultLogo.png">
										<% } %>
									</div>
								</div>
								<div class="center">
									<span class="score"><%= gameResult.getTeam1_score() %></span> :
									<span class="score"><%= gameResult.getTeam2_score() %></span>
								</div>
								<div class="team2">
									<div class="team2Logo">
										<% if(gameResult.getTeam2_logo() != null){ %>
										<img alt="" src="/FCJAVA/png/playerPhoto/<%=gameResult.getTeam2_logo()%>">
										<% }else{ %>
										<img alt="" src="/FCJAVA/png/defaultLogo.png">
										<% } %>
									</div>
									<div class="team2Name"><%= gameResult.getTeam2_name() %></div>
								</div>
							</div>
						</div>
					<% }} else { %>
						<div class="notResult">경기 결과가 없습니다.</div>
					<% } %>
					</div><!-- 기록 -->
					
					<div class="tab-content formation-content">
						<div class="showFormation">
							<div class="formation-box">
								<div class="formation-slide">
									<div class="team-formation-list">
									<%
									if(!teamFormations.isEmpty() || team.getId().equals(sessionID)){
									for(TeamFormationDTO formation : teamFormations) {
										if(!formationName.equals(formation.getFormation_name())) {
											formationName = formation.getFormation_name();
											formationChk = formation.getFormation();
											if(firstFormation){%>
										<div class="savedformation showFor" data-formation="<%=formation.getFormation() %>" data-formationName="<%=formation.getFormation_name()%>">
										<%}else{ %>
										<div class="savedformation" data-formation="<%=formation.getFormation() %>" data-formationName="<%=formation.getFormation_name()%>">
										<%} %>
											<div class="foramtionName"><%=formation.getFormation() %></div>
											<div class="formationTitle"><%=formation.getFormation_name() %></div>
										</div>	
									<% firstFormation = false;}} %>
									<% if(team.getId().equals(sessionID)){ %>
										<div class="createFormationBtn">
											<div>새 포메이션</div>
											<div><span class="material-symbols-outlined">add</span></div>
										</div>
									<% } 
									}else{%>
										<div class="notFormation">생성된 포메이션이 없습니다.</div>
								<%  } %>
									</div>
								</div>
								<button class="back"><span class="material-symbols-outlined">arrow_back_ios</span></button>
								<button class="next"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
							</div>
							<div class="select-formation">
								<div class="field">
									<div class="player-card showPlayer" data-cardid="0"></div>
									<div class="player-card showPlayer" data-cardid="1"></div>
									<div class="player-card showPlayer" data-cardid="2"></div>
									<div class="player-card showPlayer" data-cardid="3"></div>
									<div class="player-card showPlayer" data-cardid="4"></div>
									<div class="player-card showPlayer" data-cardid="5"></div>
									<div class="player-card showPlayer" data-cardid="6"></div>
									<div class="player-card showPlayer" data-cardid="7"></div>
									<div class="player-card showPlayer" data-cardid="8"></div>
									<div class="player-card showPlayer" data-cardid="9"></div>
									<div class="player-card showPlayer" data-cardid="10"></div>
								</div>
								<div class="formation-info">
								</div>
							</div>
						</div><!-- class="showFormation" -->
						<div class="createFormation">
							<form id="inFormation" action="fcjava.team?page=createFormation" method="post">
								<input type="hidden" name="t_num" value="<%=team.getT_num() %>"/>
								<div class="formationInput">
									<div class="input-group input-group-sm">
										<select id="selectFormation" name="formation" class="form-select">
											<option>3-1-4-2</option>
											<option>4-1-4-1</option>
											<option>4-4-2</option>
										</select>
										<input type="text" name="formation_name" class="form-control" placeholder="새 포메이션 이름"/>
										<button type="button" class="cancleCreateFormation btn btn-outline-secondary"><span class="material-symbols-outlined">undo</span></button>
										<button type="submit" class="saveFormation btn btn-outline-secondary"><span class="material-symbols-outlined">save</span></button>
									</div>
								</div>
								<div class="select-formation">
									<div class="field">
									<% for (int i=0; i<11; i++) { %>
										<div class="player-card createPlayer" data-cardid="<%=i%>">
											<div class="img-box">
												<!-- <img src="png/uniform.png" /> -->
												<img src="png/default-profile.jpg" />
											</div>
											<div class="forPlaterName"></div>
											<input type="hidden" name="player_id" />
										</div>
									<% } %>
									</div>
									<div class="selectPlayers">
									<% for(PlayerDTO player:playerList){ 
										String sFilePath = "/FCJAVA/png/playerPhoto/" + player.getPl_pic();
										if(player.getPl_pic() == null) sFilePath="png/default-profile.jpg";%>
										<div class="formation-players">
											<div class="for-player-img"><img alt="선수사진" src="<%=sFilePath %>" /></div>
											<div class="for-player-name"><%=player.getId() %></div>
										</div>
									<%} %>
									</div>
								</div>
							</form>
						</div><!-- class="createFormation" -->
					</div><!-- 포메이션 -->
					<div class="tab-content board-content">
					<% if(isTeamPlayer) { %>
						<div class="board_list">
							<div class="post-area">
								<button type="button" id="writeBoardBtn" class="writeBtn">글쓰기</button>
							</div>
							<table class="boardTable">
								<colgroup>
									<col class="boardNumber">
									<col class="boardTitle">
									<col class="boardWriter">
									<col class="boardCreateDate">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>등록일</th>
									</tr>
								</thead>
							<% if(teamBoardList != null && listCount > 0){ %>
								<tbody>
									<%
									for(int i=0;i<teamBoardList.size();i++){
										int boardMonth = teamBoardList.get(i).getBoard_createdate().getMonth()+1;
										int boardDate = teamBoardList.get(i).getBoard_createdate().getDate();
									%>
								<tr>
									<td><%= teamBoardList.get(i).getBoard_num() %></td>
									<td class="showBoardDetail" data-boardNum="<%= teamBoardList.get(i).getBoard_num() %>"><%= teamBoardList.get(i).getBoard_title() %></td>
									<td><%= teamBoardList.get(i).getBoard_id() %></td>
									<td><%= StringChange.lengthCheck(String.valueOf(boardMonth)) + "-" + StringChange.lengthCheck(String.valueOf(boardDate)) %></td>
								</tr>
								<% } %>
								</tbody>
								<% } %>
							</table>
							<div>
								<ul class="page_line">
								<%if(nowPage<=1){ %>
								<li>[이전]</li>
								<%}else{ %>
								<li><a href="fcjava.team?page=detail&teamNumber=<%=team.getT_num() %>&tabNumber=4&boardpage=<%=nowPage-1 %>">[이전]</a></li>
								<%} %>
						
								<%for(int a=startPage;a<=endPage;a++){
										if(a==nowPage){%>
								<li>[<%=a %>]</li>
								<%}else{ %>
								<li><a href="fcjava.team?page=detail&teamNumber=<%=team.getT_num() %>&tabNumber=4&boardpage=<%=a %>">[<%=a %>]</a></li>
								<%} %>
								<%} %>
						
								<%if(nowPage>=maxPage){ %>
								<li>[다음]</li>
								<%}else{ %>
								<li><a href="fcjava.team?page=detail&teamNumber=<%=team.getT_num() %>&tabNumber=4&boardpage=<%=nowPage+1 %>">[다음]</a></li>
								<%} %>
								</ul>
							</div>
						</div>
						<div class="board_write">
							<form action="fcjava.team?page=writeBoard" method="post" enctype="multipart/form-data">
								<input type="hidden" name="t_num" value="<%=team.getT_num()%>" />
								<input type="hidden" name="board_id" value="<%=sessionID%>" >
								<div class="b_write">
									<div class="b_label">게시판 글쓰기</div>
									<div class="b_title">
										<input type="text" name="board_title" maxlength="45" required="required" placeholder="글 제목"/>
									</div>
									<div class="b_writer"><%=sessionID%></div>
									<div class="b_content"><textarea name="board_content" id="editor" placeholder="글 내용" required="required"></textarea></div>
									<div class="b_file"><input type="file" class="form-control" name="board_file" accept="image/*" /></div>
								</div>
								<div class="write_bottom">
									<input type="button" id="boardCancleBtn" class="writeBtn" value="취소" />
									<input type="submit" class="writeBtn" value="작성완료" />
								</div>
							</form>
						</div>
						<div class="board_detail">
						</div>
					<% }else{ %>
						<div class="warningText">
							<img src="png/trar.png"/>
							<p>이 게시판은 팀에 소속된 선수만 접근할 수 있습니다.</p>
						</div>
					<% } %>
					</div><!-- 게시판-->
					
				</div><!-- class="team-tab-info" -->
			</div><!-- class="right-info" -->
		</div><!-- class="teamArea" -->
	</main>

	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	
	<script>
    const sessionID = '<%= sessionID %>';//로그인한 아이디
  	const t_num = "<%= team.getT_num() %>"; //팀 번호
  	const teamName = "<%= team.getT_name() %>"; //팀 이름
  	const nowCount = <%=playerList.size() %>; //현재 가입한 인원
  	const maxCount = <%=team.getMax_p_num() %>; //최대 가입 인원
  	const genders = JSON.parse('<%= Arrays.toString(genders) %>');
  	const ages = JSON.parse('<%= Arrays.toString(ages) %>');
  	const positions = JSON.parse('<%= Arrays.toString(positions) %>');
	</script>
	<!-- teamDetail js -->
	<script src="js/teamDetail.js"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
</body>
</html>