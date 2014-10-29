<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
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
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		Context ctx = new InitialContext(); // context의 정보를 갖고 
		DataSource ds = 
			(DataSource)ctx.lookup("java:comp/env/jdbc/L3DB"); // 가상프로토콜/정의한 이름
		con = ds.getConnection();
		
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
			alert("잘 입력되었습니다.");
			location.href="index.jsp";
		</script>
		<% 
	}
	
	
	catch(Exception err){
		%>
		<script>
			alert("입력 오류.");
			location.href="addSawon.html";
		</script>
		<% 
	}
	finally{
		if(pstmt!=null) try{pstmt.close();}catch(Exception err){}
		if(con!=null) try{con.close();}catch(Exception err){}
		//response.sendRedirect("index.jsp");
	}
%>

