<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>주사위 굴리기 예제</h1>
<jsp:useBean id="dice" class="mybean.DiceBean" scope="page">
	<jsp:setProperty property="minNumber" name="dice" value="1"/>
	<jsp:setProperty property="maxNumber" name="dice" value="6"/>
</jsp:useBean>

<h2>주사위 눈금은 
<jsp:getProperty property="randomNumber" name="dice"/> 입니다.</h2>
<form method="post" action="dice.jsp">
	<input type="submit" value="주사위 다시 굴리기" />
</form>
</body>
</html>

<!-- Property spec
	class name : myBean.DiceBean
	name			r/w		data type	explain
	-------------------------------------------------------
	randomNumber	r			int		임의의 값 생성
	maxNumber		r/w			int		생성 가능한 최대값
	minNumber		r/w			int		생성 가능한 최소값
 -->