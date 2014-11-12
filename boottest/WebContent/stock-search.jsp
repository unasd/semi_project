<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
	<form method="post" action="/semi/semi.do">
	<input type="hidden" name="command" value="stock-search" />
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
	

<table width="550" border="1">

	<tr class="lv-bg">
		<td width="120">��ǰ�ڵ�</td>
		<td width="50">��ǰ��</td>
		<td width="50">��ü��</td>
		<td width="50">���</td>
		<td width="50">�԰�ܰ�</td>
		<td width="50">�ǸŴܰ�</td>
	</tr>
<c:forEach var="i" items="${v_stock_search}">
	<tr>
		<td width="100">${i.code }</td>
		<td width="100">${i.name }</td>
		<td width="100">${i.cname }</td>
		<td width="100">${i.count }</td>
		<td width="100">${i.price }</td>
		<td width="100">${i.sprice }</td>
	</tr>
</c:forEach>

</table>
</body>
</html>