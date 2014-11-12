<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" type="text/css" href="css/table.css">
</head>

<body>
<%@include file="inc/pasdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="final-sal-search" />
		<table style="border: 1px solid black">			
			<tr>
				<td>�����ȣ �˻� : </td>
				<td><input type="text" name="pcode" /></td>				
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
<jsp:useBean id="stockdao" class="semi.StockDao"/>
<jsp:useBean id="stockdto" class="semi.StockDto"/>
<jsp:setProperty property="pcode" name="stockdto"/>
<%
stockdao.final_sal_search(stockdto);
%>
<tr class="lv-bg">		
		<td width="50">�����</td>
		<td width="50">�μ���ȣ</td>
		<td width="50">����</td>
		<td width="50">����</td>
		<td width="50">����</td>
		<td width="50">�����޿�</td>
		
	</tr>
	
<%
String pname = stockdto.getPname();
int pdes = stockdto.getPdes(), unpaid = stockdto.getUnpaid() , late = stockdto.getLate() , psa = stockdto.getPsa() ;
String posname = stockdto.getPosname();

%>	
<tr class="lv-bg">	
	<td width="50"><%=pname%></td>
	<td width="50"><%=pdes%></td>
	<td width="50"><%=posname%></td>
	<td width="50"><%=unpaid%></td>
	<td width="50"><%=late%></td>
	<td width="50"><%=psa%></td>
</tr>
</table>
</body>
</html>