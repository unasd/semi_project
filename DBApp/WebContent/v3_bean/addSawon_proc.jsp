<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
%>
<jsp:useBean id="dao" class="mybean.SawonDao"></jsp:useBean>
<jsp:useBean id="dto" class="mybean.SawonDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.addSawon(dto);
%>

<h2>사원 정보가 잘 입력되었다.</h2>
<a href="index.jsp">사원정보 페이지</a>
		


