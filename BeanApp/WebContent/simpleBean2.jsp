<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>������ Bean ����2</h1>
<jsp:useBean id="msg" class="mybean.MessageBean"/>
<!-- msg.setMessage("������..."); -->
<jsp:setProperty property="message" name="msg"
	value="������ �� �����Դϴ�."/>
Message : <jsp:getProperty property="message" name="msg" />
<hr/>
<%
	mybean.MessageBean msg2 = new mybean.MessageBean();
	msg2.setMessage("�̰��� ��ũ��Ʈ�� �ۼ��� ����");
	
	msg.setMessage("�̰��� �׼��±׷� ���� �ν��Ͻ���");
%>

Message2 : <%=msg2.getMessage() %><br/>
Message3 : <%=msg.getMessage() %>
</body>
</html>