<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script defer src="js/main.js"></script>
    <script src="js/shop_over.js"></script>

    <script src="js/header.js"></script>

    <!--구글 아이콘-->
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>


<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <div class="mainb">
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="png/fifa1.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa2.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa3.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa4.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa5.jpg" width="100%" alt=""></div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev">
            </div>
            <div class="swiper-button-next">
            </div>
        </div>
    </div>
	<section>
		<div class="indexSection">
			<div class="contentBox">
				<div class="title_h">구장 예약 </div>
				<div class="iGroundBox">
					<div class="groundImg"><img alt="구장사진" src="img/sdf.jpg" width="300"></div>
					<div class="groundInfo">
						<p><img src="img/football-field.png"> 서울 디지털 운동장 축구장 </p>
                        <p><img src="img/clock.png"> 운영시간:06:00~24:00</p>
                        <p><img src="img/maximize.png"> :104 x 68</p>
                        <p> <img src="img/map.png"> :서울시 금천구 가산동 459-18</p>
					</div>
					<div class="groundCom">
						<div>📅 예약 가능 날짜 : 오늘 ~ 03.21 (목)</div>
						<div>
							<div class="time_box">06:00</div>
							<div class="time_box">08:00</div>
							<div class="time_box">10:00</div>
						</div>
						<div><input type="button" class="reserBtn" value="예약하기"></div>
					</div>
				</div>
			</div>
			<div class="contentBox">
				<div class="aashow">
					<div>
						<img src="png/ki.png">
					</div>
					<div>
	                    <p> 선수명 : 기성룡</p>
	                    <p> 포지션 : MF </p>
	                    <p> 소속 팀 : FC서울 </p>
	                    <p> 키 : 180 cm </p>
	                    <p>나이 : 34 세 </p>
                    </div>
				</div>
				<div class="teamShow">
					<img src="png/game2.jpg"alt="">
				</div>
			</div> <!-- 팀 -->
			<div class="contentBox">
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
				<div class="title_h"> 쇼핑몰 </div>
		        <ul class="prdList">
		            <li><img class="over" src="png/sin_bal/sin_1_1.avif"></li>
		            <li><img class="over" src="png/sin_bal/sin_2_1.avif"></li>
		            <li><img class="over" src="png/sin_bal/sin_3_1.avif"></li>
		            <li><img class="over" src="png/sin_bal/sin_4_1.avif"></li>
		        </ul>
			</div>
		</div>
	</section>

    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>
<script src="js/index.js"></script>
</html>