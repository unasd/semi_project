<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>전체 방문자 카운터</h1>
<jsp:useBean id="counter" class="mybean.ApplicationBean" scope="application">
	<jsp:setProperty name="counter" property="newVisit" value="1"/>
</jsp:useBean>

<jsp:setProperty property="restart" name="counter" />

<h2>당신은 이 페이지에
<jsp:getProperty property="visitCount" name="counter"/>
번째 방문하였습니다.</h2>

<form action="applicationScope.jsp" method="post">
	<input type="submit" name="check" value="새로 고침"/>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="restart" value="카운터를 0으로 리셋" />
</form>
</body>
</html>

<!-- 
	name 			r/w			data type
	---------------------------------------
	counter			w				int
	restart			w				?
	visitCount		r				int
 -->