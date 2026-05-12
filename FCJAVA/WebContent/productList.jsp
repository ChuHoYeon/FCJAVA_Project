<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fcjava.dto.ProductDTO"%>
<%
	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC JAVA</title>
	<link rel="stylesheet" href="css/shop_main.css" type="text/css">

	<script src="js/shop_over.js"></script>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<main>
		<div class="content">
			<div class="productTop">
				<div class="title">축구용품</div>
				<div class="productSearch">
					<input type="search" class="searchBox" placeholder="검색어를 입력해주세요">
					<input type="button" class="searchBtn" value="검색">
				</div>
				<div class="productCountArea">총 상품 <label class="productCount"><%=productList.size() %></label>개</div>
			</div>
			<ul class="productList">
			<%if (productList != null && !productList.isEmpty()) {
				for (ProductDTO product : productList) {%>
				<li class="productItem">
					<a href="fcjava.product?page=detail&productId=<%=product.getProductNo()%>">
						<img alt="상품이미지" src="png/prd/<%=product.getImage()%>_1.png">
						<p class="productName"><%=product.getName()%></p>
						<p class="productPrice"><%=product.getPrice()%> 원</p>
					</a>
				</li>
				<%}}%>
			</ul>
		</div>
	</main>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>

