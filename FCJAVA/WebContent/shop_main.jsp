<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    String sessionID = (String) session.getAttribute("ID");
    
    if (id != null){
        session.setAttribute("ID",id);
        sessionID = (String) session.getAttribute("ID");
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/shop_main.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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

<script>
    $(document).ready(function(){
        $('.img1').mouseover(function () {
            $('.font1').css({ "background-color": "rgba(0, 0, 0, 0.623)" });
        });
        $('.font1').mouseout(function(){
            $('.font1').css({ "background-color": "rgba(0, 0, 0, 0.0)" });
        });
        
        $('.img2').mouseover(function () {
            $('.font2').css({ "background-color": "rgba(0, 0, 0, 0.623)" });
        });
        $('.font2').mouseout(function(){
            $('.font2').css({ "background-color": "rgba(0, 0, 0, 0.0)" });
        });

        $('.img3').mouseover(function () {
            $('.font3').css({ "background-color": "rgba(0, 0, 0, 0.623)" });
        });
        $('.font3').mouseout(function(){
            $('.font3').css({ "background-color": "rgba(0, 0, 0, 0.0)" });
        });

      	//로그인
        var id = "<%= id %>";
        var sessionID = "<%= sessionID %>";
        if((id === 'null' && sessionID === 'null') |id === ''){
            $(".join1 #loginNav").html("<a href='login.jsp' class='right1 f-10' >로그인</a>");
            $(".join1 #joinNav").html("<a href='join.jsp' class='right1 f-10'>회원가입</a>");
        } else {
            $(".join1 #loginNav").html("<a href='my_page.jsp' class='right2 f-10' ><span class='material-symbols-outlined'>person</span></a>");
            $(".join1 #joinNav").html("<a href='logout.jsp' class='right1 f-10'>로그아웃</a>");
        }

    });

</script>

<body>
    <!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <section class="s_box">
        <ul>
            <li class="img1">
                <a href="fcjava.prd?page=prdUniform">
                    <div class="font1">유니폼</div>
                </a>
            </li>
            <li class="img2">
                <a href="shop_list2.jsp">
                    <div class="font2">축구용품</div>
                </a>
            </li>
            <li class="img3">
            	<a href="shop_list3.jsp">
                <div class="font3">운동화</div>
                </a>
            </li>
        </ul>
    </section>

    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>