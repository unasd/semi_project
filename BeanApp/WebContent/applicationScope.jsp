<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>��ü �湮�� ī����</h1>
<jsp:useBean id="counter" class="mybean.ApplicationBean" scope="application">
	<jsp:setProperty name="counter" property="newVisit" value="1"/>
</jsp:useBean>

<jsp:setProperty property="restart" name="counter" />

<h2>����� �� ��������
<jsp:getProperty property="visitCount" name="counter"/>
��° �湮�Ͽ����ϴ�.</h2>

<form action="applicationScope.jsp" method="post">
	<input type="submit" name="check" value="���� ��ħ"/>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="restart" value="ī���͸� 0���� ����" />
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