<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head></head>
<body>
<%@include file="inc/asdf.jsp" %>
	<form method="post" action="stock-search.jsp">
		<table style="border: 1px solid black">			
			<tr>
				<td>��ǰ�ڵ� : </td>
				<td><input type="text" name="code" /></td>
			</tr>
	
				<tr>
				<td colspan="2" align="center">
					<input type="submit" value="����" />&nbsp;&nbsp;&nbsp;
					<input type="reset" value="���">
				</td> 	
			</tr>
			
		</table>
	</form>

<table width="550" border="1">
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;

try{
	String url = "jdbc:mysql://localhost:3306/testboard";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���
	String id = "root";                                                    // ����� ����
	String pw = "1111";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw); 
	String a = request.getParameter("code");
	
	String sql = "select * from tstock where code = ?";                        // sql ����
	pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	pstmt.setString(1,a);

	rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>
	<tr>
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">��ü��</td>
		<td width="100">���</td>
		<td width="100">�԰�ܰ�</td>
		<td width="100">�ǸŴܰ�</td>
	</tr>
<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int code = rs.getInt("code");
		String iname = rs.getString("iname");
		String cname = rs.getString("cname");
		int count = rs.getInt("count");
		int price = rs.getInt("price");
		int sprice = rs.getInt("sprice");
		
		
%>		
	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=iname%></td>
		<td width="100"><%=cname%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=price%></td>
		<td width="100"><%=sprice%></td>
	</tr>

<%
		}

	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		e.printStackTrace();
		out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
	}
	finally	{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
	}
%>
</table>
</body>
</html>