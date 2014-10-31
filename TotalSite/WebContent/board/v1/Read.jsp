<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="totalsite.board.BoardDto" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
%>
<jsp:useBean id="dao" class="totalsite.board.BoardDao"></jsp:useBean>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"></jsp:useBean>
<%	
	int num = Integer.parseInt(request.getParameter("num"));
	String keyField = request.getParameter("keyField"); // 받아서 다시 List페이지로 돌려줘야한다 
	String keyWord = request.getParameter("keyWord");	
	dto = dao.getBoard(num);
	pageContext.setAttribute("dto", dto);	// 액션태그로 출력할 때는 이렇게 set해준다
%>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8> <%=dto.getName() %></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=dto.getRegdate() %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><%=dto.getEmail() %></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="http://<%=dto.getHomepage() %>" target="_new">
	 http://<%=dto.getHomepage() %></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=dto.getSubject() %></td>
   </tr>
   <tr> 
    <td colspan=4><%=dto.getContent() %></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=dto.getIp() %>&nbsp;&nbsp;로 부터 글을 남기셨습니다./  조회수 : <%=dto.getCount() %>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:document.list.submit()">목 록</a> | 
	<!-- 함수를 따로 만들지 않고 링크태그에서 바로 제출 -->
	<a href="Update.jsp?num=<%=num%>">수 정</a> |
	<a href="Delete.jsp?num=<%=num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>
<form name="list" method="post" action="List.jsp">
	<input type="hidden" name="keyField" value="<%=keyField %>" />
	<input type="hidden" name="keyWord" value="<%=keyWord %>" />
</form>
</body>
</html>
