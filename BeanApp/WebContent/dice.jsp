<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>�ֻ��� ������ ����</h1>
<jsp:useBean id="dice" class="mybean.DiceBean" scope="page">
	<jsp:setProperty property="minNumber" name="dice" value="1"/>
	<jsp:setProperty property="maxNumber" name="dice" value="6"/>
</jsp:useBean>

<h2>�ֻ��� ������ 
<jsp:getProperty property="randomNumber" name="dice"/> �Դϴ�.</h2>
<form method="post" action="dice.jsp">
	<input type="submit" value="�ֻ��� �ٽ� ������" />
</form>
</body>
</html>

<!-- Property spec
	class name : myBean.DiceBean
	name			r/w		data type	explain
	-------------------------------------------------------
	randomNumber	r			int		������ �� ����
	maxNumber		r/w			int		���� ������ �ִ밪
	minNumber		r/w			int		���� ������ �ּҰ�
 -->