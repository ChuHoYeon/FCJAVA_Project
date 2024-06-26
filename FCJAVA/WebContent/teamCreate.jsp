<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC JAVA : 팀생성</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<link rel="stylesheet" href="css/teamCreate.css"/>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<div>
		<form action="teamCreating.jsp" class="create-area" id="teamCreating" method="post" enctype="multipart/form-data">
			<h1 class="tcreateTitle">팀 만들기</h1>
			<div class="infoLine">
				<div class="logoBox">
					<div class="logoImg">
						<img src="png/defaultLogo.png"/>
					</div>
					<label for="logoImgPlue">로고 변경</label>
					<input type="file" accept="image/*" name="teamLogo" id="logoImgPlue"/>
				</div>
			</div>
			<div class="infoLine">
				<label class="menuLabel">팀 이름</label>
				<input type="text" name="teamName" class="textInput" placeholder="팀 명 입력(3~20글자)" maxlength="20"/>
				<div class="dupTeamName"></div>
			</div>
			<div class="infoLine">
				<label class="menuLabel">팀 소개 (선택사항)</label>
				<textarea rows="4" name="teamInfo" class="textInput"></textarea>
			</div>
			<div class="infoLine">
				<label class="menuLabel">SNS (선택사항)</label>
				<input type="text" name="teamSns" class="textInput"/>
			</div>
			<div class="infoLine">
				<label class="menuLabel">연고지</label>
				<input type="radio" name="city" id="gyeonggi" value="경기도"/>
				<label for="gyeonggi" class="menuBtn">경기도</label>
				<input type="radio" name="city" id="gangwon" value="강원도"/>
				<label for="gangwon" class="menuBtn">강원도</label>
				<input type="radio" name="city" id="chungbuk" value="충청북도"/>
				<label for="chungbuk" class="menuBtn">충청북도</label>
				<input type="radio" name="city" id="chungnam" value="충청남도"/>
				<label for="chungnam" class="menuBtn">충청남도</label>
				<input type="radio" name="city" id="jeollabuk" value="전라북도"/>
				<label for="jeollabuk" class="menuBtn">전라북도</label>
				<input type="radio" name="city" id="jeollanam" value="전라남도"/>
				<label for="jeollanam" class="menuBtn">전라남도</label>
				<input type="radio" name="city" id="gyeongbuk" value="경상북도"/>
				<label for="gyeongbuk" class="menuBtn">경상북도</label>
				<input type="radio" name="city" id="gyeongnam" value="경상남도"/>
				<label for="gyeongnam" class="menuBtn">경상남도</label>
				<input type="radio" name="city" id="jeju" value="제주도"/>
				<label for="jeju" class="menuBtn">제주도</label>
			</div>
			<div class="infoLine">
				<label class="menuLabel">활동 요일</label>
				<input type="checkbox" name="week" id="mon" value="월"/>
				<label for="mon" class="menuBtn">월</label>
				<input type="checkbox" name="week" id="tue" value="화"/>
				<label for="tue" class="menuBtn">화</label>
				<input type="checkbox" name="week" id="wed" value="수"/>
				<label for="wed" class="menuBtn">수</label>
				<input type="checkbox" name="week" id="thu" value="목"/>
				<label for="thu" class="menuBtn">목</label>
				<input type="checkbox" name="week" id="fri" value="금"/>
				<label for="fri" class="menuBtn">금</label>
				<input type="checkbox" name="week" id="sat" value="토"/>
				<label for="sat" class="menuBtn">토</label>
				<input type="checkbox" name="week" id="sun" value="일"/>
				<label for="sun" class="menuBtn">일</label>
			</div>
			<div class="infoLine">
				<label class="menuLabel">팀 실력</label>
				<input type="radio" name="skill" id="noob" value="뉴비"/>
				<label for="noob" class="menuBtn">뉴비</label>
				<input type="radio" name="skill" id="beginner" value="비기너"/>
				<label for="beginner" class="menuBtn">비기너</label>
				<input type="radio" name="skill" id="amateur" value="아마추어"/>
				<label for="amateur" class="menuBtn">아마추어</label>
				<input type="radio" name="skill" id="semipro" value="세미프로"/>
				<label for="semipro" class="menuBtn">세미프로</label>
				<input type="radio" name="skill" id="pro" value="프로"/>
				<label for="pro" class="menuBtn">프로</label>
			</div>
			<div class="infoLine">
				<label class="menuLabel">선호 연령대</label>
				<input type="radio" name="age" id="age10" value="10~20대"/>
				<label for="age10" class="menuBtn">10~20대</label>
				<input type="radio" name="age" id="age20" value="20~30대"/>
				<label for="age20" class="menuBtn">20~30대</label>
				<input type="radio" name="age" id="age30" value="30~40대"/>
				<label for="age30" class="menuBtn">30~40대</label>
				<input type="radio" name="age" id="age40" value="40~50대"/>
				<label for="age40" class="menuBtn">40~50대</label>
				<input type="radio" name="age" id="age50" value="50~60대"/>
				<label for="age50" class="menuBtn">50~60대</label>
			</div>
			<div class="infoLine">
				<label class="menuLabel">최대 가입인원</label>
				<input type="number" name="maxNum" class="textInput" min="11" max="99" placeholder="최대 99명" />
			</div>
			<h1 class="palyerTitle">선수 정보</h1>
			<div class="playerCard">
				<div id="teamApplyForm">
		        	<div class="photo-area">
		        		<div class="player-photo">
		        			<img alt="선수 사진" src="png/default-profile.jpg">
		        		</div>
		        		<div class="photo-change-label">
			        		<label for="pl_pic">사진 변경</label>
			        		<input type="file" id="pl_pic" name="pl_pic" accept="image/*" />
		        		</div>
		        	</div>
		        	<div class="player-info">
		        		<label for="back_num">희망 등번호</label>
		        		<input type="text" id="back_num" name="back_num" maxlength="3" placeholder="최대 숫자3글자"/>
		        		<label for="position">희망 포지션</label>
		        		<select name="position">
		        			<option value="공격수">공격수</option>
		        			<option value="미드필더">미드필더</option>
		        			<option value="수비수">수비수</option>
		        			<option value="골키퍼">골키퍼</option>
		        		</select>
		        		<label for="height">키</label>
		        		<input type="text" id="height" name="height" maxlength="3" placeholder="선택사항"/>
		        		<label for="weight">몸무게</label>
		        		<input type="text" id="weight" name="weight" maxlength="3" placeholder="선택사항"/>
		        	</div>
		        	<div class="player-intro">
		        		<p>선수소개</p>
		        		<textarea id="pl_memo" name="pl_memo" placeholder="선택사항" maxlength="50"></textarea>
		        	</div>
		        </div>
			</div>
			<div class="bottomLine infoLine">
				<input type="submit"  class="createBtn" value="팀 만들기"/>
			</div>
		</form>
	</div>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	<script type="text/javascript" src="js/teamCreate.js"></script>
</body>
</html>