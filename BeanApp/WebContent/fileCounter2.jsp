<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="count" class="mybean.fileCounter" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<title>filrCounter.jsp</title>
</head>
<body>

<%!
	String path;
	int count1;
	//mybean.fileCounter fc= new mybean.fileCounter();
	public void jspInit(){
		path = getServletContext().getRealPath("/");
	}
	
%>
	<jsp:setProperty property="path" name="count" value="<%=path %>"/>

<h2>총 방문자 수 : <jsp:getProperty property="jspInit" name="count"/></h2>
</body>
</html>