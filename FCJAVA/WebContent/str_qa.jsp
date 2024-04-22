<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java_web.qa"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/index.css" type="text/css">
        <link rel="stylesheet" href="css/shop_main.css" type="text/css">
    
        <!-- <link rel="stylesheet" href="css/main.css" type="text/css"> -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    
        <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
    
    
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script defer src="js/main.js"></script>
        <script src="https://kit.fontawesome.com/bc44b0c9cb.js" crossorigin="anonymous"></script>
        <!-- <script src="js/main2.js"></script> -->
        <link rel="stylesheet" href="css/str_qa.css">

        <!--구글 아이콘-->
         <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    
    
    <script>
        $(document).ready(function(){
            $('.over').hover(function(){
                var originalSrc = $(this).attr('src');
                var newSrc = $(this).attr('src').replace('.avif','_on.avif'); // 호버된 이미지의 속성 변경
                $('.sh_de1 img').attr('src', newSrc); // sh_de1 클래스에 속한 이미지 파일의 src 속성 변경
            }, function(){
                var originalSrc = $(this).attr('src');
                var newSrc = $(this).attr('src').replace('_on.avif','.avif'); // 원래 이미지의 속성 변경
                $('.sh_de1 img').attr('src', newSrc); // sh_de1 클래스에 속한 이미지 파일의 src 속성 변경
            });
            
        });
    </script>
    
    
    
    
<body bgcolor="f0ffff">
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />
			<div class="qa_top text_qa1">
		 구장 후기
		 	<div class="text_qa2" > FC JAVA에 오신 여러분, 자유게시판에 환영합니다! 팀원들과 함께 즐거운 시간보낸 운동장에 대한 정보를 공유할 수 있는 자리입니다.
자유게시판은 자유로운 의견을 남기는 공간으로 문의관련 답변은 드리지 않습니다.</div>
		</div>
	
    <jsp:useBean id="user" class="java_web.qa1"></jsp:useBean>  
<section class="s_box_qa">
	

		<input class="qa_box1" type="text" maxlength="30" size="30" placeholder=" 검색어를입력해주세요"/> 
		<input class="btn4" type="button" value="검색"> 
		<a href=str_qa1.jsp>
		<button id="ww" class="btn7">글쓰기</button>
		</a>
	<%	
		ArrayList<qa> bob = user.woob1();
	%>

     <div class='str_qa_box'>
     	<div class='image-container'>
		<%
		for(qa data : bob) {
			data.gettitle();
	     	out.println("<a href='str_qa1.jsp'><img src='img/rm.jpg'>" + data.gettitle() + "<p>" + data.getu_name() + "</p></a>");
		}
	     %>
	     </div>
     </div>
     
	<!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
	</section>
</body>
</html>