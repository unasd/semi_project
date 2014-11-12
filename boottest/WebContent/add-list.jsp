<%@page import="semi.DBConnectionMgr" %>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

   <form method="post" action="add-list.jsp">
      <div style="border: 1px" >         
         <div>
            <div>��ǰ ����Ʈ �߰�</div>
            <div>��ǰ �ڵ� : <input type="text" name="code" /></div>
            <div>��ǰ�� : <input type="text" name="name" /></div>
            <div>��ü�� : <input type="text" name="com" /></div>
            <div>�԰�ܰ� : <input type="text" name="price" /></div>
            <div>���ܰ� : <input type="text" name="sprice" /></div>
            <div>�μ��ڵ� : <input type="text" name="desc" /></div>
         </div>
   <hr/>
         
            <div>               
               <input class="b1" type="submit" value="����" /> 
               <input class="b1" type="reset" value="reset" />              
            </div>
               
      </div>
   </form>


<table width="550" border="1">
<%
DBConnectionMgr pool = null;
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;

try{
   pool = DBConnectionMgr.getInstance();		
   conn= pool.getConnection(); 
   request.setCharacterEncoding("euc-kr");
   response.setCharacterEncoding("euc-kr");
   
             // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
   
   
	String a = request.getParameter("code");  
	String name = request.getParameter("name");
	String com = request.getParameter("com");
	String price = request.getParameter("price");
	String sprice = request.getParameter("sprice");
	String desc = request.getParameter("desc");


////////////////////
	String sql3 = "update tlist set code = code where code=?";
	pstmt = conn.prepareStatement(sql3);
        
	pstmt.setString(1, a); //code   
	int result = pstmt.executeUpdate();   
	if(result == 0){
    	String sql4 = "insert into tlist values(?, ?, ?, ?, ?, ?)";            
        pstmt = conn.prepareStatement(sql4);
        pstmt.setString(1, a);
        pstmt.setString(2, name);
        pstmt.setString(3, com);
        pstmt.setString(4, price);
        pstmt.setString(5, sprice);
        pstmt.setString(6, desc);
        pstmt.executeUpdate();
    	
    }
    else{    	
    	out.println("�ڵ尡 �ߺ��Ǿ����ϴ�..");
    }

/////////////////////////

   
   }
   catch(Exception e){                                                   // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

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