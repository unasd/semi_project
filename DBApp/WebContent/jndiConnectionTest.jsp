<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>JNDI�� �̿��� DB���� �׽�Ʈ</h1>
<%
	try{
		Context ctx = new InitialContext(); // context�� ������ ���� 
		DataSource ds = 
			(DataSource)ctx.lookup("java:comp/env/jdbc/L3DB"); // ������������/������ �̸�
		Connection con = ds.getConnection();
			
		if(ds!=null)
			out.println("���� ����");
	}
	catch(Exception err){
		System.out.println("���� ���� : " + err);
	}
%>
</body>
</html>