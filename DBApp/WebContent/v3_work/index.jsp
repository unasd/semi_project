<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="mybean.SawonDto" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script>
		function fnDeleteChk(no){
			var result = confirm("���� �����Ͻðڽ��ϱ�?");
			
			if(result == true){
				location.href="deleteSawon.jsp?no=" +no;	
			}
		}
	</script>
</head>
<body>
<jsp:useBean id="dao2" class="mybean.SawonDao2"></jsp:useBean>
<jsp:useBean id="dto" class="mybean.SawonDto"></jsp:useBean>
<h1>���� ���� ����Ʈ</h1>
<a href="addSawon.html">���� �߰�</a>
<br/><br/>
<form method="post" action="index.jsp">
	<select name="search">
		<option value="id">���̵�</option>
		<option value="name">�̸�</option>
		<option value="dept">�μ�</option>
		<option value="addr">�ٹ���</option>
	</select>
	<input type="text" name="searchText"/>
	<input type="submit" value="�˻�" />
</form>
<table border="1">
	<tr>
		<th>���</th><th>ID</th><th>�̸�</th><th>�н�����</th>
		<th>����</th><th>�ٹ���</th><th>������ȣ</th><th>�μ���</th>
		<th>����</th><th>����</th>
	</tr>
<%
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	
	Vector list = dao2.getList(search, searchText);
	for(int i=0;i<list.size();i++){
		dto = (SawonDto)list.get(i);
		pageContext.setAttribute("dto", dto);
			%>
			<tr>
			<td><jsp:getProperty property="no" name="dto"/></td>
			<td><jsp:getProperty property="id" name="dto"/></td>
			<td><jsp:getProperty property="name" name="dto"/></td>
			<td><jsp:getProperty property="pass" name="dto"/></td>
			<td><jsp:getProperty property="age" name="dto"/></td>
			<td><jsp:getProperty property="addr" name="dto"/></td>
			<td><jsp:getProperty property="ext" name="dto"/></td>
			<td><jsp:getProperty property="dept" name="dto"/></td>
			<td><a href="editSawon.jsp?no=<%=dto.getNo()%>">����</a></td>
			<td><a href="javascript:fnDeleteChk('<%=dto.getNo()%>')">����</a></td>
			</tr>
		<% 
		}	
%>

</table>
</body>
</html>