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
        var sessionID = "<%=sessionID%>";
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
				<div class="sh_de1 ma1">
				<div> <a href="index.jsp">Home </a> > <a href="fcjava.prd?page=prdUniform">  유니폼  </a>> <%= realPrd.getPrd_name() %> </div> 
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
				<br/>
				<br/>

				<p><%=realPrd.getPrd_memo() %></p>
				<br/>
				<p>스타일 번호: FZ3780-101</p>
				<br/>
			</div>
			<form>		
				
				<input type="radio" id="opt1" name="sinsize" class="dinon"> 
				<label for="opt1" class="labtn1"> 245  </label>
				<input type="radio" id="opt2" name="sinsize" class="dinon"> 
				<label for="opt2" class="labtn1"> 250  </label>
				<input type="radio" id="opt3" name="sinsize" class="dinon"> 
				<label for="opt3" class="labtn1"> 255  </label>
				<input type="radio" id="opt4" name="sinsize" class="dinon"> 
				<label for="opt4" class="labtn1"> 260  </label>
				<input type="radio" id="opt5" name="sinsize" class="dinon"> 
				<label for="opt5" class="labtn1"> 265  </label>
				<input type="radio" id="opt6" name="sinsize" class="dinon"> 
				<label for="opt6" class="labtn1"> 270  </label>
				<input type="radio" id="opt7" name="sinsize" class="dinon"> 
				<label for="opt7" class="labtn1"> 275  </label>
				<input type="radio" id="opt8" name="sinsize" class="dinon"> 
				<label for="opt8" class="labtn1"> 280  </label>
				
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