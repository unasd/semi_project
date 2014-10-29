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
<h1>JNDI를 이용한 DB연결 테스트</h1>
<%
	try{
		Context ctx = new InitialContext(); // context의 정보를 갖고 
		DataSource ds = 
			(DataSource)ctx.lookup("java:comp/env/jdbc/L3DB"); // 가상프로토콜/정의한 이름
		Connection con = ds.getConnection();
			
		if(ds!=null)
			out.println("연결 성공");
	}
	catch(Exception err){
		System.out.println("연결 실패 : " + err);
	}
%>
</body>
</html>