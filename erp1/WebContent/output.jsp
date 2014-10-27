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
<br/>
<%@include file="inc/asdf.jsp" %>

   <form method="post" action="output.jsp">
      <div style="border: 1px" >         
         <div>
         <br/>
            <div>출고입력</div>
            <div>상품코드 : <input type="text" name="code" /></div>
            <div>출고갯수 : <input type="text" name="ocount" /></div>
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
int count=0;
String iname=null;

try{
   String url = "jdbc:mysql://localhost:3306/testboard";        // 사용하려는 데이터베이스명을 포함한 URL 기술
   String id = "root";                                                    // 사용자 계정
   String pw = "1111";                                                // 사용자 계정의 패스워드

   Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
   conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
   
   
   String a = request.getParameter("code");
   int ocount = Integer.parseInt(request.getParameter("ocount"));
 
   String sql = "SELECT iname, count FROM tstock WHERE code=?";                         // sql 쿼리
   pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
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
			out.println("재고가 모두 소진되었습니다.");
		}
		else{
			out.println(iname+"의 남은 재고는 "+b+"입니다.");		
		}
   } // if 끝
   else if(count<ocount){
		out.println("재고가 부족합니다.");
	}
  } // try 끝
 
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