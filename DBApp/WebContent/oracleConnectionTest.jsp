<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>����Ŭ ���� �׽�Ʈ</title>
</head>
<body>
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		Connection con = DriverManager.getConnection(url, "scott", "1111");
		if(con != null)
			out.println("���� ����");
		else
			out.println("���� ����");
	}
	catch(Exception err){
		System.out.println("���� ����");
	}

%>
</body>
</html>