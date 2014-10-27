<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head></head>
<script>
	function check() {
		var a = document.f.name.value;
		if(a.length==0){
 			alert("�ݵ�� ���� �Է��ϼ���");
 		}
		
	}
</script>
<body>
<%@include file="inc/asdf.jsp" %>
<br/>
	<form name="f" method="post" action="output-search.jsp">
		<div style="border: 1px" >			
			<div>
				<div>�����ȸ</div>
				<div>��ȸ�׸� : <input type="text" name="name" /></div><br/>
				
			</div>
	<hr/>
			
				<div>					
					<input type="image" src="images/a.png" name="Submit" value="submit" onclick="check()" >					
				</div>
					
		</div>
	</form>


				
<br/>
<table width="550" border="1">
<br/>
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
	response.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");
	/* String a = ;	
	String c = request.getParameter("name"); */	

	String sql = "select * from toutput where name = ?";                        // sql ����
	pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	pstmt.setString(1,request.getParameter("name"));
	rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
	
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
		<td width="100"><%=odate.toString()%></td>
	</tr>
<%
		}
	//String b = request.getParameter("code");
	//String sql1 = "select * from tinput where ((instr(name , ? , 1))>0)";// sql ����
}
catch(SQLException e){
	String a = request.getParameter("name");
	if(a != null)
	out.println("�Էµ� ���� ���ų� ����Ʈ�� ���� ��ǰ�Դϴ�.");
}
try{
	String sql1 = "select * from toutput where code = ?";
	pstmt = conn.prepareStatement(sql1);                          
	pstmt.setString(1,request.getParameter("name"));
	rs = pstmt.executeQuery();                                    
	
	while(rs.next()){                                             
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int ocount = rs.getInt("ocount");
		Date odate = rs.getDate("odate");
	 	
%>

	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=ocount%></td>
		<td width="100"><%=odate.toString()%></td>
	</tr> 
<%
		}


	}
	catch(Exception e){
	
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