<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head><meta charset="EUC-KR"><title>Insert title here</title></head>
<body>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
%>
	<jsp:useBean id="dao" class="mybean.SawonDao"></jsp:useBean>
	<jsp:useBean id="dto" class="mybean.SawonDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
<%
	dao.editSawon(dto);
	%>
	<script>
		alert("잘 수정되었습니다.");
		location.href="index.jsp";
	</script>
	<% 	
%>
</body>
</html>

