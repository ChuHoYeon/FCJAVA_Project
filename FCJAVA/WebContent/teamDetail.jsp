<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.TeamDTO" %>
<%@ page import="com.fcjava.dto.PlayerDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%
	String sessionID = (String)session.getAttribute("ID");
	TeamDTO team = (TeamDTO) request.getAttribute("team");
	List<PlayerDTO> playerList = (List<PlayerDTO>) request.getAttribute("playerList");
	
	int year = team.getT_c_day().getYear()+1900;
	int month = team.getT_c_day().getMonth()+1;
	int date = team.getT_c_day().getDate();
	int applyCheck = 0;
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
	<form action="fcjava.team?page=apply" method="post" enctype="multipart/form-data" >
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
		        			<img alt="선수 사진" src="png/son.jpg">
		        		</div>
		        		<div class="photo-change-label">
			        		<label for="pl_pic">사진 변경</label>
			        		<input type="file" id="pl_pic" name="pl_pic" accept="image/*"/>
		        		</div>
		        	</div>
		        	<div class="player-info">
		        		<label for="back_num">희망 등번호</label>
		        		<input type="text" id="back_num" name="back_num"/>
		        		<label for="height">키(선택사항)</label>
		        		<input type="text" id="height" name="height"/>
		        		<label for="weight">몸무게(선택사항)</label>
		        		<input type="text" id="weight" name="weight"/>
		        	</div>
		        	<div>
		        		<p>선수소개(선택사항)</p>
		        		<textarea id="pl_memo" name="pl_memo"></textarea>
		        	</div>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="applycancle" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="submit" id="applygoing" class="btn btn-primary">가입하기</button>
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
				System.out.println(applyCheck);
				%>
						<button type="button" id="team-delete" class="applyleaveBtn deleteTeam">삭제하기</button>
						<button type="button" id="team-leave" class="applyleaveBtn leaveTeam">탈퇴하기</button>
						<button type="button" id="team-apply" class="applyleaveBtn joinTeam">가입하기</button>
				</div>
			</div>
			<!-- main -->
			<div class="right-info">
				<div class="team-tab">
					<div class="tab tab-focus"><p>선수</p></div>
					<div class="tab"><p>일정</p></div>
					<div class="tab"><p>기록</p></div>
					<div class="tab"><p>포메이션</p></div>
					<div class="tab"><p>게시판</p></div>
				</div>
				<div>
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
					<% for(PlayerDTO player : playerList) {
						int p_year = player.getPl_ap_date().getYear()+1900;
						int p_month = player.getPl_ap_date().getMonth()+1;
						int p_date = player.getPl_ap_date().getDate();
						String playerDate = p_year+"/"+p_month+"/"+p_date;
					%>
						<li class="player">
							<div class="player-name">
								<div class="player-img"><img src="png/defaultLogo.png" /></div>
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
			</div>
		</div>
	</main>

	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	
	<!-- teamDetail js -->
	<script src="js/teamDetail.js"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    $(document).ready(function(){
       	const sessionID = <%= sessionID %>;
       	const t_num = "<%= team.getT_num() %>";
       	const teamName = "<%= team.getT_name() %>";
    	//가입하기 버튼
        $("#team-apply").on("click", function() {
        	let alrim = confirm("["+teamName+"]팀에 가입 하시겠습니까?");
        	if(alrim) {
        		if(sessionID != null) {
        			$.ajax({
        				url : 'fcjava.team?page=teamApplyCheck',
           				data: {id : sessionID},
           				success : function(result) {
           					console.log(result);
           					if(result === "OK"){
           	        			$("#staticBackdrop").modal('show');
           					} else {
           						alert("팀3개 소속. 더이상 가입 불가");
           					}
           				},
            		});
        		} else {
        			let loging = confirm("팀 가입을 위해서는 로그인이 필요합니다. 로그인 후에 팀에 가입하세요.");
        			if(loging) window.location.href="login.jsp";
        		}
        	}
    	});
    	//탈퇴하기 버튼
    	$("#team-leave").on("click", function() {
    		let alrim = confirm("["+teamName+"]팀에서 탈퇴 하시겠습니까?");
    		if(alrim) {
    			if(sessionID != null) {
    				alter("탈퇴하셨습니다.");
    				//window.location.href="fcjava.team?page=secession&t_num="+t_num+"&id="+sessionID;
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
    	//신청 가입버튼
		$("#applygoing").on("submit", function() {
			let check = false;
			const pl_pic = $("input[name='pl_pic']").val();
			const back_num = $("input[name='back_num']").val();
			const height = $("input[name='height']").val();
			const weight = $("input[name='weight']").val();
			const pl_memo = $("textarea[name='pl_memo']").val();
			
			if(back_num == '' || height == '' || weight == '') {
				alert("선수정보를 입력해주세요");
				check = false
				return check;
			} else {
				alert("가입되었습니다.");
				check = true
				return check;
			}
		});
    });
	</script>
</body>
</html>