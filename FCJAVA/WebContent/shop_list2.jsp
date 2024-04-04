<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/shop_main.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
    
    <section class="s_box2">
      
        <ul class="unit1">
      
            <li><a class ="tab1" href="fcjava.prd?page=prdUniform"> 유니폼 </a></li> 
            <li><a class="tab1" href="shop_list2.jsp"> 축구용품 </a></li>
            <li><a class="tab1" href="shop_list3.jsp"> 운동화 </a></li>
        </ul>
        <div class="sum5">
            <div class="list_title1 left1">축구용품 (12)
            </div>
            <form class="" name="shop_search"><input class="search_1" type="search" value=""
                    placeholder="  검색어를 입력해주세요"></form>
        </div>
        <ul class="group3">
            <li class="sh2">
                <a href="shop_de.html"><img class="over" src="png/uni/un1_1.avif" width="300px" height="300px">
                    <p class="prd_title">Lifestyle Green MONCLER x 아디다스 오리지널스 캠퍼스</p>
                    <p class="shop_price">690,000 원</p>
                </a>
            </li>
            <li class="sh2">
                <a href="shop_de.html"><img class="over" src="png/uni/un2_1.avif" width="300px" height="300px">
                    <p class="prd_title">리스폰스 CL</p>
                    <p class="shop_price">129,000 원</p>

                </a>
            </li>
            <li class="sh2">
                <a href="shop_de.html"><img class="over" src="png/sin_bal/sin_3_1.avif" width="300px" height="300px">
                    <p class="prd_title">Women originals Purple 스탠 스미스 CS</p>
                    <p class="shop_price">119,000 원</p>
                </a>
            </li>
            <li class="sh2">
                <a href="shop_de.html"><img class="over"  src="png/sin_bal/sin_4_1.avif" width="300px" height="300px">
                    <p class="prd_title">Women originals Purple 스탠 스미스 CS</p>
                    <p class="shop_price">119,000 원</p>

                </a>
            </li>
        </ul>
        <ul class="group3">
            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_5_1.avif" width="300px" height="300px">
                    <p class="prd_title">아스티어</p>
                    <p class="shop_price">139,000 원</p>
                </a>
            </li>

            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_6_1.avif" width="300px" height="300px">
                    <p class="prd_title">오즈밀렌</p>
                    <p class="shop_price">139,000 원</p>
                </a>
            </li>
            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_7_1.avif" width="300px" height="300px">
                    <p class="prd_title">아디폼 스탠 스미스 뮬</p>
                    <p class="shop_price">79,000 원</p>
                </a>
            </li>
            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_8_1.avif" width="300px" height="300px">
                    <p class="prd_title">아디폼 스탠 스미스 뮬</p>
                    <p class="shop_price">79,000 원</p>
                </a>
            </li>
        </ul>
        <ul class="group3">
            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_9_1.avif" width="300px" height="300px">
                    <p  class="prd_title">아디폼 스탠 스미스 뮬</p>
                    <p class="shop_price">79,000 원</p>
                </a>
            </li>
            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_10_1.avif" width="300px" height="300px">
                    <p class="prd_title">아디폼 스탠 스미스 뮬</p>
                    <p class="shop_price">79,000 원</p>
                </a>
            </li>

            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_11_1.avif" width="300px" height="300px">
                    <p class="prd_title">아디폼 스탠 스미스 뮬</p>
                    <p class="shop_price">79,000 원</p>
                </a>
            </li>

            <li class="sh2">
                <a href="shop_de.html">
                    <img class="over" src="png/sin_bal/sin_12_1.avif" width="300px" height="300px">
                    <p class="prd_title">아디폼 스탠 스미스 뮬</p>
                    <p class="shop_price">79,000 원</p>
                </a>
            </li>
        </ul>
    </section>
    
    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>