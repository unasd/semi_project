<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<script src="js/click_cal.js"></script></head>
<script>
	function check() {
		var a = document.f.code.value;
		var b = document.f.name.value;
		var c = document.f.idate.value;
		if(a.length==0 && b.length==0 && c.length==0){
 			alert("�˻��׸� �� ������ �ݵ�� �Է�");
 		}
		
	}
</script>
<body>
<%@include file="inc/asdf.jsp" %>
<br/>
	<form name="f" method="post" action="input-search.jsp">
		<div style="border: 1px" >			
			<div>
				<div>�԰���ȸ</div><br/>
				<div>��ǰ�ڵ� : <input type="text" name="code" /><br/><br/>
					 ��ǰ��	: &nbsp;&nbsp;&nbsp;<input type="text" name="name" /><br/><br/>
					 <!-- �԰��� : &nbsp;&nbsp;&nbsp;<input type="text" name="idate" /><br/><br/> -->
					 �԰��� : &nbsp;&nbsp;&nbsp;<input type="text" name="idate" OnClick="Calendar(this, 'down','no');"><br/><br/>
				</div><br/>
								
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
Statement stmt = null;
PreparedStatement pstmt = null;
String resultsql = null;


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
	String code = request.getParameter("code");
	out.println(code);
	String name = request.getParameter("name");
	out.println(name);
	String idate = request.getParameter("idate");
	out.println(idate);
	
	
	stmt=conn.createStatement();
	String sql1 = "select code from tinput where code="+code;
	out.println(sql1);
	boolean s_code = stmt.
	//rs=stmt.executeQuery(sql1);
	//pstmt = conn.prepareStatement(sql1);                          
	//pstmt.setString(1, code);
	//rs = pstmt.executeQuery();
	//rs.next();
	//int search_code = rs.getInt("code");
	out.println(s_code);
	

	//stmt=conn.createStatement();
	String sql = "select code from tinput where name='"+name+"'";                        // sql ����
	out.println(sql);
	boolean s_name = stmt.execute(sql);
	rs=stmt.executeQuery(sql);
	//pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	//pstmt.setString(1, name);
	//rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
	//rs.next();
	//int search_name = rs.getInt("code");  
	out.println(s_name);

	
	
	/* 
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int icount = rs.getInt("icount");
		Date idate = rs.getDate("idate");
		 */

		//} // while ��
	//String b = request.getParameter("code");
	//String sql1 = "select * from tinput where ((instr(name , ? , 1))>0)";// sql ����
	
	
	String sql2 = "SELECT code from tinput where idate='"+idate+"'";
	out.println(sql2);
	boolean s_date = stmt.execute(sql2);
	//rs=stmt.executeQuery(sql2);
	//pstmt=conn.prepareStatement(sql2);
	//pstmt.setString(1, idate);
	//rs=pstmt.executeQuery();
	//rs.next();
	//int search_date = rs.getInt("code");
	out.println(s_date);
	
	conn.createStatement();
	resultsql = "SELECT * FROM tinput WHERE code>0";
	if(s_code){resultsql+=" AND code="+code;}
	if(s_name){resultsql+=" AND name like '%"+name+"%'";}
	if(s_date){resultsql+=" AND idate='"+idate+"'";}
	out.println(resultsql);
	
	rs=stmt.executeQuery(resultsql);
	out.println(resultsql);
	while(rs.next()){
		int code1 = rs.getInt("code");
		String name1 = rs.getString("name");
		int icount1 = rs.getInt("icount");
		Date idate1 = rs.getDate("idate");
		
		%>

		<tr>
			<td width="100"><%=code1%></td>
			<td width="100"><%=name1%></td>
			<td width="100"><%=icount1%></td>
			<td width="100"><%=idate1.toString()%></td>
		</tr>
		<%
	}
	
	
	
	
	
}
catch(SQLException e){
	String a = request.getParameter("name");
	if(a != null)
	out.println("�Էµ� ���� ���ų� ����Ʈ�� ���� ��ǰ�Դϴ�.");
}
/* 
try{
	String sql1 = "select code from tinput where code = ?";
	pstmt = conn.prepareStatement(sql1);                          
	pstmt.setString(1,request.getParameter("code"));
	rs = pstmt.executeQuery();
	rs.next();
	int search_code = rs.getInt("code");
	
	String sql2 = "SELECT code from tinput where idate=?";
	pstmt=conn.prepareStatement(sql2);
	pstmt.setString(1, request.getParameter("idate"));
	rs=pstmt.executeQuery();
	rs.next();
	int search_date = rs.getInt("idate");
	
	
	
	 while(rs.next()){                                             
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int icount = rs.getInt("icount");
		Date idate = rs.getDate("idate");
	

		} 	// while ��


	}
	catch(Exception e){
	
	}
 */
	finally	{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
	}
%>
</table>
</body>
</html>