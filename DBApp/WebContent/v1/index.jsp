<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script>
		function fnDeleteChk(no){
			var result = confirm("정말 삭제하시겠습니까?");
			
			if(result == true){
				location.href="deleteSawon.jsp?no=" +no;	
			}
		}
	</script>
</head>
<body>
<h1>직원 정보 리스트</h1>
<a href="addSawon.html">직원 추가</a>
<br/><br/>
<form method="post" action="index.jsp">
	<select name="search">
		<option value="id">아이디</option>
		<option value="name">이름</option>
		<option value="dept">부서</option>
		<option value="addr">근무지</option>
	</select>
	<input type="text" name="searchText"/>
	<input type="submit" value="검색" />
</form>
<table border="1">
	<tr>
		<th>사번</th><th>ID</th><th>이름</th><th>패스워드</th>
		<th>나이</th><th>근무지</th><th>내선번호</th><th>부서명</th>
		<th>수정</th><th>삭제</th>
	</tr>
<%
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "scott";
	String pw = "1111";
	
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	String sql = "";
	
	try{
		if(searchText.isEmpty()){
			sql = "SELECT * FROm tblsawon";
		}
		else{
			sql = "SELECT * FROM tblsawon WHERE "
				+search+" like '%"+searchText+"%'";
		}
	}
	catch(NullPointerException err){
		sql = "SELECT * FROm tblsawon";
	}
	
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버를 올린다
		con = DriverManager.getConnection(url, id, pw);
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			int getno = rs.getInt("no");
			String getid = rs.getString("id");
			String getname = rs.getString("name");
			String getpass = rs.getString("pass");
			int getage = rs.getInt("age");
			String getaddr = rs.getString("addr");
			String getext = rs.getString("ext");
			String getdept = rs.getString("dept");
			%>
			<tr>
			<td><%=getno%></td>
			<td><%=getid%></td>
			<td><%=getname%></td>
			<td><%=getpass%></td>
			<td><%=getage%></td>
			<td><%=getaddr%></td>
			<td><%=getext%></td>
			<td><%=getdept%></td>
			<td><a href="editSawon.jsp?no=<%=getno%>">수정</a></td>
			<td><a href="javascript:fnDeleteChk('<%=getno%>')">삭제</a></td>
			</tr>
		<% 
		}	
	}
	catch(Exception err){
		System.out.println("index.jsp : " +err);
	}
	finally{
		if(rs!=null) try{rs.close();} catch(Exception err){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception err){}
		if(con!=null) try{con.close();} catch(Exception err){}
	}
%>

</table>
</body>
</html>