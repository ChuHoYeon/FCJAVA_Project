<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.StadiumDTO" %>
<% StadiumDTO stadium =(StadiumDTO)request.getAttribute("stadium"); %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<!--구글 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!--구글 아이콘-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!--jQuery url-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link rel="stylesheet" href="./css/stadium_booking.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script defer src="./js/pj.js"></script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

	<div class="container">
		<section class="soccer-field">
			<h2><%= stadium.getG_name() %></h2>
			<div class="div0">
				<div class="swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="img/rm.jpg" width="900">
						</div>
						<div class="swiper-slide">
							<img src="img/rm1.JPG" alt="이미지 준비중">
						</div>
						<div class="swiper-slide">
							<img src="img/rm1.JPG" alt="이미지 준비중">
						</div>
					</div>
				</div>
			</div>

		</section>


		<div class="container_box">
			<div class="rules-flex-container">
				<div class="lvbox">
					<h2>이용금액</h2>
					<div>
						이용금액: <span id="totalAmount">금액</span>원
					</div>
				</div>
				<div class="tmbox">
					<h2>이용 시간</h2>
					<div>
					이용 시간:
					</div>
				</div>
				<div class="qabox">
					<table class="tab">
						<h2>구장 시설</h2>
						<tr>
							<th><img src="png/iparking.png"> 무료 주차</th>
							<th><img src="img/maximize.png"> 구장 크기: 110X55M</th>
						</tr>
						<tr>
							<th><img src="png/toilet.png">개방 화장실</th>
							<th><img src="png/ball.png">축구공 대여 O</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
<!-- 			<div class="rule-part">
					<input type="button" value="결제 하기" class="bt22">
				</div> -->
		<div class="mubox">
			<section class="rules">
				<h2>이용 규칙</h2>
				<h3>꼭 지켜주세요</h3>
				<h3>1.사용 종료 후 소등 및 구장문 잠금 필수입니다. 잠금 미흡하여 사고 발생 시, 책임을 물을 수있습니다.</h3>
				<h3>2.절대 금연 구장입니다. 흡연 적발 시 과태료 부과 및 퇴장 조치되며 앞으로 구장 예약이 불가능합니다.</h3>
				<h3>3.가져온 쓰레기는 반드시 쓰레기통에 버려주시고 경기가 끝난 후 뒷정리 꼭 부탁드립니다.</h3>
			</section>
		</div>
	</div>
	<div class="gpsbox"><h2>위치</h2>  
        <div><img src="img/gps.PNG"></div>

</div>
	<button id="live-chat">예약하기</button>

	<jsp:include page="footerPage.jsp" />

	
</body>
</html>


