<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <!-- 헤더 css -->
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <!-- join css -->
    <link rel="stylesheet" type="text/css" href="css/join.css">
    <!--구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!--구글 아이콘-->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <!--jQuery url-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- 다음 주소 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 헤더 js -->
    <script src="js/header.js"></script>
    <script src="js/join.js"></script>
</head>

<body>
    <!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <section>
        <div id="joinMain">
            <form id="joinForm" action="joining.jsp" onsubmit="return joinbtn()" method="post">
                <div id="joinHeader">회원가입</div>
                <div id="allJoin">
                    <div class="infoBox">
                        <label>아이디</label>
                        <input type="text" name="id" class="infor" id="joinID"  placeholder="영문/숫자 4~20글자" maxlength="20">
                    </div>
                    <div class="warning" id="idck"></div>
                    <div class="infoBox">
                        <label>비밀번호</label>
                        <input type="password" name="pw" class="infor" onblur="pwCheck()"
                            placeholder="대문자/소문자/특수문자 포함 4~20글자" autocomplete="off" maxlength="20">
                    </div>
                    <div class="warning" id="pwck"></div>
                    <div class="infoBox">
                        <label>비밀번호 확인</label>
                        <input type="password" name="pwc" class="infor" onblur="pwcCheck()" placeholder="비밀번호 확인"
                            autocomplete="off" maxlength="20">
                    </div>
                    <div class="warning" id="pwcck"></div>
                    <div class="infoBox">
                        <label>이름</label>
                        <input type="text" name="name" class="infor" onblur="nameCheck()" placeholder="이름(한글)" maxlength="10">
                    </div>
                    <div class="warning" id="nameck"></div>
                    <div class="infoBox">
                        <label>생년월일</label>
                        <input type="text" name="bir" class="infor" onblur="birCheck()" placeholder="ex)19000101"
                            maxlength="8"
                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    </div>
                    <div class="warning" id="birck"></div>
                    <div class="infoBox">
                        <label>휴대폰 번호</label>
                        <input type="tel" name="cell" class="infor" onblur="cellCheck()" placeholder="(-)없이 입력하세요"
                            maxlength="11"
                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    </div>
                    <div class="warning" id="cellck"></div>
                    <div class="infoBox">
                        <label>성별</label>
                        <input type="radio" name="gender" id="man" value="man" checked>
                        <label for="man">남자</label>
                        <input type="radio" name="gender" id="woman" value="woman">
                        <label for="woman">여자</label>
                    </div>
                    <div class="warning" id="genderck"></div>
                    <div class="infoBox">
                        <label>이메일</label>
                        <input type="text" name="email" class="mailAddr" placeholder="이메일" onblur="emailCheck()" maxlength="320">
                        <select class="inpStyle" name="email1" onchange="emailCheck()">
                            <option>직접입력</option>
                            <option>@gmail.com</option>
                            <option>@naver.com</option>
                            <option>@daun.net</option>
                        </select>
                    </div>
                    <div class="warning" id="emailck"></div>
                    <div class="infoBox">
                        <label>주소</label>
                        <input type="text" name="addr1" id="addr1" class="mailAddr" placeholder="주소" readonly></input>
                        <button type="button" onclick="serchAddr()" class="inpStyle">우편번호 찾기</button>
                    </div>
                    <div class="warning"></div>
                    <div class="infoBox">
                        <label>상세주소</label>
                        <input type="text" name="addr2" id="addr2" class="infor" placeholder="상세주소"
                            onblur="addr2Check()" maxlength="100">
                    </div>
                    <div class="warning"></div>
                    <div class="joinbtnBox">
                        <input type="submit" value="가입하기">
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>