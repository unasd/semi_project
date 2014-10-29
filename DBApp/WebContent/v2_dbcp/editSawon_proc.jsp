<%@page import="java.sql.*"%>
<%@ page import="mybean.DBConnectionMgr" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head><meta charset="EUC-KR"><title>Insert title here</title></head>
<body>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	String ext = request.getParameter("ext");
	String dept = request.getParameter("dept");
	
	DBConnectionMgr pool = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	
	//String no = (String)session.getAttribute("no");
	String no = request.getParameter("no");
	
	
	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		String sql = "UPDATE tblsawon SET id=?, name=?, pass=?, age=?, addr=?, " 
				+"ext=?, dept=? WHERE no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, pass);
		pstmt.setString(4, age);
		pstmt.setString(5, addr);
		pstmt.setString(6, ext);
		pstmt.setString(7, dept);
		pstmt.setString(8, no);
		pstmt.executeUpdate();
		%>
		<script>
			alert("잘 수정되었습니다.");
			location.href="index.jsp";
		</script>
		<% 
	}

	
	
	catch(Exception err){
		System.out.println("index.jsp : "+err);
	}
	finally{
		pool.freeConnection(con, pstmt);
		//response.sendRedirect("index.jsp");
	}
%>
</body>
</html>

