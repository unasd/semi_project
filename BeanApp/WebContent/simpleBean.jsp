<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>������ Bean ����1</h1>
<!-- mybean.CalendarBean cal = new mybean.CalendarBean(); -->
<jsp:useBean id="cal" class="mybean.CalendarBean" /> 
<!-- �ٱ��� ���� ������� �ڹ�Ŭ������ �ν��Ͻ��� ���� -->
������
<jsp:getProperty name="cal" property="year"/>��
<jsp:getProperty name="cal" property="month"/>��
<jsp:getProperty name="cal" property="date"/>�� �Դϴ�.
</body>
</html>