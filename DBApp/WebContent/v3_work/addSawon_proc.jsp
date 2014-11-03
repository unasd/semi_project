<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao2" class="mybean.SawonDao2"></jsp:useBean>
<jsp:useBean id="dto" class="mybean.SawonDto"></jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");	
	response.setCharacterEncoding("euc-kr");	
%>
<<jsp:setProperty property="*" name="dto"/>
<%
	dao2.addSawon(dto);
%>
		<script>
			alert("잘 입력되었습니다.");
			location.href="index.jsp";
		</script>
		<%
		%>
		<script>
			alert("입력 오류.");
			location.href="addSawon.html";
		</script>
		<% 
%>

