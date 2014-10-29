<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mybean.SawonDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Vector" %>

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
<jsp:useBean id="dao" class="mybean.SawonDao"></jsp:useBean>
<jsp:useBean id="dto" class="mybean.SawonDto"></jsp:useBean>

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
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	Vector list = dao.getList(search, searchText);
		
		for(int i=0; i<list.size();i++){
			dto =(SawonDto)list.get(i);	 // 인스턴스 생성
			pageContext.setAttribute("dto", dto);		
%>
		<td><jsp:getProperty property="no" name="dto"/></td>
		<td><jsp:getProperty property="id" name="dto"/></td>
		<td><jsp:getProperty property="name" name="dto"/></td>
		<td><jsp:getProperty property="pass" name="dto"/></td>
		<td><jsp:getProperty property="age" name="dto"/></td>
		<td><jsp:getProperty property="addr" name="dto"/></td>
		<td><jsp:getProperty property="ext" name="dto"/></td>
		<td><jsp:getProperty property="dept" name="dto"/></td>
		<td><a href="editSawon.jsp?no=<%=dto.getNo()%>">수정</a></td>
		<td><a href="javascript:fnDeleteChk('<%=dto.getNo()%>')">삭제</a></td>
		</tr>
<%		
	}	

%>

</table>
</body>
</html>