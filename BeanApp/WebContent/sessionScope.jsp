<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>������ �̿��� Ÿ�̸� ����</h1>
<jsp:useBean id="timer" class="mybean.SessionBean" scope="session">
	���� �����Դϴ�. Ÿ�̸� �۵��� �����մϴ�.
</jsp:useBean>
<br/><br/>
bean�� property�� ���������� ������ �ڿ� ����� �ð��� 
<jsp:getProperty property="elapsedTimeAfterLastAccess"
	name="timer"/> �� �Դϴ�.<br/><br/>
	
<jsp:setProperty property="restart" name="timer" param="restart"/>

Ÿ�̸� ������ �ڿ� ����� �ð��� 
<jsp:getProperty property="elapsedTime" name="timer"/>
�� �Դϴ�.<br/><br/>

Ÿ�̸Ӱ� ���۵� �ڿ� ����� �ð��� 
<jsp:getProperty property="elasedTimeAfterInst" name="timer"/>
�� �Դϴ�.<br/><br/>

<form action="sessionScope.jsp" method="post">
	<input type="submit" name="check" value="����ð� Ȯ��"/>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="restart" value="Ÿ�̸� ����" />
</form>
</body>
</html>

<!-- 
	name						r/w		data type
	-----------------------------------------------
	elapsedTime					r		long
	restart						w		boolean
	elapsedTimeAfterInst		r		long
	elapsedTimeAferLastAccess	r		long
 -->