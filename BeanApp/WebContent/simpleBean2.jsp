<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>간단한 Bean 예제2</h1>
<jsp:useBean id="msg" class="mybean.MessageBean"/>
<!-- msg.setMessage("간단한..."); -->
<jsp:setProperty property="message" name="msg"
	value="간단한 빈 예제입니다."/>
Message : <jsp:getProperty property="message" name="msg" />
<hr/>
<%
	mybean.MessageBean msg2 = new mybean.MessageBean();
	msg2.setMessage("이것은 스크립트로 작성된 예제");
	
	msg.setMessage("이것은 액션태그로 만든 인스턴스임");
%>

Message2 : <%=msg2.getMessage() %><br/>
Message3 : <%=msg.getMessage() %>
</body>
</html>