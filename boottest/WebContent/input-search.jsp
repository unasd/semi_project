<%@page import="semi.StockDto"%>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >

<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>

  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
 
</head>

<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<br/>
	<form name="f" method="post" action="/semi/semi.do">
	<input type="hidden" name="command" value="input-search">
		<div style="border: 1px" >			
			<div>
				<div>�԰���ȸ</div><br/>
				<div>��ǰ�� : <input type="text" name="name"/></div>
				<div>��ǰ�ڵ� : <input type="text" name="code" /></div>
				<div>��¥ : <input type="text" id="datepicker" name="day" /></div>
           		<div>�μ��� : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="����" /> 					
					 					
				</div>
					
		</div>
	</form>
				
<br/>
<table width="550" border="1">
<br/>
	<%
 	Vector vInput = (Vector)request.getAttribute("ialls");
	
	StockDto dto; 
try{
	if(vInput.size() == 0 || vInput == null){
%>
	<tr><td>�˻� ����� �����ϴ�.</td></tr>
<%
	}
	else{
%>
<tr>
	<td>��ǰ�ڵ�</td>
	<td>��ǰ��</td>
	<td>�԰���</td>
	<td>�԰���</td>
	<td>�μ���ȣ</td>
</tr>
<%

		for(int i = 0 ; i<vInput.size();i++){
			dto = (StockDto)vInput.get(i);	
%>
			<tr>
				<td><%=dto.getCode()%></td>					
				<td><%=dto.getName()%></td>
				<td><%=dto.getCount()%></td>
				<td><%=dto.getIdate()%></td>				
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