<%@page import="web01.board_get_set"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	
	<link rel="stylesheet" href="css/shop_main.css" type="text/css">
	<link rel="stylesheet" href="css/index.css" type="text/css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
</head>

<body>
	<!-- 헤더 -->
	
	<jsp:include page="headerPage.jsp" />

	<section class="s_box_board">
		<div class="s_box_top">
			<input class="se_box1" type="text" maxlength="30" size="30" placeholder=" 검색어를입력해주세요">
			<input class="btn4" type="button" value="검색">
		</div>
		<a href=board_1_w.jsp><button>글쓰기</button></a>
		<ul class="s_box_in">
		<jsp:useBean id="user" class="web01.selectdb" />
		<%
        ArrayList<board_get_set> cc = user.exme();
        for (int i = 0; i < cc.size(); i++) {
            board_get_set aa = cc.get(i);
    %>
			<li class="bobox1">
				<img src="png/player1.webp" width="400px" height="300px" alt="">
				<h3 class="text001">
					<%= aa.getTitle() %>
				</h3>
				<div class="text002">
					<%= aa.getBon() %>
				</div>
			</li>

		<%
        }
    %>
		</ul>
	</section>

	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>