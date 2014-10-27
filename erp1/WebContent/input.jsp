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


   <form method="post" action="input.jsp">
      <div style="border: 1px" >         
         <div>
            <div>�԰���ȸ</div>
            <div>��ǰ�ڵ� : <input type="text" name="code" /></div>
            <div>�԰��� : <input type="text" name="count" /></div>
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

try{
   /* String url = "jdbc:oracle:thin:@192.168.10.49:1521:orcl";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���
   String id = "jointest";                                                    // ����� ����
   String pw = "1111";                                                // ����� ������ �н�����
   
   Class.forName("oracle.jdbc.OracleDriver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
   conn=DriverManager.getConnection(url,id,pw);  */
   
   String url = "jdbc:mysql://localhost:3306/testboard";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���
   String id = "root";                                                    // ����� ����
   String pw = "1111";                                                // ����� ������ �н�����

   Class.forName("com.mysql.jdbc.Driver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
   conn=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
   
   
   String a = request.getParameter("code");
   String icount = request.getParameter("count");
   String sql = "select iname, cname, price, sprice from tlist where code = ?";                         // sql ����
   pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
   pstmt.setString(1, a);
   rs = pstmt.executeQuery();
   rs.next();   
   String iname = rs.getString("iname");
   String cname = rs.getString("cname");
   int price = rs.getInt("price");
   int sprice = rs.getInt("sprice");

   String sql3 = "update tstock set count = count+ ? where code=?";		// tstock���� �ش� �ڵ��ǰ�� ã�� ������Ʈ
   pstmt = conn.prepareStatement(sql3);	
   pstmt.setString(1, icount); 
   pstmt.setString(2, a);
   int result = pstmt.executeUpdate();   
   //out.println(result);
    if(result == 0){	// tstock���� ������Ʈ ���� �ʾҴٸ�(�ش� �ڵ��ǰ�� ��ã�Ҵٸ�)
       String sql2 = "insert into tstock values(?, ?, ?, ?, ?, ?)";	// �ش� �ڵ��ǰ�� tstock�� �μ�Ʈ
       //System.out.println(sql2);
       pstmt = conn.prepareStatement(sql2);
       pstmt.setString(1, a); //code
       pstmt.setString(2, iname); // iname
       pstmt.setString(3, cname); // cname
       pstmt.setString(4, icount); // count
       pstmt.setInt(5, price); // price
       pstmt.setInt(6, sprice); // sprice
       pstmt.executeUpdate();
       
       String sql4 = "insert into tinput values(? , ?, ?, now())";
       pstmt = conn.prepareStatement(sql4);
       pstmt.setString(1, a);
       pstmt.setString(2, iname);
       pstmt.setString(3, icount);
       pstmt.executeUpdate();
       
    }
    else{    	
       String sql4 = "insert into tinput values(?, ?, ?, now())";        
       pstmt = conn.prepareStatement(sql4);
       pstmt.setString(1, a);
       pstmt.setString(2, iname);
       pstmt.setString(3, icount);
       pstmt.executeUpdate();
    }
  
   }
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