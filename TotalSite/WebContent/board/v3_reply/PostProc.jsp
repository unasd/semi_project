<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
	//String ip = request.getParameter("ip");
%>
<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertBoard(dto);
	response.sendRedirect("List.jsp");
%>