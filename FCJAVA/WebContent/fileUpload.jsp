<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath=request.getRealPath("/upload");/* getRealPath("/upload")저장하는 폴더 위치  */
	
	int size = 10*1024*1024;
	String name="";
	String subject="";
	String filename1="";
	String origfilename1="";
	
	
	try{/* 파일을 업로드할떄는 MultipartRequest 사용해야함  */
		MultipartRequest multi=new MultipartRequest(request,/* 파일업로드폼에서 넘겨올떄 멀티파트 폼 데이터로 넘겨옴    */
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		name=multi.getParameter("name");/* MultipartRequest 객체 */
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();/*업로드한 파일명  */
		
		String file1 =(String)files.nextElement();/*   */
		filename1=multi.getFilesystemName(file1);/*컴퓨터에 저장되있는 파일과 사용자가 다운받았을때 보여지는 파일명 (동일한 파일있을때)  */
		origfilename1= multi.getOriginalFileName(file1);/*  */
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="subject" value="<%=subject%>">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
