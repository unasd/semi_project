<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="refresh" content="1;url=index.jsp">
</head>
<body>
<jsp:useBean id="dto" class="mybean.SawonDto"></jsp:useBean>
<jsp:useBean id="dao" class="mybean.SawonDao"></jsp:useBean>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	dao.deleteSawon(no);
%>
</body>
</html>