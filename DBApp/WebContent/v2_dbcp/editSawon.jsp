<%@page import="java.sql.*"%>
<%@ page import="mybean.DBConnectionMgr" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head><meta charset="EUC-KR"><title>Insert title here</title></head>
<body>
<%!
	String id, name, pass, addr, ext, dept, age;
%>
<%	
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
	
	String no = request.getParameter("no");
	//session.setAttribute("no", no);
	//out.println(no);
	
	DBConnectionMgr pool = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		String sql = "SELECT id, name, age, pass, addr, ext, dept FROM tblsawon WHERE no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, no);
		rs = pstmt.executeQuery();
		while(rs.next()){
			id = rs.getString("id");
			name = rs.getString("name");
			age = new String().valueOf(rs.getInt("age"));
			pass = rs.getString("pass");
			addr = rs.getString("addr");
			ext = rs.getString("ext");	
			dept = rs.getString("dept");	
		}	
	}	
	catch(Exception err){}
	finally{
		pool.freeConnection(con, pstmt, rs);
	}
	
%>
<h1>��� ����</h1>
<form method="post" action="editSawon_proc.jsp">
<input type="hidden" name="no" value="<%=no %>" />  <!-- no���� ���ܼ� �ѱ�� -->
<table border="1">
	<tr>
		<td>���̵� :  </td>
		<td><input type="text" name="id" value="<%=id %>"/></td>
	</tr>
	<tr>
		<td>�̸� :  </td>
		<td><input type="text" name="name" value="<%=name %>"/></td>
	</tr>
	<tr>
		<td>���� :  </td>
		<td><input type="text" name="age" value="<%=age %>"/></td>
	</tr>
	<tr>
		<td>�н����� :  </td>
		<td><input type="text" name="pass" value="<%=pass %>"/></td>
	</tr>
	<tr>
		<td>�ٹ��� :  </td>
		<td>
			<select name="addr">
				<option value="����" <%if(addr.equals("����")){%> selected="true" <%}%>>����</option>
				<option value="���" <%if(addr.equals("���")){%> selected="true" <%}%>>���</option>
				<option value="����" <%if(addr.equals("����")){%> selected="true" <%}%>>����</option>
				<option value="�λ�" <%if(addr.equals("�λ�")){%> selected="true" <%}%>>�λ�</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>������ȣ :  </td>
		<td><input type="text" name="ext" value="<%=ext %>"/></td>
	</tr>
	<tr>
		<td>�μ��� :  </td>
		<td>
			<select name="dept">
				<option value="����" <%if(dept.equals("����")){%> selected="true" <%}%>>����</option>
				<option value="���" <%if(dept.equals("���")){%> selected="true" <%}%>>���</option>
				<option value="��ȹ" <%if(dept.equals("��ȹ")){%> selected="true" <%}%>>��ȹ</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="����" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="�ٽ� �ۼ�" />
		</td>
	</tr>
</table>
</form>
</body>
</html>