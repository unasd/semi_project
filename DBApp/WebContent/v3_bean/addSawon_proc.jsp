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

<h2>��� ������ �� �ԷµǾ���.</h2>
<a href="index.jsp">������� ������</a>
		


