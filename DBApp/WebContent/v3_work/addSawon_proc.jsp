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
			alert("�� �ԷµǾ����ϴ�.");
			location.href="index.jsp";
		</script>
		<%
		%>
		<script>
			alert("�Է� ����.");
			location.href="addSawon.html";
		</script>
		<% 
%>

