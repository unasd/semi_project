<%@page import="semi.StockDto"%>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >

<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">

</head>

<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
	<input type="hidden" name="command" value="list-search" />
		<table style="border: 1px solid black">			
			<tr>
				<td>��ǰ�ڵ� : </td>
				<td><input type="text" name="code" /></td>
			</tr>
	
				<tr>
				<td colspan="2" align="center">
					<input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;					
				</td> 	
			</tr>			
		</table>
	</form>
	
<br/>
<table width="550" border="1">

	<tr class="lv-bg">
		<td width="200">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">��ü��</td>		
		<td width="100">�԰�ܰ�</td>
		<td width="100">�ǸŴܰ�</td>
		<td width="100">�μ���ȣ</td>
	</tr>
<%
 	Vector vAddr = (Vector)request.getAttribute("List");
	
	StockDto dto; 
try{
	if(vAddr.size() == 0 || vAddr == null){
%>
	<tr><td>�˻� ����� �����ϴ�.</td></tr>
<%
	}
	else{
		//out.println(((StockDto)vAddr.get(0)).getCount());
		for(int i = 0 ; i<vAddr.size();i++){
			dto = (StockDto)vAddr.get(i);	
%>
			<tr>
				<td><%=dto.getCode()%></td>					
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
				<td><%=dto.getPrice()%></td>				
				<td><%=dto.getSprice()%></td>				
				<td><%=dto.getDes()%></td>				
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