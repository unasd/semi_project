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
<br/>
<%@include file="inc/asdf.jsp" %>

   <form method="post" action="output.jsp">
      <div style="border: 1px" >         
         <div>
         <br/>
            <div>����Է�</div>
            <div>��ǰ�ڵ� : <input type="text" name="code" /></div>
            <div>����� : <input type="text" name="ocount" /></div>
         </div>
   <hr/>
         
            <div>               
               <input type="submit" value="����" />               
            </div>
               
      </div>
   </form>


<table width="550" border="1">
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;
Statement stmt = null;
int count=0;
String iname=null;

try{
   String url = "jdbc:mysql://localhost:3306/testboard";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���
   String id = "root";                                                    // ����� ����
   String pw = "1111";                                                // ����� ������ �н�����

   Class.forName("com.mysql.jdbc.Driver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
   conn=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
   
   
   String a = request.getParameter("code");
   int ocount = Integer.parseInt(request.getParameter("ocount"));
 
   String sql = "SELECT iname, count FROM tstock WHERE code=?";                         // sql ����
   pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
   pstmt.setString(1, a);
   rs = pstmt.executeQuery();
   while(rs.next()){
		iname = rs.getString("iname");
		count = rs.getInt("count");
	}
   out.println(iname+ ", " + count);
   
   if(count>=ocount){
	    String sql2 = "UPDATE tstock SET count=count-? WHERE code=?";
	    pstmt = conn.prepareStatement(sql2);
	    pstmt.setInt(1, ocount);
	    pstmt.setString(2, a);
		pstmt.executeUpdate();
		
		String sql3 = "INSERT INTO toutput VALUES(?, ?, ?, now())";
		pstmt=conn.prepareStatement(sql3);
		pstmt.setString(1, a);
		pstmt.setString(2, iname);
		pstmt.setInt(3, ocount);
		pstmt.executeUpdate();
		
		String sql4 = "SELECT count FROM tstock WHERE code=?";
		pstmt=conn.prepareStatement(sql4);
		pstmt.setString(1, a);
		rs=pstmt.executeQuery();
		rs.next();
		int b = rs.getInt("count");
		if(b==0){
			out.println("��� ��� �����Ǿ����ϴ�.");
		}
		else{
			out.println(iname+"�� ���� ���� "+b+"�Դϴ�.");		
		}
   } // if ��
   else if(count<ocount){
		out.println("��� �����մϴ�.");
	}
  } // try ��
 
   catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
      String a = request.getParameter("code");
      if(a != null)
      out.println("�Էµ� ���� ���ų� ����Ʈ�� ���� ��ǰ�Դϴ�.");
   }
   finally   {                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
      if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
   }
%>
</table>
</body>
</html>