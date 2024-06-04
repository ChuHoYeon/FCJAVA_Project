<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionID = (String) session.getAttribute("ID"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>FC JAVA</title>
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <!--구글 아이콘-->
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<script type="text/javascript">
	let sessionID = '<%=sessionID%>'; 
</script>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <div class="mainb">
        <div class="swiper topSwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="png/baner/baner7.jpg" alt=""></div>
                <div class="swiper-slide"><img src="png/baner/baner2.jpg" alt=""></div>
                <div class="swiper-slide"><img src="png/baner/baner3.jpg" alt=""></div>
                <div class="swiper-slide"><img src="png/baner/baner5.jpg" alt=""></div>
                <div class="swiper-slide"><img src="png/baner/baner6.jpg" alt=""></div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
	<section>
		<div class="indexSection">
			<div class="contentBox" id="showStadium">
				<div class="title_h">구장 예약 </div>
				<form action="fcjava.stadium1?page=3" name="goStadium" method="post" class="iGroundBox">
					<input type="hidden" name="sta_num"/>
					<div class="groundImg"><img alt="구장사진" src="img/sdf.jpg" width="300"></div>
					<div class="groundInfo">
						<p id="stadiumName"><img src="img/football-field.png"></p>
                        <p id="stadiumTime"><img src="img/clock.png"> 운영시간:</p>
                        <p id="stadiumSize"><img src="img/maximize.png"> :</p>
                        <p id="stadiumAddr"><img src="img/map.png"> :</p>
					</div>
					<div class="groundCom">
						<div><input type="date" name="date" /></div>
						<div id="btnArea">
						<%for (int i = 6; i < 24; i++) { 
							if(i==12) i=18;
							String clock = String.valueOf(i);
							if(clock.length() < 2) {
								clock = '0'+clock;
							}
						%>
							<input type="checkbox" id="stm_btn<%=i %>" class="checkBtn" name="chkbox" />
							<label for="stm_btn<%=i %>" class="clockBtn"><%=clock %>:00</label>
						<% } %>
						</div>
						<div class="reserArea">
							<div class="resert">
								<input type="submit" class="reserBtn" value="예약하기">
							</div>
							<div class="price">
							</div>
							<input type="hidden" name="selectedTimes" id="selectedTimes"> 
							<input type="hidden" name="totalAmount" id="totalAmount">
						</div>
					</div>
				</form>
			</div>
			<div class="contentBox">
				<div class="title_h">공지사항</div>
				<div class="title_h">최신 팀</div>
				<div class="aashow">
					<div class="accordion accordion-flush" id="notice">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
								경기장 예약 안내
								</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#notice">
								<div class="accordion-body">안녕하세요! 축구 예약사이트를 이용해 주셔서 감사합니다. 새로운 경기장이 추가되었습니다. 이제 더 많은 옵션에서 원하는 시간에 축구를 즐길 수 있습니다. 예약은 언제나 가능하니 언제든지 확인해 보세요!</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
								시설 이용 안내
								</button>
							</h2>
							<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#notice">
								<div class="accordion-body">고객님들께 안내드립니다. 시설 이용 시 반드시 예약을 하고 이용해 주시기 바랍니다. 예약 없이 현장에서의 이용은 보장되지 않을 수 있으며, 다른 고객분들과의 충돌이 발생할 수 있습니다. 예약은 손쉽게 온라인으로 가능하니 언제든지 이용해 주세요.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
								결제 방법 변경 안내
								</button>
							</h2>
							<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#notice">
								<div class="accordion-body">결제 방법이 변경되었습니다. 이제는 신용카드 결제만 가능합니다. 더욱 편리하고 빠른 결제를 위해 새로운 시스템이 도입되었습니다. 기존의 결제 방법을 사용하던 고객님들은 변경에 양해 부탁드립니다. 추가적인 문의사항은 언제든지 문의해 주세요.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse4" aria-expanded="false" aria-controls="flush-collapse4">
								고객 의견 수렴 안내
								</button>
							</h2>
							<div id="flush-collapse4" class="accordion-collapse collapse" data-bs-parent="#notice">
								<div class="accordion-body">고객님들의 소중한 의견을 수렴하고 있습니다. 시설 이용에 대한 경험, 서비스 향상을 위한 제안, 불편사항 등 언제든지 의견을 보내주시면 반영하겠습니다. 고객님들의 의견이 우리의 서비스를 더욱 발전시킬 수 있도록 최선을 다하겠습니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="teamShow">
					<div class="swiper teamSwiper">
						<div class="swiper-wrapper"></div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div> <!-- 팀 -->
			<div class="contentBox">
				<div class="title_h">리그 순위</div>
		        <div>
		        	<div class="team-tab">
						<div class="tab tab-focus" data-league="PL">프리미어리그</div>
						<div class="tab" data-league="BL1">분데스리가</div>
						<div class="tab" data-league="SA">세리아A</div>
						<div class="tab" data-league="FL1">리그1</div>
						<div class="tab" data-league="DED">에레디비시</div>
					</div><!-- 탭 -->
			        <div>
			            <div class="leagueSubLabel">
			                <div class="leagueLabelItem">순위</div>
			                <div class="leagueLabelItem">팀명</div>
			                <div class="leagueLabelItem">경기수</div>
			                <div class="leagueLabelItem">승</div>
			                <div class="leagueLabelItem">무</div>
			                <div class="leagueLabelItem">패</div>
			                <div class="leagueLabelItem">득</div>
			                <div class="leagueLabelItem">실</div>
			                <div class="leagueLabelItem">승점</div>
			            </div>
			            <div id="standings">
			            </div>
			        </div>
		        </div>
			</div>
			<div class="contentBox">
				<div class="title_h">
					<div>쇼핑몰</div>
					<div class="moreLink"><a href="fcjava.prd?page=prdUniform">더보기</a></div>
				</div>
		        <ul class="prdList">
		            <li><img class="over" src="png/prd/10759903_1.png"></li>
		            <li><img class="over" src="png/prd/AC3444001_1.png"></li>
		            <li><img class="over" src="png/prd/FJ4862011_1.png"></li>
		            <li><img class="over" src="png/prd/DM3976010_1.png"></li>
		            <li><img class="over" src="png/prd/FQ4967106_1.png"></li>
		            <li><img class="over" src="png/prd/DV7425702_1.png"></li>
		        </ul>
			</div>
		</div>
	</section>

    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="js/index.js"></script>
</html>