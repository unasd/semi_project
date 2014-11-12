<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
<%@ page import = "semi.DBConnectionMgr" %>
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
 <link rel="stylesheet" type="text/css" href="css/table.css">
</head>


<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<br/>
	<form name="f" method="post" action="output-search.jsp">
		<div style="border: 1px" >			
			<div>
				<div>�����ȸ</div><br/>
				<div>��ǰ�� : <input type="text" name="name" /></div>
				<div>��ǰ�ڵ� : <input type="text" name="code" /></div>
				<div>��¥ : <input type="text" name="day" id="datepicker" /></div>
           		<div>�μ��� : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="����" />				
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
DBConnectionMgr pool = null;

try{
	pool=DBConnectionMgr.getInstance();
	conn=pool.getConnection();
	
	response.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");
	/* String a = ;	
	String c = request.getParameter("name"); */	

	String sql = "select * from toutput where name = ?";                        // sql ����
	pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	pstmt.setString(1,request.getParameter("name"));
	

	rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>
	<tr class="lv-bg">
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">�����</td>
		<td width="100">�����</td>
		<td width="100">�μ���ȣ</td>
	</tr>
<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		Date odate = rs.getDate("odate");
		int des = rs.getInt("des");
		
%>

	<tr class="lv-bg">
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=odate.toString()%></td>
		<td width="100"><%=des%></td>
	</tr>
<%
		}
	//String b = request.getParameter("code");
	//String sql1 = "select * from toutput where ((instr(name , ? , 1))>0)";// sql ����
}
catch(SQLException e){
	String a = request.getParameter("name");
	if(a != null)
	out.println("�Էµ� ���� ���ų� ����Ʈ�� ���� ��ǰ�Դϴ�.");
}
///�ڵ�˻�
try{
	String sql1 = "select * from toutput where code = ?";
	pstmt = conn.prepareStatement(sql1);                          
	pstmt.setString(1,request.getParameter("code"));
	rs = pstmt.executeQuery();                                    
	
	while(rs.next()){                                             
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		Date odate = rs.getDate("odate");
		int des = rs.getInt("des");
	 	
%>

	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=odate.toString()%></td>
		<td width="100"><%=des%></td>
	</tr> 
<%
		}


	}
	catch(Exception e){
		e.printStackTrace();
	}
///��¥�˻�
try{
	String sql1 = "select * from toutput where odate = ?";
	pstmt = conn.prepareStatement(sql1);                          
	pstmt.setString(1,request.getParameter("day"));
	rs = pstmt.executeQuery();                                    
	
	while(rs.next()){                                             
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		Date odate = rs.getDate("odate");
		int des = rs.getInt("des");
	 	
%>

	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=odate.toString()%></td>
		<td width="100"><%=des%></td>
	</tr> 
<%
		}


	}
	catch(Exception e){
		e.printStackTrace();
	}
///��¥�˻� �������� 2��
try{
	String sql1 = "select * from toutput where odate = ?";
	pstmt = conn.prepareStatement(sql1);                          
	pstmt.setString(1,"14/"+request.getParameter("day"));
	rs = pstmt.executeQuery();                                    
	
	while(rs.next()){                                             
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		Date odate = rs.getDate("odate");
		int des = rs.getInt("des");
	 	
%>

	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=odate.toString()%></td>
		<td width="100"><%=des%></td>
	</tr> 
<%
		}


	}
	catch(Exception e){
		e.printStackTrace();
	}
///�μ���˻�
try{
	String sql1 = "select * from toutput where des = ?";
	pstmt = conn.prepareStatement(sql1);                          
	pstmt.setString(1,request.getParameter("des"));
	rs = pstmt.executeQuery();                                    
	
	while(rs.next()){                                             
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		Date odate = rs.getDate("odate");
		int des = rs.getInt("des");
	 	
%>

	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=odate.toString()%></td>
		<td width="100"><%=des%></td>
	</tr> 
<%
		}


	}
	catch(Exception e){
		e.printStackTrace();
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