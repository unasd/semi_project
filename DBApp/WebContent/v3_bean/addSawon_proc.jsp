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
	/* 
	dto.setId(request.getParameter("id"));
	dto.setName(request.getParameter("name"));
	dto.setPass(request.getParameter("pass"));
	dto.setAge(Integer.parseInt(request.getParameter("age")));
	dto.setAddr(request.getParameter("addr"));
	dto.setExt(request.getParameter("ext"));
	dto.setDept(request.getParameter("dept"));
	 */
	dao.addSawon(dto);
%>

<h2>��� ������ �� �ԷµǾ���.</h2>
<a href="index.jsp">������� ������</a>
		


