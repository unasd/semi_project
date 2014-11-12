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
<input type="hidden" name="command" value="output-all-search" />
���� : 
<input type="radio" name="code" value="code" />��ǰ�ڵ�&nbsp;
<input type="radio" name="code" value="count" />����&nbsp;
<input type="radio" name="code" value="odate" />�����&nbsp;
<input class="b1" type="submit" value="����" />&nbsp;
</form>


<table width="550" border="1">

	<tr class="lv-bg">
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">�����</td>
		<td width="100">�����</td>
	</tr>
<c:forEach var="i" items="${v_output_all_search}">
	<tr>
		<td width="100">${i.code }</td>
		<td width="100">${i.name }</td>
		<td width="100">${i.count }</td>
		<td width="100">${i.odate }</td>
	</tr>
 </c:forEach>
</table>
</body>
</html>