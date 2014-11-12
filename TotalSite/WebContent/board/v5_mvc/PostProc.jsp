<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
	
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("/board/upload"); 
	System.out.println(path);
	int maxSize = 50 * 1024 * 1024; 
	
	MultipartRequest multi = 
	new MultipartRequest(request, path, maxSize, "euc-kr", new DefaultFileRenamePolicy());

	String user = multi.getParameter("user");
	String title = multi.getParameter("title");

	Enumeration names = multi.getFileNames();
	String name = (String)names.nextElement();
	dto.setFilename(multi.getFilesystemName(name)); 
	dto.setOfilename(multi.getOriginalFileName(name)); 
	dto.setName(multi.getParameter("name"));
	dto.setEmail(multi.getParameter("email"));
	dto.setHomepage(multi.getParameter("homepage"));
	dto.setSubject(multi.getParameter("subject"));
	dto.setContent(multi.getParameter("content"));
	dto.setPass(multi.getParameter("pass"));
	dto.setIp(multi.getParameter("ip"));
	dao.insertBoard(dto);
	response.sendRedirect("List.jsp");
%>
</body>
</html>