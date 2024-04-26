<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fcjava.dto.TeamDTO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<TeamDTO> teamList = (List<TeamDTO>) request.getAttribute("teamList");
	int totalTeam = teamList.size();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String jsonTeam = new Gson().toJson(teamList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>팀 목록</title>
    <!--구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!--구글 아이콘-->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <!--jQuery url-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
	<!-- teamlist -->
    <script src="js/teamlist.js"></script>
    <link rel="stylesheet" type="text/css" href="css/teamlist.css">
</head>
<script>
	let teamList = <%= jsonTeam%>;
</script>
<body>
    <!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <section>
        <div class="cont">
            <div class="myteamlabel">팀 목록</div>
            <form class="teamsearch">
                <div class="slabel">
                    <h4>연고지</h4>
                    <input type="checkbox" name="" id="ckb_Gyeonggi" value="경기도" />
                    <label for="ckb_Gyeonggi" class="checkbox_set">경기도</label>
                    <input type="checkbox" name="city" id="ckb_Gangwon" value="강원도" />
                    <label for="ckb_Gangwon" class="checkbox_set">강원도</label>
                    <input type="checkbox" name="city" id="ckb_Chungbuk" value="충청북도" />
                    <label for="ckb_Chungbuk" class="checkbox_set">충청북도</label>
                    <input type="checkbox" name="city" id="ckb_Chungnam" value="충청남도" />
                    <label for="ckb_Chungnam" class="checkbox_set">충청남도</label>
                    <input type="checkbox" name="city" id="ckb_Jeollabuk" value="전라북도" />
                    <label for="ckb_Jeollabuk" class="checkbox_set">전라북도</label>
                </div>
                <div id="city2">
                    <input type="checkbox" name="city" id="ckb_Jeollanam" value="전라남도" />
                    <label for="ckb_Jeollanam" class="checkbox_set">전라남도</label>
                    <input type="checkbox" name="city" id="ckb_Gyeongbuk" value="경상북도" />
                    <label for="ckb_Gyeongbuk" class="checkbox_set">경상북도</label>
                    <input type="checkbox" name="city" id="ckb_Gyeongnam" value="경상남도" />
                    <label for="ckb_Gyeongnam" class="checkbox_set">경상남도</label>
                    <input type="checkbox" name="city" id="ckb_Jeju" value="제주도" />
                    <label for="ckb_Jeju" class="checkbox_set">제주도</label>
                </div>
                <div class="acweek">
                    <h4>활동시간</h4>
                    <input type="checkbox" name="week" id="ckb_mon" value="월" />
                    <label for="ckb_mon" class="checkbox_set">월</label>
                    <input type="checkbox" name="week" id="ckb_tue" value="화" />
                    <label for="ckb_tue" class="checkbox_set">화</label>
                    <input type="checkbox" name="week" id="ckb_wed" value="수" />
                    <label for="ckb_wed" class="checkbox_set">수</label>
                    <input type="checkbox" name="week" id="ckb_thu" value="목" />
                    <label for="ckb_thu" class="checkbox_set">목</label>
                    <input type="checkbox" name="week" id="ckb_fri" value="금" />
                    <label for="ckb_fri" class="checkbox_set">금</label>
                    <input type="checkbox" name="week" id="ckb_sat" value="토" />
                    <label for="ckb_sat" class="checkbox_set">토</label>
                    <input type="checkbox" name="week" id="ckb_sun" value="일" />
                    <label for="ckb_sun" class="checkbox_set">일</label>
                </div>
                <div class="slabel">
                    <h4>팀실력</h4>
                    <input type="checkbox" id="ckb_noob" value="뉴비" />
                    <label for="ckb_noob" class="checkbox_set">뉴비</label>
                    <input type="checkbox" id="ckb_beginner" value="비기너" />
                    <label for="ckb_beginner" class="checkbox_set">비기너</label>
                    <input type="checkbox" id="ckb_amateur" value="아마추어" />
                    <label for="ckb_amateur" class="checkbox_set">아마추어</label>
                    <input type="checkbox" id="ckb_semipro" value="세미프로" />
                    <label for="ckb_semipro" class="checkbox_set">세미프로</label>
                    <input type="checkbox" id="ckb_pro" value="프로" />
                    <label for="ckb_pro" class="checkbox_set">프로</label>
                </div>
                <div class="slabel">
                    <h4>팀이름</h4>
                    <input type="search" name="teamName" id="input_tname" placeholder="팀 이름을 입력해주세요."/>
                    <input type="button" id="chkSearch" value="검색하기" />
                    <input type="reset" id="chkReset" value="초기화" />
                    <label for="chkReset" id="resetIcon" class="material-symbols-outlined">
                        refresh
                    </label>
                </div>
            </form> <!-- 검색구간-->
            <ul id="teamlists">
            <%
            	for(TeamDTO team : teamList) {
           		String formatDate = dateFormat.format(team.getT_c_day());
            %>
            	<li>
	                <div class="team teamMl" data-bs-toggle="modal" data-bs-target='#Modal<%= team.getT_num()%>'>
	                    <div class="teamlogo">
	                        <img src="png/defaultLogo.png"/>
	                    </div>
	                    <div class="teamTitle">
	                        <h2><%= team.getT_name()%></h2>
	                    </div>
	                    <div class="teamin">
	                        <div class="teaminLeft1">
	                            <p>연고지 : <%= team.getHom_city() %></p>
	                            <p>팀 실력 : <%= team.getT_skill() %></p>
	                        </div>
	                        <div class="teaminLeft2">
	                            <p>활동요일 : <%= team.getWeek_time() %></p>
	                            <p>생성일 : <%= formatDate %></p>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal fade" id='Modal<%= team.getT_num() %>' tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
		                <div class="modal-dialog modal-dialog-centered">
		                    <div class="modal-content">
		                        <div class="modal-body">
			                           <div class="pop-logo">
			                                <img src="png/defaultLogo.png"/>
			                            </div>
			                            <div class="pop-info">
			                                <h1 class="modal-title fs-5" id="ModalLabel"><%= team.getT_name()%></h1>
							                <p>연고지 : <%= team.getHom_city() %></p>
							                <p>팀 실력 : <%= team.getT_skill() %></p>
							                <p>활동요일 : <%= team.getWeek_time() %></p>
							               	<p>생성일 : <%= formatDate %></p>
			                            </div>
		                        </div>
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		                            <a href="fcjava.team?page=detail&teamNumber=<%=team.getT_num()%>" class="btn btn-danger" role="button">팀 이동</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </li>
	            
       	    <%
            	}
            %>
            </ul><!-- 팀 리스트 -->
            <div class="plusbtn">
                <button type="button" id="team-more">더보기</button>
            </div>
        </div>
    </section>
    
    <!--위로가기-->
    <div id="headerUp">
        <a href="#">
            <span class="material-symbols-outlined">
                arrow_circle_up
            </span>
        </a>
    </div>

	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
    
    <!-- Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>