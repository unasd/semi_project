<%@page import="java.sql.*"%>
<%@ page import="mybean.DBConnectionMgr" %>
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
	
	DBConnectionMgr pool = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	
	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		String sql = "DELETE tblsawon WHERE no=?";
		%><%=sql %><%
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, no);
		pstmt.executeQuery();
	}
	catch(Exception err){}
	finally{
		pool.freeConnection(con, pstmt);
		response.sendRedirect("index.jsp");
		%><%=no %><%
	}
	
%>
</body>
</html>