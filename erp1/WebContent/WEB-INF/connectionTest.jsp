<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%!
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;
%>

<%
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		//Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		con = DriverManager.getConnection(url, "root", "1111");
		
		if(con != null)
			out. println("success");
	}
	catch(Exception err){
		System.out.println(err);
	}
%>
</body>
</html>