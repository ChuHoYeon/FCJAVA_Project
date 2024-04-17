<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fcjava.dto.StadiumDTO"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headerPage.jsp" />
<meta charset="UTF-8">
<!--구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"rel="stylesheet">
<!--구글 아이콘-->
<link rel="stylesheet"href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!--jQuery url-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/str_in2.css">
<!--  -->

<!--jQuery UI url-->
<link rel="stylesheet" type="text/css" href="js/jquery-ui-1.13.2/jquery-ui.min.css" />
<script type="text/javascript" src="js/jquery-ui-1.13.2/jquery-ui.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<script src="js/teamlist.js"></script>


<link rel="stylesheet" type="text/css" href="css/teamlist.css">
<!-- stadium -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="./css/pj.css">
<!-- <link href="css/btn.css"rel= "stylesheet"type="text/css"> -->
<script defer src="./js/teamlist.js"></script>
<script defer src="./js/pj.js"></script>
<link rel="stylesheet" type="text/css" href="css/checkbox.css">
	<script>
$(function () {
	
	$('.checkbox_class').change(function() {
		 
		  var checkedCount = 0;
		  
		 
		  $('.checkbox_class').each(function() {
		    if ($(this).prop('checked')) {
		      checkedCount++;
		    }
		  });
		  
		  // 4개 이상이 선택된 경우 경고창 표시
		  if (checkedCount >= 4) {
		    alert("최대 이용시간은 3");
		    $(this).prop('checked', false); 
		    return;
		  }
		  

		});
	$(function () {
	    $('.checkbox_class').change(function() {
	        var selectedTimes = []; // 선택된 시간을 저장할 배열
	        var totalAmount = 0; // 총 금액을 저장할 변수
	        
	     
	        $('.checkbox_class:checked').each(function() {
	            var time = $(this).next().text(); // 해당 체크박스의 레이블 텍스트(시간) 가져오기
	            selectedTimes.push(time); // 선택된 시간 배열에 추가
	            
	            // 시간에 따른 금액 계산을 하여 총 금액
	            totalAmount += 30000;
	        });
	        
	        // 선택된 시간과 총 금액을 숨겨진 인풋 요소의 값으로 설정하여 다음 페이지로 전달
	        $('#selectedTimes').val(selectedTimes.join(','));
	        $('#totalAmount').val(totalAmount);
	        
	        // 선택된 시간과 총 금액
	        $('.won h3').text(totalAmount.toLocaleString() + " 원");
	    });
	});
});

</script>
<title></title>
</head>
<body>


	<div class="stm_cont">
		<div class="myteamlabel">구장 목록</div>
		<a href="stadium_import1.jsp">구장 등록</a>
		<div class="statbox"></div>
		<form class="stm_teamsearch">
			<div class="slabel">
				<h4>지역</h4>
				<input type="checkbox" id="ckb_Gyeonggi" value="Gyeonggi" /> <label
					for="ckb_Gyeonggi" class="checkbox_set">경기도</label> <input
					type="checkbox" id="ckb_Gangwon" value="Gangwon" /> <label
					for="ckb_Gangwon" class="checkbox_set">강원도</label> <input
					type="checkbox" id="ckb_Chungbuk" value="Chungbuk" /> <label
					for="ckb_Chungbuk" class="checkbox_set">충청북도</label> <input
					type="checkbox" id="ckb_Chungnam" value="Chungnam" /> <label
					for="ckb_Chungnam" class="checkbox_set">충청남도</label> <input
					type="checkbox" id="ckb_Jeollabuk" value="Jeollabuk" /> <label
					for="ckb_Jeollabuk" class="checkbox_set">전라북도</label> <input
					type="checkbox" id="ckb_Jeollanam" value="Jeollanam" /> <label
					for="ckb_Jeollanam" class="checkbox_set">전라남도</label> <input
					type="checkbox" id="ckb_Gyeongbuk" value="Gyeongbuk" /> <label
					for="ckb_Gyeongbuk" class="checkbox_set">경상북도</label> <input
					type="checkbox" id="ckb_Gyeongnam" value="Gyeongnam" /> <label
					for="ckb_Gyeongnam" class="checkbox_set">경상남도</label> <input
					type="checkbox" id="ckb_Jeju" value="Jeju" /> <label
					for="ckb_Jeju" class="checkbox_set">제주도</label>
			</div>
			<div id="city2"></div>
			<div class="slabel">
				<h4>구장 이름</h4>
				<input type="text" id="input_tname" /> <input type="button" id="chkSearch" value="검색하기" /> 
				<input type="reset" id="chkReset"value="초기화" /> 
				<label for="chkReset" id="resetIcon" class="material-symbols-outlined"> refresh </label>
			</div>
		</form>
	</div>
	<!-- 검색구간-->

	<ul class="sum1">
		<%
      	List<StadiumDTO> stadiumList = (List<StadiumDTO>)request.getAttribute("stadiums");
        if (stadiumList != null) {
            for (StadiumDTO stadium : stadiumList) {
            int i = 0;
            %>
		<li class="infor">
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="img/rm.jpg" width="300">
					</div>
					<div class="swiper-slide">
						<img src="img/rm2.jpg" width="300">
					</div>
					<div class="swiper-slide">
						<img src="img/rm1.JPG" width="300">
					</div>
				</div>

				<div class="swiper-pagination"></div>
			</div>
			<div class="mbox1">
				<ul>
					<p>
					<li class="pp"><div class="stm_jb">
							<img src="img/football-field.png">
						</div>: <%= stadium.getG_name() %></li>
					</p>
					<p>
					<li class="pp"><div class="stm_jb">
							<img src="img/clock.png">
						</div> : 운영시간 <%= stadium.getG_time() %></li>
					</p>
					<p>
					<li class="pp"><div class="stm_jb">
							<img src="img/maximize.png">
						</div>: 구장 크기 <%= stadium.getG_size() %></li>
					</p>
					<p>
					<li class="pp"><div class="stm_jb">
							<img src="img/map.png">
						</div> :<%= stadium.getG_add() %></li>
					</p>
				</ul>
			</div>

			<div class="stm_tiembox">
				<div class="ord">
					<form>
						<input type='date' id='soccerDate1' />
					</form>
				</div>

				<form class="stm_teamsearch1" id="stm_teamsearch1-box-1"
					action="stadium_booking.jsp" method="POST">
					<div class="box-wrap">
						<input type="checkbox" id="stm_btn6<%= i %>" name="" value="" class="checkbox_class" /> 
						<label for="stm_btn6<%= i %>" id="custom_button_label" class="checkbox_label">06:00</label> 
						
						<input type="checkbox" id="stm_btn7<%= i %>" name="" value="custom_value" class="checkbox_class" />
				    	 <label for="stm_btn7<%= i %>" id="custom_button_label"	class="checkbox_label">07:00</label>
						  
						 <input type="checkbox"	id="stm_btn8<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn8<%= i %>" id="custom_button_label" class="checkbox_label">08:00</label>
						
						 <input type="checkbox"	id="stm_btn9<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn9<%= i %>" id="custom_button_label" class="checkbox_label">09:00</label>
						
						 <input type="checkbox" id="stm_btn10<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn10<%= i %>" id="custom_button_label" class="checkbox_label">10:00</label>
						
						 <input type="checkbox"	id="stm_btn11<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn11<%= i %>" id="custom_button_label"class="checkbox_label">11:00</label>
						 
						<input type="checkbox"	id="stm_btn18<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn18<%= i %>" id="custom_button_label" class="checkbox_label">18:00</label> 
						
						<input type="checkbox" id="stm_btn19<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn19<%= i %>" id="custom_button_label"class="checkbox_label">19:00</label> 
						
						<input type="checkbox"	id="stm_btn20<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn20<%= i %>" id="custom_button_label"	class="checkbox_label">20:00</label>
						
						 <input type="checkbox" id="stm_btn21<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn21<%= i %>" id="custom_button_label"	class="checkbox_label">21:00</label> 
						
						<input type="checkbox"	id="stm_btn22<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn22<%= i %>" id="custom_button_label" class="checkbox_label">22:00</label> 
						
						<input type="checkbox"id="stm_btn23<%= i %>" name="" value="" class="checkbox_class" />
						<label for="stm_btn23<%= i %>" id="custom_button_label"class="checkbox_label">23:00</label>
					</div>

					<input type="hidden" name="selectedTimes" id="selectedTimes">
					<input type="hidden" name="totalAmount" id="totalAmount">
				</form>

				<div class="slabel">
					<input type="button" id="chkSearch1" value="예약하기"
						onclick="location.href='fcjava.stadium1?page=3&sta_num=<%= stadium.getG_no() %>&';" />
				</div>
			</div>
			<div class="won_box">
				<div class="won">
					<h3></h3>
				</div>
			</div>
		</li>

		<% 
				i++;
          }}%>
	</ul>

	<jsp:include page="footerPage.jsp" />

</body>
</html>