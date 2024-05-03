<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>로그인</title>

    <!--구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!--구글 아이콘-->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <!--jQuery url-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    <script src="js/login.js"></script>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>
    <!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <section class="loginMain">
    	<div class="formBox">
	        <form action="index.jsp" class="contents" onsubmit="return loginCheck()">
	            <h1>FC JAVA</h1>
	            <h5>FC JAVA 서비스를 이용하시려면 아이디와 비밀번호를 입력해주세요.</h5>
	            <div>
	            	<label for="idInput" class="idPwLabel">아이디</label>
	            	<input type="text" name="id" id="idInput" class="inputBox"/>
	            </div>
	            <div id="alertID"></div>
	            <div>
	            	<label for="pwInput" class="idPwLabel">비밀번호</label>
	            	<input type="password" name="pw" id="pwInput" class="inputBox" autocomplete="off"/>
	            </div>
	            <div id="alertPW"></div>
	            <input type="submit" value="로그인" id="loginbtn" />
	            <div class="ipsBox">
	            	<span class="ips"><a href="#" class="loginSub">아이디 찾기</a></span>
	                <span class="ips"><a href="#" class="loginSub">비밀번호 찾기</a></span>
	                <span class="ips"><a href="join.jsp" class="loginSub">회원가입</a></span>
	            </div>
	        </form>
        </div>
    </section>

    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />

</body>

</html>
