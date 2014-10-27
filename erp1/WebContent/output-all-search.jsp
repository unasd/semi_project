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
<form method="post" action="input-all-search.jsp">
���� : 
<input type="radio" name="code" value="code" />��ǰ�ڵ�&nbsp;
<input type="radio" name="code" value="ocount" />����&nbsp;
<input type="radio" name="code" value="odate" />�����&nbsp;
<input type="submit" value="����" />&nbsp;
</form>


<table width="550" border="1">
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
Statement pstmt = null;

try{
	String url = "jdbc:mysql://localhost:3306/testboard";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���
	String id = "root";                                                    // ����� ����
	String pw = "1111";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                           // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw);
	
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String sort = request.getParameter("code");
	
	out.println(sort);
	String sql = "select * from toutput order by "+sort;                        // sql ����
	out.println(sql);
	pstmt = conn.createStatement();                       // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	rs = pstmt.executeQuery(sql);                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>
	<tr>
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">�����</td>
		<td width="100">�����</td>
	</tr>
<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int ocount = rs.getInt("ocount");
		Date odate = rs.getDate("odate");	
		
%>		
	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=ocount%></td>
		<td width="100"><%=odate%></td>
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