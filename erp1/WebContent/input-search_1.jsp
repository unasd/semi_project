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
}
catch(Exception err){
}
	String code =null;
	String name =null;
	String idate =null;
	
	code = request.getParameter("code");
	//out.println("code : "+code+"<br/>");
	name = request.getParameter("name");
	//out.println("name : "+name+"<br/>");
	idate = request.getParameter("idate");
	//out.println("idate : "+idate+"<br/>");
	
	int s_code=0;
	int s_name=0;
	int s_date=0;
	
	try{
		stmt=conn.createStatement();
		String sql1 = "select code from tinput where code="+code;
		out.println("sql1 : " +sql1+"<br/>");
		
		rs=stmt.executeQuery(sql1);
		rs.next();
		s_code = rs.getInt("code");
		out.println("s_code : "+s_code+"<br/>");
	}
	catch(Exception err){
		System.out.println("sql1 : "+err);
	}
	

	try{	
		String sql2 = "select code from tinput where name='"+name+"'";                        // sql 쿼리
		out.println("sql2 : "+sql2+"<br/>");
		
		rs=stmt.executeQuery(sql2);                               // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		rs.next();
		s_name = rs.getInt("code");  
		out.println("s_name : "+s_name+"<br/>");
	}
	catch(Exception err){
		System.out.println("sql2 : "+err);
	}

	
	try{ 
		String sql3 = "SELECT code from tinput where idate='"+idate+"'";
		out.println("sql3 : "+sql3+"<br/>");
		
		rs=stmt.executeQuery(sql3);
		rs.next();
		s_date = rs.getInt("code");
		out.println("s_date : "+s_date+"<br/>");
	}
	catch(Exception err){
		System.out.println("sql3 : "+err);
	}


	resultsql = "SELECT * FROM tinput WHERE 1=1";
	if(s_code>0){resultsql+=" AND code="+code;}
	if(s_name>0){resultsql+=" AND name='"+name+"'";}
	if(s_date>0){resultsql+=" AND idate='"+idate+"'";}
	//out.println(resultsql);
	
	rs=stmt.executeQuery(resultsql);
	out.println("resultsql : "+resultsql+"<br/>");
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

%>
</table>
</body>
</html>