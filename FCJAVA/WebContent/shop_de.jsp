<%@page import="com.fcjava.model.*"%>
<%@page import="com.fcjava.dto.PrdDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String id = request.getParameter("id");
	String sessionID = (String) session.getAttribute("ID");

	if (id != null) {
		session.setAttribute("ID", id);
		sessionID = (String) session.getAttribute("ID");
	}
%>

<%
	List<PrdDTO> prdList = (List<PrdDTO>) request.getAttribute("Prd");
	String prdNum = request.getParameter("PrdNum");
	PrdDTO realPrd = null;

	if (prdList != null && prdNum != null) {
		for (PrdDTO prd : prdList) {
			if (prdNum.equals(Integer.toString(prd.getPrd_no()))) {
				realPrd = prd;
				break; // 해당 상품을 찾았으면 반복문 종료
			}
		}
	}
%>


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/shop_de.css" type="text/css">


<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script defer src="js/swife2.js"></script>


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
<!-- 헤더 css -->
<link rel="stylesheet" href="css/header.css" type="text/css">
<!-- 헤더 js -->
<script src="js/header.js"></script>

</head>

<script>
    $(document).ready(function(){
        //로그인
        var id = "<%=id%>";
        var sessionID = "<%=sessionID%>
	";
						if ((id === 'null' && sessionID === 'null') | id === '') {
							$(".join1 #loginNav")
									.html(
											"<a href='login.jsp' class='right1 f-10' >로그인</a>");
							$(".join1 #joinNav")
									.html(
											"<a href='join.jsp' class='right1 f-10'>회원가입</a>");
						} else {
							$(".join1 #loginNav")
									.html(
											"<a href='my_page.jsp' class='right2 f-10' ><span class='material-symbols-outlined'>person</span></a>");
							$(".join1 #joinNav")
									.html(
											"<a href='logout.jsp' class='right1 f-10'>로그아웃</a>");
						}
					});
</script>

<!-- 

<script>
$(document).ready(function(){

// $('.over').hover(function(){
//        $(this).attr('src', $(this).attr('src').replace('.jpg','_on.jpg')); 

//     }, function(){
//     $(this).attr('src', $(this).attr('src').replace('_on.jpg','.jpg')); 
// });



$('.over').hover(function(){
    $(this).attr('src',$('ch1').attr('src').replace('.jpg','_on.jpg')); 
}, function(){
    $(this).attr('src',$('.ch1').attr('src').replace('_on.jpg','.jpg')); 
});


});




</script> -->

<script>
	// $(document).ready(function(){
	//     $('.over').hover(function(){
	//         var originalSrc = $(this).attr('src');
	//         var newSrc = $(this).attr('src').replace('.jpg','_on.jpg'); // 호버된 이미지의 속성 변경
	//         $('.sh_de1 img').attr('src', newSrc); // sh_de1 클래스에 속한 이미지 파일의 src 속성 변경
	//     }, function(){
	//         var originalSrc = $(this).attr('src');
	//         var newSrc = $(this).attr('src').replace('_on.jpg','.jpg'); // 원래 이미지의 속성 변경
	//         $('.sh_de1 img').attr('src', newSrc); // sh_de1 클래스에 속한 이미지 파일의 src 속성 변경
	//     });
	// });

	$(document).ready(
			function() {
				$('.over').hover(
						function() {
							// 호버된 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
							$('.sh_de1 img').attr(
									'src',
									$(this).attr('src').replace('.jpg',
											'_on.jpg'));
						},
						function() {
							// 원래 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
							$('.sh_de1 img').attr(
									'src',
									$(this).attr('src').replace('_on.jpg',
											'.jpg'));
						});
			});
</script>


<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

	<section class="shop_de_section">
		<div class="sum_box">
			<div class="image_box">
				<div class="sh_de1">
					<img class="ch1" src="png/de1.jpg" alt="">
				</div>
				<ul>
					<li><img class="over" src="png/de1.jpg" width="100px" alt=""></li>
					<li><img class="over" src="png/de2.jpg" width="100px" alt=""></li>
					<li><img class="over" src="png/de3.jpg" width="100px" alt=""></li>
					<li><img class="over" src="png/de4.jpg" width="100px" alt=""></li>
					<li><img class="over" src="png/de5.jpg" width="100px" alt=""></li>
				</ul>
			</div>
			<div class="text_box">
				<div class="de_title"><%=realPrd.getPrd_name()%></div>
				<div class="pr1">
					<p><%=realPrd.getPrd_price()%></p>
				</div>
				<p>풍부한 레이어드 디자인에 직물과 가죽, 플라스틱 액센트가 더해져 이번 시즌 가장 멋진 스니커즈가 탄생했습니다.</p>
				<p>현재 컬러: 라이트 오어우드 브라운/메탈릭 실버/검 미디엄 브라운/세일</p>
				<p>스타일 번호: FZ3780-101</p>
			</div>
			<form>
				<br> <input type="radio" name="sinsize"> 245 <input
					type="radio" name="sinsize"> 250 <input type="radio"
					name="sinsize"> 255 <input type="radio" name="sinsize">
				260 <input type="radio" name="sinsize"> 265 <input
					type="radio" name="sinsize"> 270 <input type="radio"
					name="sinsize"> 275 <input type="radio" name="sinsize">
				280 <input type="radio" name="sinsize"> 285 <input
					type="radio" name="sinsize"> 290 <br>
				<button class="btn_de1">즉시결제</button>
			</form>
		</div>
		</div>
		<div class="de_title2">추천제품</div>
		<div class="ct1">
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="png/reco1.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="png/reco2.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="png/reco3.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="png/reco4.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="png/reco5.png" alt="">
					</div>
				</div>
			</div>
		</div>




	</section>


	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>