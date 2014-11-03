<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ page import="totalsite.board.BoardDto" %>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
	//String ip = request.getParameter("ip");
%>
<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDto parent = dao.getBoard(num);
	
	dao.replyUpdatepos(parent);
	
	dto.setPos(parent.getPos()); // dto객체의 정보중에 pos와 depth만 바꿔준다
	dto.setDepth(parent.getDepth());
	dao.replyBoard(dto);
	
	response.sendRedirect("List.jsp");
%>