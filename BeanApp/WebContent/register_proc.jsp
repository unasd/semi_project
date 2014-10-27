<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mem" class="mybean.MemberDto" />
<jsp:setProperty property="*" name="mem" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>입력 내용 확인</h1>
아이디 : <jsp:getProperty property="mem_id" name="mem"/><br/>
패스워드 :  <jsp:getProperty property="mem_pw" name="mem"/><br/>
이름 :  <jsp:getProperty property="mem_name" name="mem"/><br/>
이메일 :  <jsp:getProperty property="mem_email" name="mem"/><br/>
전화번호 :  <jsp:getProperty property="mem_tel" name="mem"/><br/>
주소 :  <jsp:getProperty property="mem_addr" name="mem"/><br/>
</body>
</html>