<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mem" class="mybean.MemberDto" />
<jsp:setProperty property="*" name="mem" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>�Է� ���� Ȯ��</h1>
���̵� : <jsp:getProperty property="mem_id" name="mem"/><br/>
�н����� :  <jsp:getProperty property="mem_pw" name="mem"/><br/>
�̸� :  <jsp:getProperty property="mem_name" name="mem"/><br/>
�̸��� :  <jsp:getProperty property="mem_email" name="mem"/><br/>
��ȭ��ȣ :  <jsp:getProperty property="mem_tel" name="mem"/><br/>
�ּ� :  <jsp:getProperty property="mem_addr" name="mem"/><br/>
</body>
</html>