<%@page import="com.fcjava.model.*"%>
<%@page import="com.fcjava.dto.PrdDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<PrdDTO> prdList = (List<PrdDTO>) request.getAttribute("Prd");
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/shop_main.css" type="text/css">
<link rel="stylesheet" href="css/index.css" type="text/css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/shop_over.js"></script>


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

<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

	<section class="s_box3">
		<ul class="unit1">

			<li><a class="tab1" href="fcjava.prd?page=prdUniform"> 유니폼 </a></li>
			<li><a class="tab1" href="shop_list2.jsp"> 축구용품 </a></li>
			<li><a class="tab1" href="shop_list3.jsp"> 운동화 </a></li>
		</ul>
		<div class="sum5">
			<div class="list_title1 left1">유니폼 (12)</div>
			<form action="" class="" name="shop_search">

				<input type="submit" class="btn8" value="검색"> 
				<input class="search_1" type="search" value="" placeholder="  검색어를 입력해주세요">

			</form>
		</div>
		<ul class="group3">

			<%
				if (prdList != null && !prdList.isEmpty()) {

					int i = 1;
					for (PrdDTO prd : prdList) {
			%>
			<li class="sh2"><a href="fcjava.prd?page=prdDetail&PrdNum=<%= prd.getPrd_no() %>"><img class="over"
					src="png/uni/un<%=i%>_1.avif" width="300px" height="300px">
					<p class="prd_title titleHiden"><%=prd.getPrd_name()%></p>
					<p class="shop_price"><%=prd.getPrd_price()%></p> </a></li>
			<%
				i++;
					}
				}
			%>
			<li class="sh2"><a href="shop_de.jsp"><img class="over"
					src="png/uni/un2_1.avif" width="300px" height="300px">
					<p class="prd_title">리스폰스 CL</p>
					<p class="shop_price">129,000 원</p> </a></li>
			<li class="sh2"><a href="shop_de.jsp"><img class="over"
					src="png/uni/un3_1.avif" width="300px" height="300px">
					<p class="prd_title">Women originals Purple 스탠 스미스 CS</p>
					<p class="shop_price">119,000 원</p> </a></li>
			<li class="sh2"><a href="shop_de.jsp"><img class="over"
					src="png/uni/un4_1.avif" width="300px" height="300px">
					<p class="prd_title">Women originals Purple 스탠 스미스 CS</p>
					<p class="shop_price">119,000 원</p> </a></li>

			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un5_1.avif" width="300px" height="300px">
					<p class="prd_title">아스티어</p>
					<p class="shop_price">139,000 원</p>
			</a></li>

			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un6_1.avif" width="300px" height="300px">
					<p class="prd_title">오즈밀렌</p>
					<p class="shop_price">139,000 원</p>
			</a></li>
			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un7_1.avif" width="300px" height="300px">
					<p class="prd_title">아디폼 스탠 스미스 뮬</p>
					<p class="shop_price">79,000 원</p>
			</a></li>
			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un8_1.avif" width="300px" height="300px">
					<p class="prd_title">아디폼 스탠 스미스 뮬</p>
					<p class="shop_price">79,000 원</p>
			</a></li>
			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un9_1.avif" width="300px" height="300px">
					<p class="prd_title">아디폼 스탠 스미스 뮬</p>
					<p class="shop_price">79,000 원</p>
			</a></li>
			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un10_1.avif" width="300px" height="300px">
					<p class="prd_title">아디폼 스탠 스미스 뮬</p>
					<p class="shop_price">79,000 원</p>
			</a></li>

			<li class="sh2"><a href="shop_de.jsp"> <img class="over"
					src="png/uni/un11_1.avif" width="300px" height="300px">
					<p class="prd_title">아디폼 스탠 스미스 뮬</p>
					<p class="shop_price">79,000 원</p>
			</a></li>

			<li class="sh2"><a href="shop_de.html"> <img class="over"
					src="png/uni/un12_1.avif" width="300px" height="300px">
					<p class="prd_title">아디폼 스탠 스미스 뮬</p>
					<p class="shop_price">79,000 원</p>
			</a></li>
		</ul>

	</section>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>

