<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


<!-- 헤더 -->
<jsp:include page="headerPage.jsp" />

<link rel="stylesheet" href="./css/stadiumimport.css">

<title>구장 등록</title>
</head>
<body>
	<div>
		<div>
			<h1>구장 등록</h1>
		</div>
	</div>
	<div class="imbox">
		<form action="ghg.stadium1" method="post">
			<input type="hidden" name="page" value="1">
			<div class="mubox">
				<label>구장 번호</label>
				<div>
					<input type="text" id="" name="no" class="">
				</div>
				<div>
					<label>관리자 ID</label>
					<div>
						<input type="text" id="" name="id" class="">
					</div>
					<div>
						<label>구장 명</label>
						<div>
							<input type="text" id="" name="name" class="">
						</div>
					</div>
					<div>
						<label>운영시간</label>
						<div>
							<input type="text" id="" name="time" class="">
						</div>
					</div>
					<div>
						<label>구장 크기</label>
						<div>
							<input type="text" id="" name="size" class="">
						</div>
					</div>
					<div>
						<label>구장 주소</label>
						<div>
							<input type="text" id="" name="add" class="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세정보</label>
						<div class="col-sm-5">
							<textarea name="memo" cols="50" rows="2" class="form-control"></textarea>
						</div>
					</div>

					<div>
						<label>구장 사진</label>
						<div>
							<input type="file" name="img">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록하기">
							<a href="aa.stadium1?page=2" class="btn btn-secondary">구장 목록</a>
						</div>
					</div>
				</div>
			</div>
			</div>
		</form>
		<jsp:include page="footerPage.jsp" />
</body>
</html>