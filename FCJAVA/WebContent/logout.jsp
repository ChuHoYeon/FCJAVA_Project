<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = (String) session.getAttribute("ID");
    session.removeAttribute("ID");
    session.removeAttribute("MyTeamList");
    String endPage = request.getHeader("referer");
    if (endPage != null && !endPage.isEmpty()) {
        response.sendRedirect(endPage);
    } else {
        response.sendRedirect("index.jsp");
    }
%>