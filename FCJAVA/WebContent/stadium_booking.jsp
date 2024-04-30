<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.StadiumDTO"%>
<%
	StadiumDTO stadium = (StadiumDTO) request.getAttribute("stadium");
%>
 <%
	String selectedTimes = request.getParameter("selectedTimes");
	String totalAmount = request.getParameter("totalAmount");
	String addr = stadium.getG_add();
%>
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
<link rel="stylesheet" href="./css/stadium_booking1.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script defer src="./js/pj.js"></script>
<jsp:include page="headerPage.jsp" />
</head>
<body>
	<main class="booking_Main">
		<div class="booking_top">
			<div class="top-title">
				<h3> <%= stadium.getG_name() %> </h3>
			</div>
		</div>
		<div class="booking_content">
			<section class="gameMain_area">
				<div class="div0">
					<div class="swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="img/rm.jpg" width="870">
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
				<h4>구장 정보</h4>
				<div class="main_bottom"><table>
						<tr>
							<th><img src="png/parking.png" width="50px;"> 무료 주차</th>
							<th><img src="png/size.png"width="50px;">구장 크기: 110X55M</th>
							<th><img src="png/restrooms.png"width="50px;">개방 화장실</th>
							<th><img src="png/football.png"width="50px;">축구공 대여 O</th>
						</tr>
					</table>
				</div>
				<div class="main_bottom1">
				<h4>주의 사항</h4>	
				<h5>1.사용 종료 후 소등 및 구장문 잠금 필수입니다. 잠금 미흡하여 사고 발생 시, 책임을 물을 수있습니다.</h5>
				<h5>2.절대 금연 구장입니다. 흡연 적발 시 과태료 부과 및 퇴장 조치되며 앞으로 구장 예약이 불가능합니다.</h5>
				<h5>3.가져온 쓰레기는 반드시 쓰레기통에 버려주시고 경기가 끝난 후 뒷정리 꼭 부탁드립니다.</h5></div>
				<!-- <div class="no-apply"></div> -->
	<div class="gpsbox">
		<div id="map" style="width:1000px;height:500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ee0d8044ef493120fb264fa92c3bce6&libraries=services"></script>
	<script>
	const addr = '<%= addr %>';
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
/*         var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);
 */
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 
	</script>

	</div>
			</section>
			<form action="" class="booking_area">
				<input type="hidden" name="t_num" value="26" />
				<input type="hidden" name="b_ground_no" value="<%=stadium.getG_no() %>" />
				<div class="apply_content">
					<div class="booking_info">
						<span class="booking_label">이용 금액</span>
						<div class="booking_data">	 <%= totalAmount %> 원</div>
						<input type="hidden" name="b_won" value="<%= totalAmount %>" />
						<span class="booking_label">이용 날짜</span>
    					<div class="booking_data"> <%= request.getParameter("date") %> </div>
    					<input type="hidden" name="b_date" value="<%= request.getParameter("date") %>" />
						<span class="booking_label">이용 시간</span>
						<div class="booking_data"> <%= selectedTimes %></div>
						<input type="hidden" name="b_time" value="<%= selectedTimes %>" />
					</div>
					<div id="radioButtons">
					 <input type="radio" name="ck_vs" value="1" class="radio-button"onclick="selectButton(this)"> 친선경기 O</button>
					 <input type="radio" name="ck_vs" value="0" class="radio-button"onclick="selectButton(this)"> 친선경기 X</button>
					 </div>
				</div>
				<div class="apply_btn_area">
					<button type="button" class="apply_btn" onclick="confirmReservation()">예약 확정</button>
				</div>

			</form>
		</div>
	 <script>
        function confirmReservation() {
            if (confirm('예약을 확정하시겠습니까?')) {
                alert('예약이 확정되었습니다.');
            } else {
                alert('예약이 취소되었습니다.');
            }
        }
    </script>
	



	<jsp:include page="footerPage.jsp" />

</main>
</body>
</html>


