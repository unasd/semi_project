<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html><head><title>Insert title here</title></head>
<body>

<h1>���� ���� ����Ʈ</h1>
<a href="addSawon.html">���� �߰�</a>
<table border="1">
	<tr>
		<th>���</th><th>ID</th><th>�̸�</th><th>�н�����</th>
		<th>����</th><th>�ٹ���</th><th>�μ���</th><th>������ȣ</th>
	</tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost:3306/dbL3";
	String id = "root";
	String pw = "1111";
	
	try{
		Class.forName("org.gjt.mm.mysql.Driver"); // ����̹��� �ø���
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