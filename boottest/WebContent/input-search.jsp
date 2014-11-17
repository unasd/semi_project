<%@page import="semi.StockDto"%>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >

<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

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
				<div>입고조회</div><br/>
				<div>상품명 : <input type="text" name="name"/></div>
				<div>상품코드 : <input type="text" name="code" /></div>
				<div>날짜 : <input type="text" id="datepicker" name="day" /></div>
           		<div>부서명 : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="전송" /> 					
					 					
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
	<tr><td>검색 결과가 없습니다.</td></tr>
<%
	}
	else{
%>
<tr>
	<td>상품코드</td>
	<td>상품명</td>
	<td>입고갯수</td>
	<td>입고일</td>
	<td>부서번호</td>
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