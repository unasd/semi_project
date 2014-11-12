<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
</head>

<body>
<%@include file="inc/pasdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
	 <input type="hidden" name="command" value="plist-search" />
		<div style="border: 1px" >			
			<div>
				<div>사원조회</div><br/>
				<div>사원명 : <input type="text" name="name" /></div>
				<div>사원코드 : <input type="text" name="code" /></div>
				<div>입사날짜 : <input type="text" id="datepicker" name="day" /></div>
           		<div>부서코드 : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="전송" /> 					
					 					
				</div>
					
		</div>
	</form>
	
<br/>
<table width="550" border="1">
	<tr class="lv-bg">
		<td width="50">사원코드</td>
		<td width="50">사원명</td>
		<td width="50">부서번호</td>
		<td width="50">직급</td>
		<td width="50">입사일자</td>
	</tr>
<c:forEach var="i" items="${v_plist_search}">
	<tr class="lv-bg">
		<td width="50">${i.pcode }</td>
		<td width="50">${i.pname }</td>
		<td width="50">${i.pdes }</td>
		<td width="50">${i.posname }</td>
		<td width="50">${i.phdate }</td>
 	</tr>
 </c:forEach>
</table>
</body>
</html>