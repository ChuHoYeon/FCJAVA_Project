<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>구장 후기 출력</title>
    <!-- 헤더 css -->
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <!-- jQuery url -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- jQuery UI url -->
    <link rel="stylesheet" type="text/css" href="js/jquery-ui-1.13.2/jquery-ui.min.css" />
    <script type="text/javascript" src="js/jquery-ui-1.13.2/jquery-ui.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

    <!-- 헤더 js -->
    <script src="js/header.js"></script>
    <script src="js/teamlist.js"></script>
    <link rel="stylesheet" type="text/css" href="css/str_qa1.css">
</head>

<body>
    <!-- 헤더 -->
    <jsp:include page="headerPage.jsp" />

    <div class="container">
        <h2>구장 후기 출력</h2>
        <table class="table table-striped">
            <tr>
                <td class="header">제목</td>
                <td><%= request.getParameter("title") %></td>
            </tr>
            <tr>
                <td class="header">작성자</td>
                <td><%= request.getParameter("u_name") %></td>
            </tr>
            <tr>
                <td class="header">내용</td>
                <td><%= request.getParameter("content") %></td>
            </tr>
            <tr>
                <td class="header">구장 사진</td>
                <td>
                    <% 
                        String imgPath = request.getParameter("img");
                        if (imgPath != null && !imgPath.isEmpty()) {
                            out.println("<img src='" + imgPath + "' alt='구장 사진' />");
                        } else {
                            out.println("사진이 업로드되지 않았습니다.");
                        }
                    %>
                </td>
            </tr>
        </table>
    </div>


</body>
    <!-- 푸터 -->
    <jsp:include page="footerPage.jsp" />
</html>
