<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fc_java.FreeBorderDTO"%>
<%@ page import="fc_java.FreeBorderLikesDTO"%>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="db" class="fc_java.FreeBorderDB"></jsp:useBean>
<%
	String sessionID = (String) session.getAttribute("ID");
	ArrayList<FreeBorderDTO> freeBorder = db.selectAllFreeBorder();
	
	String selectText = request.getParameter("selectText");
	String searchText = request.getParameter("searchText");;
	if(selectText != null && searchText != null){
		freeBorder = db.selectFreeBorder(selectText, searchText);
	}
	
	ArrayList<FreeBorderLikesDTO> freeBorderLikes = db.selectAllFreeBorderLikes(sessionID);
	int totalBorde = 0;
	for(FreeBorderDTO freeborder : freeBorder) {
		totalBorde += 1;
	}
%>
<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
	<title>자유게시판</title>
	<!--구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!--구글 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<!--jQuery url-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- freeBorder css -->
	<link rel="stylesheet" type="text/css" href="css/freeBorder.css">
</head>
<script>
	$(function(){
		let sessionID = <%=sessionID%>;
		if(sessionID == null){
			$(".topbtn").hide();
		}
		
 		$(".btn-favorite").click(function(){
			let borderNum = $(this).val();
			let src = $(this).find(".love");
			if(sessionID !== null) {
				if(src.attr("srcset") == "png/love-zero.svg"){
					$.ajax({
				  	      url : "fBorderLike.jsp",
				  	      data : {
				  	    	  ID : sessionID,
				  	    	  Num : borderNum,
			  	    	  },
				  	      success : function(re){
				  	    	  src.attr("srcset", "png/love-red.svg");
				  	      }
				  	});
				} else {
					$.ajax({
				  	      url : "fBorderUnLike.jsp",
				  	      data : {
				  	    	  ID : sessionID,
				  	    	  Num : borderNum,
			  	    	  },
				  	      success : function(re){
				  	    	  src.attr("srcset", "png/love-zero.svg");
				  	      }
				  	});
				}	
			} else {
				let isLogin = confirm("로그인을 해야 이용가능합니다. 로그인하시겠습니까?");
				if (isLogin) {
					window.location.href = "login.jsp";
				}
			}
		})
	})
</script>
<body>
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
	<main class="fBorderMain">
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
		<div class="sectionBottom">
			<div class="fBorderSectionBottom">
				<form class="searchContent">
					<div class="searchArea">
						<select class="selectSearchBtn" name="selectText">
							<option value="title">제목</option>
							<option value="memo">내용</option>
							<option value="id">작성자</option>
							<option value="titlememo">제목+내용</option>
						</select>
						<input type="search" name="searchText" class="selectSearchBtn" placeholder="검색어를 입력해주세요"/>
						<button type="submit" class="subResetBtn">검색</button>
						<button type="reset" class="subResetBtn">초기화</button>
					</div>
				</form>
				<div class="totalBorder">
					<p>총 게시물 <strong><%=totalBorde%></strong>건</p>
				</div>
				<ul class="freeBorderList">
					<%
						if (totalBorde != 0){
							for(FreeBorderDTO freeborder : freeBorder) {
								out.print("<li class='srchlist'><a href='freeBorderDetail.jsp?number="+freeborder.getNumber()+"' class='title'><span class='flag-career'>"+freeborder.getNumber()+"</span>");
								out.print("<p>"+freeborder.getTitle()+"</p></a><div class='borderInfo'><span>"+freeborder.getId()+"</span>");
								out.print("<span>"+freeborder.getTime()+"</span></div><div class='flag-btn'>");
								out.print("<button type='button' class='btn-favorite' value='"+freeborder.getNumber()+"'>");
								if(!freeBorderLikes.isEmpty()){
									Boolean res = false;
									for(FreeBorderLikesDTO likes : freeBorderLikes){
										if(likes.getNumber()==freeborder.getNumber()){
											res =true;
										}
									}
									if (res){
										out.print("<img class='love' srcset='png/love-red.svg' width='24' height='24'/>");
									} else {
										out.print("<img class='love' srcset='png/love-zero.svg' width='24' height='24'/>");
									}
								} else {
									out.print("<img class='love' srcset='png/love-zero.svg' width='24' height='24'/>");
								}
								out.print("</button></div></li>");
							}
						} else {
					%>
						<li class="srchNo">검색된 내용이 없습니다.</li>
					<%
						}
					%>
				</ul>
				<div class="wrt-area">
					<div class="wirteBtn">
						<a href="freeBorderWrite.jsp" class="topbtn">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>
</html>