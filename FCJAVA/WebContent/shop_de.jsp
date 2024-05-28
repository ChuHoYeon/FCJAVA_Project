<%@page import="com.fcjava.model.*"%>
<%@page import="com.fcjava.dto.PrdDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script defer src="js/shop_de.js"></script>
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

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

	<section class="shop_de_section">
		<div class="sum_box">
			<div class="image_box">
				<div class="sh_de1 ma1">
					<div>
						<a href="index.jsp">Home </a> >
						<a href="fcjava.prd?page=prdUniform"> 축구용품 </a> > <%=realPrd.getPrd_name()%>
					</div>
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
				<br /> <br />

				<p><%=realPrd.getPrd_memo()%></p>
				<br />
				<p>스타일 번호: FZ3780-101</p>
				<br />
			</div>
			<div class="opt_box">
				<form>

					<input type="radio" id="opt1" name="sinsize" class="dinon">
					<label for="opt1" class="labtn1"> 245 </label> <input type="radio"
						id="opt2" name="sinsize" class="dinon"> <label for="opt2"
						class="labtn1"> 250 </label> <input type="radio" id="opt3"
						name="sinsize" class="dinon"> <label for="opt3"
						class="labtn1"> 255 </label> <input type="radio" id="opt4"
						name="sinsize" class="dinon"> <label for="opt4"
						class="labtn1"> 260 </label> <input type="radio" id="opt5"
						name="sinsize" class="dinon"> <label for="opt5"
						class="labtn1"> 265 </label> <input type="radio" id="opt6"
						name="sinsize" class="dinon"> <label for="opt6"
						class="labtn1"> 270 </label> <input type="radio" id="opt7"
						name="sinsize" class="dinon"> <label for="opt7"
						class="labtn1"> 275 </label> <input type="radio" id="opt8"
						name="sinsize" class="dinon"> <label for="opt8"
						class="labtn1"> 280 </label>

					<div>
						<button class="btn_de1">즉시결제</button>
					</div>
				</form>
			</div>
		</div>

		<div class="de_title2">세부정보</div>
		<div class="sh_de1"> 
		 <table border="1">
		 <tr>
		 <td>소재</td>
		 <td>겉감 </td>
		 </tr>
		  </table>
		</div>
		<div class="de_title2">추천제품</div>
		<div class="ct1">
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="png/reco1.png" alt="" width="500px">
					</div>
					<div class="swiper-slide">
						<img src="png/reco2.png" alt="" width="500px">
					</div>
					<div class="swiper-slide">
						<img src="png/reco3.png" alt="" width="500px">
					</div>
					<div class="swiper-slide">
						<img src="png/reco4.png" alt="" width="500px">
					</div>
					<div class="swiper-slide">
						<img src="png/reco5.png" alt="" width="500px">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>
</html>