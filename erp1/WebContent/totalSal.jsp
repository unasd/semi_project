<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>���� �޿� ��ȸ</h1>
<br/><br/>
<form method="post" action="totalSal.jsp">
	<select name="search">
		<option value="e.empno">���</option>
		<option value="e.ename">�̸�</option>
	</select>
	<input type="text" name="searchText"/>
	<input type="submit" value="�˻�" />
</form>
<table border="1">
	<tr>
		<th>���</th><th>�̸�</th><th>�μ�</th>
		<th>����</th><th>�⺻�޿�</th><th>�����޿�
	</tr>
<% 
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String getename=null, getgradename=null;
	int getempno=0, getdeptno=0, getgradeno=0, getsal=0, panel=50000;
	
	String url="jdbc:mysql://localhost:3306/testboard";
	String id="root";
	String pw="1111";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(url, id, pw);
		
		request.setCharacterEncoding("euc-kr");
		String search=request.getParameter("search");
		String searchText=request.getParameter("searchText");
		String sql="";
		try{
			if(searchText.isEmpty()){
				sql="SELECT e.empno, e.ename, e.deptno, g.gradename, g.gradeno "
					+"FROM emp e INNER JOIN grade g "
					+"ON e.gradeno=g.gradeno WHERE e.empno=1";	
			}
			else{
				sql="SELECT e.empno, e.ename, e.deptno, g.gradename, g.gradeno "
					+"FROM emp e INNER JOIN grade g "
					+"ON e.gradeno=g.gradeno WHERE "+search+"='"+searchText+"'";	
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			System.out.println(sql);
			%>
			<%=sql %>
			<%=search %>
			<%
			while(rs.next()){
				getempno=rs.getInt("e.empno");
				getename=rs.getString("e.ename");
				getdeptno=rs.getInt("e.deptno");
				getgradename=rs.getString("g.gradename");
				getgradeno=rs.getInt("g.gradeno");
			}
			
			sql="SELECT sal FROM sal WHERE deptno=10 AND gradeno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, getgradeno);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				getsal=rs.getInt("sal");
				%>
				<tr>
				<td><%=getempno %></td>
				<td><%=getename %></td>
				<td><%=getdeptno %></td>
				<td><%=getgradename %></td>
				<td><%=getsal %></td>
				<td><%=getsal-panel %></td>
				</tr>
				<%
			}	
		}
		catch(NullPointerException err){
			%>
			<script>
				//alert("�ش� ����� �����ϴ�.")
				//location.href="totalSal.jsp";
			</script>
			<%
		}
	}
	catch(Exception err){
		
	}
	finally{
		if(rs!=null)try{rs.close();}catch(Exception err){}
		if(pstmt!=null)try{pstmt.close();}catch(Exception err){}
		if(con!=null)try{con.close();}catch(Exception err){}
	}
%>
</table>
</body>
</html>