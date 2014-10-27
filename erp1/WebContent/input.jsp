<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<html>
<head></head>
<body>
<%@include file="inc/asdf.jsp" %>


   <form method="post" action="input.jsp">
      <div style="border: 1px" >         
         <div>
            <div>입고조회</div>
            <div>상품코드 : <input type="text" name="code" /></div>
            <div>입고갯수 : <input type="text" name="count" /></div>
         </div>
   <hr/>
         
            <div>               
               <input type="submit" value="전송" />               
            </div>
               
      </div>
   </form>


<table width="550" border="1">
<%
ResultSet rs = null;
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;
Statement stmt = null;

try{
   /* String url = "jdbc:oracle:thin:@192.168.10.49:1521:orcl";        // 사용하려는 데이터베이스명을 포함한 URL 기술
   String id = "jointest";                                                    // 사용자 계정
   String pw = "1111";                                                // 사용자 계정의 패스워드
   
   Class.forName("oracle.jdbc.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
   conn=DriverManager.getConnection(url,id,pw);  */
   
   String url = "jdbc:mysql://localhost:3306/testboard";        // 사용하려는 데이터베이스명을 포함한 URL 기술
   String id = "root";                                                    // 사용자 계정
   String pw = "1111";                                                // 사용자 계정의 패스워드

   Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
   conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
   
   
   String a = request.getParameter("code");
   String icount = request.getParameter("count");
   String sql = "select iname, cname, price, sprice from tlist where code = ?";                         // sql 쿼리
   pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
   pstmt.setString(1, a);
   rs = pstmt.executeQuery();
   rs.next();   
   String iname = rs.getString("iname");
   String cname = rs.getString("cname");
   int price = rs.getInt("price");
   int sprice = rs.getInt("sprice");

   String sql3 = "update tstock set count = count+ ? where code=?";		// tstock에서 해당 코드상품을 찾아 업데이트
   pstmt = conn.prepareStatement(sql3);	
   pstmt.setString(1, icount); 
   pstmt.setString(2, a);
   int result = pstmt.executeUpdate();   
   //out.println(result);
    if(result == 0){	// tstock에서 업데이트 되지 않았다면(해당 코드상품을 못찾았다면)
       String sql2 = "insert into tstock values(?, ?, ?, ?, ?, ?)";	// 해당 코드상품을 tstock에 인서트
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
   catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
      String a = request.getParameter("code");
      if(a != null)
      out.println("입력된 값이 없거나 리스트에 없는 상품입니다.");
   }
   finally   {                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
      if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
   }
%>
</table>
</body>
</html>