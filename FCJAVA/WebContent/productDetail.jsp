<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fcjava.dto.ProductDTO"%>
<%
	ProductDTO product = (ProductDTO) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=product.getName()%></title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- swiper css -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/productDetail.css" type="text/css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

	<section class="productDetailSection">
		<div class="history_bar">
			<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="index.jsp">HOME</a></li>
			    <li class="breadcrumb-item"><a href="fcjava.product?page=list">축구용품</a></li>
			    <li class="breadcrumb-item active" aria-current="page"><%=product.getName()%></li>
			  </ol>
			</nav>
		</div> 
		<div class="productDetail">
			<div class="productLeft">
				<p class="productImage">
					<img class="ch1" src="png/de1.jpg" alt="">
				</p>
				<div class="productThumbnail">
					<ul class="productImageList">
						<li><img src="png/de1.jpg" width="100px" alt=""></li>
						<li><img src="png/prd/<%=product.getImage()%>_1.png" width="100px" alt=""></li>
						<li><img src="png/prd/<%=product.getImage()%>_1.png" width="100px" alt=""></li>
						<li><img src="png/prd/<%=product.getImage()%>_1.png" width="100px" alt=""></li>
						<li><img src="png/prd/<%=product.getImage()%>_1.png" width="100px" alt=""></li>
					</ul>
				</div>
			</div>
			<div class="productRight">
				<div class="productDetailInfo">
					<p class="productName"><%=product.getName()%></p>
					<div class="productSummary">
						<table>
							<tr>
								<td class="productLabel">제품코드</td>
								<td><%=product.getImage() %></td>
							</tr>
							<tr>
								<td class="productLabel">브랜드</td>
								<td><%=product.getBrand() %></td>
							</tr>
							<tr>
								<td class="productLabel">카테고리</td>
								<td><%=product.getCategory() %></td>
							</tr>
							<tr>
								<td class="productLabel">색상</td>
								<td>블랙+화이트</td>
							</tr>
							<tr>
								<td class="productLabel">원산지</td>
								<td>중국</td>
							</tr>
						</table>
					</div>
					<div class="productPayment">
						<p class="productPriceText total_price">상품금액<span class="productPrice pcolor"><%=product.getPrice() %></span><span class="won">원</span></p>
					</div>
					<div class="productButtonWrap">
						<button class="buyBtn">즉시결제</button>
					</div>
				</div>
			</div>
		</div>
		<div class="tabs-container">
			<div class="tabs-menu"></div>
			<div class="tab">
				<div class="tab-content">
					<div class="recommendedProduct">상세설명</div>
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
			</div>
		</div>
		<div class="recommendedProduct">추천제품</div>
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
	<script defer src="js/productDetail.js"></script>
</body>
</html>
