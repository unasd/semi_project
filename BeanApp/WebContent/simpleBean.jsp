<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>간단한 Bean 예제1</h1>
<!-- mybean.CalendarBean cal = new mybean.CalendarBean(); -->
<jsp:useBean id="cal" class="mybean.CalendarBean" /> 
<!-- 바깥에 따로 만들어진 자바클래스의 인스턴스를 생성 -->
오늘은
<jsp:getProperty name="cal" property="year"/>년
<jsp:getProperty name="cal" property="month"/>월
<jsp:getProperty name="cal" property="date"/>일 입니다.
</body>
</html>