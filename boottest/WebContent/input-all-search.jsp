<%@page import="semi.StockDto"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<form method="post" action="/semi/semi.do">
<input type="hidden" name="command" value="input-all-search" />
���� : 
<input type="radio" name="code" value="code" />��ǰ�ڵ�&nbsp;
<input type="radio" name="code" value="count" />����&nbsp;
<input type="radio" name="code" value="idate" />�԰���&nbsp;
<input class="b1" type="submit" value="����" />&nbsp;
</form>


<table width="550" border="1">

	<tr class="lv-bg">
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">�԰���</td>
		<td width="100">�԰���</td>
	</tr>
<%
 	Vector vAddr = (Vector)request.getAttribute("ialls");
	
	StockDto dto; 
try{
	if(vAddr.size() == 0 || vAddr == null){
%>
	<tr><td>�˻� ����� �����ϴ�.</td></tr>
<%
	}
	else{
		out.println(((StockDto)vAddr.get(0)).getCount());
		for(int i = 0 ; i<vAddr.size();i++){
			dto = (StockDto)vAddr.get(i);	
%>
			<tr>
				<td><%=dto.getCode()%></td>					
				<td><%=dto.getName()%></td>
				<td><%=dto.getCount()%></td>
				<td><%=dto.getIdate()%></td>				
			</tr>
<%
				
		}//for
	}//else
}//try
catch(NullPointerException err){}
%>
</table>
</body>
</html>