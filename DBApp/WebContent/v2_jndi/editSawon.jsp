<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head><meta charset="EUC-KR"><title>Insert title here</title></head>
<body>
<%!
	String id, name, pass, addr, ext, dept, age;
%>
<%	
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
	
	String no = request.getParameter("no");
	//session.setAttribute("no", no);
	//out.println(no);
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id1 = "scott";
	String pw1 = "1111";
	
	
	
	try{
		Context ctx = new InitialContext(); // context의 정보를 갖고 
		DataSource ds = 
			(DataSource)ctx.lookup("java:comp/env/jdbc/L3DB"); // 가상프로토콜/정의한 이름
		con = ds.getConnection();
		
		String sql = "SELECT id, name, age, pass, addr, ext, dept FROM tblsawon WHERE no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, no);
		rs = pstmt.executeQuery();
		while(rs.next()){
			id = rs.getString("id");
			name = rs.getString("name");
			age = new String().valueOf(rs.getInt("age"));
			pass = rs.getString("pass");
			addr = rs.getString("addr");
			ext = rs.getString("ext");	
			dept = rs.getString("dept");	
		}	
	}	
	catch(Exception err){}
	finally{
		if(pstmt!=null) try{pstmt.close();}catch(Exception err){}
		if(con!=null) try{con.close();}catch(Exception err){}
	}
	
%>
<h1>사원 수정</h1>
<form method="post" action="editSawon_proc.jsp">
<input type="hidden" name="no" value="<%=no %>" />  <!-- no값을 숨겨서 넘긴다 -->
<table border="1">
	<tr>
		<td>아이디 :  </td>
		<td><input type="text" name="id" value="<%=id %>"/></td>
	</tr>
	<tr>
		<td>이름 :  </td>
		<td><input type="text" name="name" value="<%=name %>"/></td>
	</tr>
	<tr>
		<td>나이 :  </td>
		<td><input type="text" name="age" value="<%=age %>"/></td>
	</tr>
	<tr>
		<td>패스워드 :  </td>
		<td><input type="text" name="pass" value="<%=pass %>"/></td>
	</tr>
	<tr>
		<td>근무지 :  </td>
		<td>
			<select name="addr">
				<option value="서울" <%if(addr.equals("서울")){%> selected="true" <%}%>>서울</option>
				<option value="경기" <%if(addr.equals("경기")){%> selected="true" <%}%>>경기</option>
				<option value="광주" <%if(addr.equals("광주")){%> selected="true" <%}%>>광주</option>
				<option value="부산" <%if(addr.equals("부산")){%> selected="true" <%}%>>부산</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>내선번호 :  </td>
		<td><input type="text" name="ext" value="<%=ext %>"/></td>
	</tr>
	<tr>
		<td>부서명 :  </td>
		<td>
			<select name="dept">
				<option value="영업" <%if(dept.equals("영업")){%> selected="true" <%}%>>영업</option>
				<option value="기술" <%if(dept.equals("기술")){%> selected="true" <%}%>>기술</option>
				<option value="기획" <%if(dept.equals("기획")){%> selected="true" <%}%>>기획</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시 작성" />
		</td>
	</tr>
</table>
</form>
</body>
</html>