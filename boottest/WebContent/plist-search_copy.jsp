<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
<%@ page import = "semi.DBConnectionMgr" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">
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
</head>

<body>
<%@include file="inc/pasdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
	 <input type="hidden" name="command" value="plist-search" />
		<div style="border: 1px" >			
			<div>
				<div>�����ȸ</div><br/>
				<div>����� : <input type="text" name="name" /></div>
				<div>����ڵ� : <input type="text" name="code" /></div>
				<div>�Ի糯¥ : <input type="text" id="datepicker" name="day" /></div>
           		<div>�μ��ڵ� : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="����" /> 					
					 					
				</div>
					
		</div>
	</form>
	
<br/>
<table width="550" border="1">
	<tr class="lv-bg">
		<td width="50">����ڵ�</td>
		<td width="50">�����</td>
		<td width="50">�μ���ȣ</td>
		<td width="50">����</td>
		<td width="50">�Ի�����</td>
	</tr>
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;
DBConnectionMgr pool = null;
///�����ȣ + ��ü�˻�
try{
	pool=DBConnectionMgr.getInstance();
	conn=pool.getConnection();
	
	String sql=null;
	
	String c = request.getParameter("code");	
	String day = request.getParameter("day");	
	String des = request.getParameter("des");	
	String name = request.getParameter("name");
	
	if(c == "" && day ==""  && des=="" && name == ""){
		sql = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
		"where p.pnum = s.pnum order by pcode";                        // sql ����
		pstmt = conn.prepareStatement(sql);                         // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
		}
	if(c != "" ){
	sql = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
	"where p.pnum = s.pnum and pcode = ?"; 
	pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	pstmt.setString(1,c);// sql ����
	}

	
	rs = pstmt.executeQuery(); 


	                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>

<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int pcode = rs.getInt("pcode");
		String pname = rs.getString("pname");
		int pdes = rs.getInt("pdes");
		String posname = rs.getString("posname");
		String phdate = rs.getString("phdate");
		
		
%>		
	<tr class="lv-bg">
		<td width="50"><%=pcode%></td>
		<td width="50"><%=pname%></td>
		<td width="50"><%=pdes%></td>
		<td width="50"><%=posname%></td>
		<td width="50"><%=phdate%></td>
 
	</tr>

<%
		}

	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		/* e.printStackTrace();
		out.println("member ���̺� ȣ�⿡ �����߽��ϴ�."); */
	}
///�̸��˻�
try{
	String url = "jdbc:mysql://localhost:3306/testboard";
	String id = "root";                                                    // ����� ����
	String pw = "1234";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw); 
	String a = request.getParameter("name");	
	
	String sql1 = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
	"where p.pnum = s.pnum and pname = ?";                        // sql ����
	
	pstmt = conn.prepareStatement(sql1);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	pstmt.setString(1,a);
	


	rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>

<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int pcode = rs.getInt("pcode");
		String pname = rs.getString("pname");
		int pdes = rs.getInt("pdes");
		String posname = rs.getString("posname");
		String phdate = rs.getString("phdate");
		
	
%>		
	<tr class="lv-bg">
		<td width="50"><%=pcode%></td>
		<td width="50"><%=pname%></td>
		<td width="50"><%=pdes%></td>
		<td width="50"><%=posname%></td>
		<td width="50"><%=phdate%></td>
 
	</tr>

<%
		}

	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		/* e.printStackTrace();
		out.println("member ���̺� ȣ�⿡ �����߽��ϴ�."); */
	}
////�μ���ȣ
try{
	String url = "jdbc:mysql://localhost:3306/testboard";
	String id = "root";                                                    // ����� ����
	String pw = "1234";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw); 
	String des = request.getParameter("des");	
	
	String sql1 = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
	"where p.pnum = s.pnum and pdes = ?";                        // sql ����
	
	pstmt = conn.prepareStatement(sql1);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	pstmt.setString(1,des);
	


	rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>

<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int pcode = rs.getInt("pcode");
		String pname = rs.getString("pname");
		int pdes = rs.getInt("pdes");
		String posname = rs.getString("posname");
		String phdate = rs.getString("phdate");
		

%>		
	<tr class="lv-bg">
		<td width="50"><%=pcode%></td>
		<td width="50"><%=pname%></td>
		<td width="50"><%=pdes%></td>
		<td width="50"><%=posname%></td>
		<td width="50"><%=phdate%></td>
	
	</tr>

<%
		}

	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		/* e.printStackTrace();
		out.println("member ���̺� ȣ�⿡ �����߽��ϴ�."); */
	}
////�Ի���
try{
String url = "jdbc:mysql://localhost:3306/testboard";
String id = "root";                                                    // ����� ����
String pw = "1234";                                                // ����� ������ �н�����

Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
conn=DriverManager.getConnection(url,id,pw); 
String day = request.getParameter("day");	

String sql1 = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
"where p.pnum = s.pnum and phdate = ?";                        // sql ����

pstmt = conn.prepareStatement(sql1);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
pstmt.setString(1,day);



rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>

<%	
while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
	int pcode = rs.getInt("pcode");
	String pname = rs.getString("pname");
	int pdes = rs.getInt("pdes");
	String posname = rs.getString("posname");
	String phdate = rs.getString("phdate");
	

%>		
<tr class="lv-bg">
	<td width="50"><%=pcode%></td>
	<td width="50"><%=pname%></td>
	<td width="50"><%=pdes%></td>
	<td width="50"><%=posname%></td>
	<td width="50"><%=phdate%></td>

</tr>

<%
	}

}
catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
	/* e.printStackTrace();
	out.println("member ���̺� ȣ�⿡ �����߽��ϴ�."); */
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