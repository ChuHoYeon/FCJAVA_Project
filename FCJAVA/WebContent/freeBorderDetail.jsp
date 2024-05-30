<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fc_java.FreeBorderDTO"%>
<jsp:useBean id="db" class="fc_java.FreeBorderDB"></jsp:useBean>
<%
	String number = request.getParameter("number");
	String sessionID = (String) session.getAttribute("ID");
	FreeBorderDTO board = db.choiceFreeBorder(number);
	Boolean like = db.choiceFreeBorderLike(sessionID, number);
	Boolean check = false;
	if(board.getId().equals(sessionID)){
		check = true;
	}
%>
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
	<!-- freeBorderDatail css -->
	<link rel="stylesheet" type="text/css" href="css/freeBorderDatail.css">
</head>
<script>
const check = <%=check%>;
const freeBorderPage = '<%=number%>';
const sessionID = '<%=sessionID %>';
</script>
<body> 
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<main class="mainContent">
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
			<h1 class="writeLabel">게시글</h1>
			<div class="content">
				<div class="content_header">
					<div class="titleBox">
						<h2><%=board.getTitle() %></h2>
						<button type='button' class='btn-favorite' value=<%=board.getNumber() %> >
							<%
								if(like) {
									out.print("<img class='love' srcset='png/love-red.svg' width='24' height='24'/>");
								} else {
									out.print("<img class='love' srcset='png/love-zero.svg' width='24' height='24'/>");
								}
							%>
						</button>
					</div>
					<div class="l-label">
						<p class="sm-label"> <%=board.getId() %> </p>
						<p class="sm-label"> <%=board.getTime() %> </p>
					</div>
				</div>
				<div class="content_viewer"><%=board.getMemo().replace("\r\n", "<br>") %></div>
			</div>
			<div class="navFooter">
				<div class="navLeft">
					<div class="updateContent">
						<% out.print("<a href='freeBorderEdit.jsp?number="+board.getNumber()+"' class='navButton'>수정</a>"); %>
						<a id='delbtn' class='navButton'>삭제</a>
					</div>
				</div>
				<div class="navRight">
					<a href="freeBorder.jsp" class="navButton">목록</a>
				</div>
			</div>
		</section>
	</main>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	<script src="js/freeBorderDetail.js"></script>
</body>
</html>