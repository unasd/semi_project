<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script>
		function fnDeleteChk(no){
			var result = confirm("���� �����Ͻðڽ��ϱ�?");
			
			if(result == true){
				location.href="deleteSawon.jsp?no=" +no;	
			}
		}
	</script>
</head>
<body>
<h1>���� ���� ����Ʈ</h1>
<a href="addSawon.html">���� �߰�</a>
<br/><br/>
<form method="post" action="index.jsp">
	<select name="search">
		<option value="id">���̵�</option>
		<option value="name">�̸�</option>
		<option value="dept">�μ�</option>
		<option value="addr">�ٹ���</option>
	</select>
	<input type="text" name="searchText"/>
	<input type="submit" value="�˻�" />
</form>
<table border="1">
	<tr>
		<th>���</th><th>ID</th><th>�̸�</th><th>�н�����</th>
		<th>����</th><th>�ٹ���</th><th>������ȣ</th><th>�μ���</th>
		<th>����</th><th>����</th>
	</tr>
<%
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	String sql = "";
	
	try{
		if(searchText.isEmpty()){
			sql = "SELECT * FROm tblsawon";
		}
		else{
			sql = "SELECT * FROM tblsawon WHERE "
				+search+" like '%"+searchText+"%'";
		}
	}
	catch(NullPointerException err){
		sql = "SELECT * FROm tblsawon";
	}
	
	
	try{
		Context ctx = new InitialContext(); // context�� ������ ���� 
		DataSource ds = 
			(DataSource)ctx.lookup("java:comp/env/jdbc/L3DB"); // ������������/������ �̸�
		con = ds.getConnection();
		
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
			<td><%=getno%></td>
			<td><%=getid%></td>
			<td><%=getname%></td>
			<td><%=getpass%></td>
			<td><%=getage%></td>
			<td><%=getaddr%></td>
			<td><%=getext%></td>
			<td><%=getdept%></td>
			<td><a href="editSawon.jsp?no=<%=getno%>">����</a></td>
			<td><a href="javascript:fnDeleteChk('<%=getno%>')">����</a></td>
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