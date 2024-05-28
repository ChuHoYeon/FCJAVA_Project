<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.PrdDTO"%>
<%
	PrdDTO prd = (PrdDTO) request.getAttribute("prd");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC JAVA</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- swiper css -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/shop_de.css" type="text/css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

	<section class="shop_de_section">
		<div class="history_bar">
			<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="index.jsp">HOME</a></li>
			    <li class="breadcrumb-item"><a href="fcjava.prd?page=prdUniform">축구용품</a></li>
			    <li class="breadcrumb-item active" aria-current="page"><%=prd.getPrd_name()%></li>
			  </ol>
			</nav>
		</div>
		<div class="prdetail">
			<div class="prd_left">
				<p class="prd_img">
					<img class="ch1" src="png/de1.jpg" alt="">
				</p>
				<div class="prd_thum">
					<ul class="prd_img_list">
						<li><img src="png/de1.jpg" width="100px" alt=""></li>
						<li><img src="png/de2.jpg" width="100px" alt=""></li>
						<li><img src="png/de3.jpg" width="100px" alt=""></li>
						<li><img src="png/de4.jpg" width="100px" alt=""></li>
						<li><img src="png/de5.jpg" width="100px" alt=""></li>
					</ul>
				</div>
			</div> <!-- class="prd_left" -->
			<div class="prd_right">
				<div class="prd_detail_info">
					<p class="prd_name"><%=prd.getPrd_name()%></p>
					<div class="prd_comment">
						<table>
							<tr>
								<td>제품코드</td>
								<td><%=prd.getPrd_image() %></td>
							</tr>
							<tr>
								<td>브랜드</td>
								<td><%=prd.getPrd_brand() %></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td><%=prd.getPrd_category() %></td>
							</tr>
						</table>
					</div>
					<div class="prd_etc">
						<p class="prd_price_txt total_price">상품금액<span class="prd_price pcolor"><%=prd.getPrd_price() %></span><span class="won">원</span></p>
					</div>
					<div class="prd_btn_wrap">
						<button class="buyBtn">즉시결제</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="tab-content">
			<div class="de_info">상세설명</div>
			<div> 
				<table border="1">
					<tr>
						<td>제품 소재</td>
						<td>폴리에스터 100% </td>
					</tr>
					<tr>
						<td>색상</td>
						<td>블랙 </td>
					</tr>
					<tr>
						<td>제조국</td>
						<td>인도네시아 </td>
					</tr>
					<tr>
						<td>품질보증기준</td>
						<td>관련법 및 소비자분쟁해결기준에 따름. 전자상거래 법에 의거하여 수령하신날로 부터 7일이내 물품에 이상이 없을시 교환 및 반품처리해드립니다. </td>
					</tr>
					<tr>
						<td>크기,무게</td>
						<td>51cm(가로) x 28cm(세로) x 28cm(폭) </td>
					</tr>
				</table>
			</div>
		</div>
		<div class="sugPrd">추천제품</div>
		<div>
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
	
	<!-- swiper js -->
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script defer src="js/shop_de.js"></script>
</body>
</html>