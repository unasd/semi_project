<%@page import="java.sql.*"%>
<%@ page import="mybean.DBConnectionMgr" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
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
	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		String sql = "INSERT INTO tblsawon VALUES(seq_no.nextVal, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, pass);
		pstmt.setString(4, age);
		pstmt.setString(5, addr);
		pstmt.setString(6, ext);
		pstmt.setString(7, dept);
		pstmt.executeUpdate();
		%>
		<script>
			alert("�� �ԷµǾ����ϴ�.");
			location.href="index.jsp";
		</script>
		<% 
	}
	
	
	catch(Exception err){
		%>
		<script>
			alert("�Է� ����.");
			location.href="addSawon.html";
		</script>
		<% 
	}
	finally{
		pool.freeConnection(con, pstmt);
		//response.sendRedirect("index.jsp");
	}
%>

