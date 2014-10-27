<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<html>
<head></head>
<script>
	function check() {
		var a = document.f.name.value;
		if(a.length==0){
 			alert("반드시 값을 입력하세요");
 		}
		
	}
</script>
<body>
<%@include file="inc/asdf.jsp" %>
<br/>
	<form name="f" method="post" action="output-search.jsp">
		<div style="border: 1px" >			
			<div>
				<div>출고조회</div>
				<div>조회항목 : <input type="text" name="name" /></div><br/>
				
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
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;

try{
	String url = "jdbc:mysql://localhost:3306/testboard";        // 사용하려는 데이터베이스명을 포함한 URL 기술
	String id = "root";                                                    // 사용자 계정
	String pw = "1111";                                                // 사용자 계정의 패스워드

	Class.forName("com.mysql.jdbc.Driver");                      // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
	conn=DriverManager.getConnection(url,id,pw); 
	response.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");
	/* String a = ;	
	String c = request.getParameter("name"); */	

	String sql = "select * from toutput where name = ?";                        // sql 쿼리
	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	pstmt.setString(1,request.getParameter("name"));
	rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	
	while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.
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
	//String sql1 = "select * from tinput where ((instr(name , ? , 1))>0)";// sql 쿼리
}
catch(SQLException e){
	String a = request.getParameter("name");
	if(a != null)
	out.println("입력된 값이 없거나 리스트에 없는 상품입니다.");
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
	finally	{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
	}
%>
</table>
</body>
</html>