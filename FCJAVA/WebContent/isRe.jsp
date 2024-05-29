<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web01.selectdb" %> <!-- selectdb 클래스 import -->

<!DOCTYPE html>
<html> 
<head>
    <meta charset="UTF-8">
    <title>후기 작성 결과</title>
    <script>
        // 성공 또는 실패 시 팝업 호출 함수
        function showAlert(message) {
            alert(message); // 메시지 출력
            window.location.replace("board_1.jsp"); // board_1.jsp로 이동
        }
    </script>
</head>
<body>
<%
    // 폼으로부터 제목과 내용을 받아옴
    String title = request.getParameter("title");
    String bon = request.getParameter("bon");

    // 제목 또는 내용이 비어있는 경우
    if (title == null || title.trim().isEmpty() || bon == null || bon.trim().isEmpty()) {
%>
    <script>
        showAlert("제목과 내용을 모두 입력하세요.");
    </script>
<%
    } else {
        try {
            // selectdb 클래스의 인스턴스 생성
            selectdb db = new selectdb();

            // 데이터베이스에 저장하기 위해 exww 메소드 호출
            db.exww(title, bon);

            // 성공 메시지를 팝업으로 호출하고 확인 후 board_1.jsp로 이동
%>
    <script>
        showAlert("후기가 성공적으로 등록되었습니다.");
    </script>
<%
        } catch (Exception e) {
            // 실패 메시지를 팝업으로 호출하고 확인 후 board_1.jsp로 이동
%>
    <script>
        showAlert("오류가 발생했습니다: <%= e.getMessage() %>");
    </script>
<%
        }
    }
%>
</body>
</html>