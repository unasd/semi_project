<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
	
	String no = request.getParameter("no");
	//session.setAttribute("no", no);
	//out.println(no);
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id1 = "scott";
	String pw1 = "1111";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버를 올린다
		con = DriverManager.getConnection(url, id1, pw1);
		
		String sql = "DELETE tblsawon WHERE no=?";
		%><%=sql %><%
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, no);
		pstmt.executeQuery();
	}
	catch(Exception err){}
	finally{
		if(pstmt!=null) try{pstmt.close();}catch(Exception err){}
		if(con!=null) try{con.close();}catch(Exception err){}
		response.sendRedirect("index.jsp");
		%><%=no %><%
	}
	
%>
</body>
</html>