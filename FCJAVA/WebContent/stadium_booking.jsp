<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	<link rel="stylesheet" href="./css/fc_java_sta.css">
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
			<h2>축구장 정보</h2>
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


	 <div class="container">
        <div class="rules-flex-container">
            <div class="rule-part">
                <h2>이용금액</h2>
                <div>이용금액: <span id="totalAmount">금액</span>원</div>
            </div>
            <div class="rule-part">
                <table class="tab">
                <h2>구장 시설</h2>
                    <tr>
                        <th scope="col">무료 주차</th>
                        <th scope="col">구장 크기: 110X55M</th>
                    </tr>
                    <tr>
                        <th scope="col">개방 화장실</th>
                        <th scope="col">축구공 대여 O</th>
                    </tr>
                </table>
            </div>
            <div class="rule-part">
                <input type="button" value="결제 하기" class="bt22">
            </div>
        </div>
    </div>

		<section class="rules">
			<h2>이용 규칙</h2>
			<h3>꼭 지켜주세요</h3>
			<h3>1.사용 종료 후 소등 및 구장문 잠금 필수입니다. 잠금 미흡하여 사고 발생 시, 책임을 물을 수 있습니다.</h3>
			<h3>2.절대 금연 구장입니다. 흡연 적발 시 과태료 부과 및 퇴장 조치되며 앞으로 구장 예약이 불가능합니다.</h3>
			<h3>3.가져온 쓰레기는 반드시 쓰레기통에 버려주시고 경기가 끝난 후 뒷정리 꼭 부탁드립니다.</h3><!--20240404  -->
		</section>

	</div>

	<jsp:include page="footerPage.jsp" />

	<script>
        document.getElementById('submit-btn').addEventListener('click', function() {
            var bookingDate = document.getElementById('booking-date').value;
            if (bookingDate) {
                alert('선택하신 날짜로 예약을 확인합니다: ' + bookingDate);
                // 이 부분에 실제 예약 로직을 구현해야 함
            } else {
                alert('예약 날짜를 선택해주세요.');
            }
        });
    </script>
</body>
</html>


