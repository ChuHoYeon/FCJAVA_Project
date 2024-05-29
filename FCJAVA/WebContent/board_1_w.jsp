<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- 헤더 css -->
<link rel="stylesheet" href="css/header.css" type="text/css">
<!-- 헤더 js -->
<script src="js/header.js"></script>

</head>

<body> 
    <header class="hed0">
        <div class="hed1">
            <div class="join1">
                <a href="join.html" class="right1 f-10">회원가입</a>
                <a href="login.jsp" class="right1 f-10" id="login" name="login">로그인 </a>
                <a href="teamcreate.html" class="right1"> <span class="material-symbols-outlined"> groups </span> </a>
            </div>
            <a href="index.jsp" class="logo">FC JAVA</a>
            <ul id="headerNav">
                <a href="teamlist.html"><li>팀</li></a>
                <a href="teamscore.html"><li>대회</li></a>
                <a href="stadium.html"><li>구장</li></a>
                <a href="my_page.html"><li>마이페이지</li></a>
                <a href="shop_main.html"><li>쇼핑</li></a>
            </ul>
        </div>
        <div id="layer">
            <div class="layerInner">
                <ul>
                    <li><img src="png/navimg0.webp" class="navImg"></li>
                    <li><a href="teamlist.html">팀목록</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg1.webp" class="navImg"></li>
                    <li><a href="#">경기기록</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg2.jpg" class="navImg"></li>
                    <li><a href="stadium.html">구장예약</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg3.webp" class="navImg"></li>
                    <li><a href="#">나의 구장 예약</a></li>
                    <li><a href="#">최근 경기 결과</a></li>
                </ul>
                <ul>
                    <li><img src="png/navimg4.avif" class="navImg"></li>
                    <li><a href="shop_list3.html">운동화</a></li>
                    <li><a href="shop_list1.html">유니폼</a></li>
                    <li><a href="shop_list2.html">축구용품</a></li>
                </ul>
            </div>
        </div>
    </header>

    <section class="s_box_board_w">
        <div class="board_title">구매 후기</div>
        <form action="isRe.jsp"> <!-- isRe.jsp 파일로 POST 방식으로 폼 데이터 전송 -->
            <input class="title_box" type="text" name="title" placeholder=" 제목을 입력해 주세요 " />
            <textarea class="text_box" name="bon" placeholder=" 내용을 입력 해 주세요"> </textarea>
            <input class="pic_box" type="text" value="" disabled /> 
            <input class="pic_btn" type="button" value="찾아보기"> 
            <input class="btn5" type="button" value="취소" /> 
            <input class="btn6" type="submit" value="작성완료" /> <!-- 작성완료 버튼을 폼 제출 버튼으로 변경 -->
        </form>
    </section>

    <div class="foot0">
        <footer class="foot1"> </footer>
    </div>
</body>
</html>

dfsdfsd