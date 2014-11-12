<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">

</head>

<body>
<%@include file="inc/pasdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="des-sal-search.jsp">
			
			<div>
				<div></div><br/>
				<div>�μ���ȣ �˻� : <input type="text" name="des" /></div>				
				<div>���� �˻� : <input type="text" name="posname" /></div>				
			</div>
			<hr/>
			<div>
				<div>
					<input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;					
				</div> 	
			</div>			
		
	</form>
	
<br/>
<table width="550" border="1">
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;
 

///���ް˻�
try{
	String url = "jdbc:mysql://localhost:3306/testboard";
	String id = "root";                                                    // ����� ����
	String pw = "1234";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw); 
	response.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");
	
	String posname1 = request.getParameter("posname");
	
		String sql1 = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum and posname=?"; 
		pstmt = conn.prepareStatement(sql1);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
		pstmt.setString(1,posname1);
		rs = pstmt.executeQuery();// sql ����
	
	%>
		<tr class="lv-bg">		
			<td width="50">�μ���ȣ</td>
			<td width="50">����</td>
			<td width="50">�޿�</td>
		</tr>
	<%	

		while(rs.next()){	
			int pdes = rs.getInt("pdes");
		String posname = rs.getString("posname");	
		int psa = rs.getInt("psa");
	%>		
	<tr class="lv-bg">
		<td width="50"><%=pdes%></td>
		<td width="50"><%=posname%></td>
		<td width="50"><%=psa%></td>
	</tr>

	<%
	}
	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		//e.printStackTrace();
		//out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
	}
///��ü�˻� , �μ���ȣ�˻�
try{
	String url = "jdbc:mysql://localhost:3306/testboard";
	String id = "root";                                                    // ����� ����
	String pw = "1234";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw); 
	String des = request.getParameter("des");
	String posname1 = request.getParameter("posname");
	 
	if(des == "" && posname1 == ""){
		String sql = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum";
		pstmt = conn.prepareStatement(sql);                        // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	}
	
	if(des != ""){
		String sql1 = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum and pdes=?"; 
		pstmt = conn.prepareStatement(sql1);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
		pstmt.setString(1,des);
	}	
	
		rs = pstmt.executeQuery();// sql ����
	

	while(rs.next()){	
	int pdes = rs.getInt("pdes");
	String posname = rs.getString("posname");	
	int psa = rs.getInt("psa");
%>		
<tr class="lv-bg">
	<td width="50"><%=pdes%></td>
	<td width="50"><%=posname%></td>
	<td width="50"><%=psa%></td>
</tr>

<%
}
	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		//e.printStackTrace();
		//out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
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