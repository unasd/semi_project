<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<html>
<head>
<script src="js/click_cal.js"></script></head>
<script>
	function check() {
		var a = document.f.code.value;
		var b = document.f.name.value;
		var c = document.f.idate.value;
		if(a.length==0 && b.length==0 && c.length==0){
 			alert("검색항목 한 가지는 반드시 입력");
 		}
		
	}
</script>
<body>
<%@include file="inc/asdf.jsp" %>
<br/>
	<form name="f" method="post" action="input-search.jsp">
		<div style="border: 1px" >			
			<div>
				<div>입고조회</div><br/>
				<div>상품코드 : <input type="text" name="code" /><br/><br/>
					 상품명	: &nbsp;&nbsp;&nbsp;<input type="text" name="name" /><br/><br/>
					 <!-- 입고일 : &nbsp;&nbsp;&nbsp;<input type="text" name="idate" /><br/><br/> -->
					 입고일 : &nbsp;&nbsp;&nbsp;<input type="text" name="idate" OnClick="Calendar(this, 'down','no');"><br/><br/>
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
Connection conn = null;                                        // null로 초기화 한다.
Statement stmt = null;
PreparedStatement pstmt = null;
String resultsql = null;


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
	String code = request.getParameter("code");
	out.println(code);
	String name = request.getParameter("name");
	out.println(name);
	String idate = request.getParameter("idate");
	out.println(idate);
	
	
	stmt=conn.createStatement();
	String sql1 = "select code from tinput where code="+code;
	out.println(sql1);
	
	rs=stmt.executeQuery(sql1);
	//pstmt = conn.prepareStatement(sql1);                          
	//pstmt.setString(1, code);
	//rs = pstmt.executeQuery();
	rs.next();
	int s_code = rs.getInt("code");
	out.println(s_code);
	

	//stmt=conn.createStatement();
	String sql = "select code from tinput where name='"+name+"'";                        // sql 쿼리
	out.println(sql);
	rs=stmt.executeQuery(sql);
	//pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	//pstmt.setString(1, name);
	//rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	rs.next();
	int s_name = rs.getInt("code");  
	out.println(s_name);

	
	
	/* 
	while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int icount = rs.getInt("icount");
		Date idate = rs.getDate("idate");
		 */

		//} // while 끝
	//String b = request.getParameter("code");
	//String sql1 = "select * from tinput where ((instr(name , ? , 1))>0)";// sql 쿼리
	
	
	String sql2 = "SELECT code from tinput where idate='"+idate+"'";
	out.println(sql2);
	rs=stmt.executeQuery(sql2);
	//pstmt=conn.prepareStatement(sql2);
	//pstmt.setString(1, idate);
	//rs=pstmt.executeQuery();
	rs.next();
	int s_date = rs.getInt("code");
	out.println(s_date);
	
	//stmt=conn.createStatement();
	resultsql = "SELECT * FROM tinput WHERE 1=1";
	if(s_code>0){resultsql+=" AND code="+code;}
	if(s_name>0){resultsql+=" AND name like '%"+name+"%'";}
	if(s_date>0){resultsql+=" AND idate='"+idate+"'";}
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
catch(NullPointerException err){
	
}
catch(SQLException e){
String a = request.getParameter("name");
if(a != null)
out.println("입력된 값이 없거나 리스트에 없는 상품입니다.");
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
	

		} 	// while 끝


	}
	catch(Exception e){
	
	}
 */
	finally	{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
	}
%>
</table>
</body>
</html>