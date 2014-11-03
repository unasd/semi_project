<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html><head><title>Insert title here</title></head>
<body>

<h1>직원 정보 리스트</h1>
<a href="addSawon.html">직원 추가</a>
<table border="1">
	<tr>
		<th>사번</th><th>ID</th><th>이름</th><th>패스워드</th>
		<th>나이</th><th>근무지</th><th>부서명</th><th>내선번호</th>
	</tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost:3306/dbL3";
	String id = "root";
	String pw = "1111";
	
	try{
		Class.forName("org.gjt.mm.mysql.Driver"); // 드라이버를 올린다
		con = DriverManager.getConnection(url, id, pw);
		
		String sql = "select * from tblsawon";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			int getno = rs.getInt("no");
			String getid = rs.getString("id");
			String getname = rs.getString("name");
			String getpass = rs.getString("pass");
			int getage = rs.getInt("age");
			String getaddr = rs.getString("addr");
			String getext = rs.getString("ext");
			String getdept = rs.getString("dept");
			%>
			<tr>
			<td width="100"><%=getno%></td>
			<td width="100"><%=getid%></td>
			<td width="100"><%=getname%></td>
			<td width="100"><%=getpass%></td>
			<td width="100"><%=getage%></td>
			<td width="100"><%=getaddr%></td>
			<td width="100"><%=getext%></td>
			<td width="100"><%=getdept%></td>
			</tr>
		<% 
		
		}
		
	}
	catch(Exception err){
		System.out.println("index.jsp : " +err);
	}
	finally{
		if(rs!=null) try{rs.close();} catch(Exception err){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception err){}
		if(con!=null) try{con.close();} catch(Exception err){}
		
	}
%>

</table>
</body>
</html>