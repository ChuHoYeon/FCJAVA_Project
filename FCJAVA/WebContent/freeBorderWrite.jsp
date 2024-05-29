<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- freeBorderWrite css -->
	<link rel="stylesheet" type="text/css" href="css/freeBorderWrite.css">
</head>
<script>	
	function nullCheck(){
		let title = $("input[name='title']").val();
		let content = $("textarea[name='content']").val();
		let check = true;
		
		if(title === "" && content === "") {
			alert("모든 문항을 입력해주세요.")
			check = false;
		} else if(title === "") {
			alert("제목이 비어있습니다. 입력해주세요.")
			check = false;
		} else if(content === "") {
			alert("내용이 비어있습니다. 입력해주세요.")
			check = false;
		} else {
			let result = confirm("저장하시겠습니까?");
			if(result == false) { 
				check = false;
			}			
		}
		return check;
	}	
	function cancle(){
		let result = confirm("작성을 취소하시겠습니까?");
		
		if(result == true) {
			window.location.href = "freeBorder.jsp"
		}
	}
</script>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<main>
		<div class="sectionTop">
			<div class="fBorderSection">
				<h1 class="borderTitle">자유게시판</h1>
				<div class="borderSubTitle">
					<span>FC JAVA에 오신 여러분, 자유게시판에 환영합니다! 함께 즐거운 시간을 보낼 친구나 팀원을 찾거나 소식을 공유할 수 있는 자리입니다.<br>
					자유게시판은 자유로운 의견을 남기는 공간으로 문의관련 답변은 드리지 않습니다.
					</span>
				</div>
			</div>
		</div>	
		<section>
			<div class="writeSection">
				<form action="freeBorderWriting.jsp" onsubmit="return nullCheck()">
					<div class="frm-flex">
						<h1 class="writeLabel">게시글 작성</h1>
						<label>제목</label>
						<div class="writeTitle">
							<input type="text" name="title" class="boardTitle" placeholder="제목을 입력해 주세요."/>
						</div>
						<label>내용</label>
						<div class="writeMemo">
							<div>
								<textarea name="content" class="boardContent" placeholder="내용을 입력해 주세요."></textarea>
							</div>
						</div>
						<div class="nav-footer">
							<div class="nav-right">
								<input type="button" class="nav-btn" onclick="cancle()" value="취소"/>
								<input type="submit" class="nav-btn" value="저장"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</main>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>
</html>