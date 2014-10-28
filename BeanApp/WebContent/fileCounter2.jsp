<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="count" class="mybean.fileCounter" scope="session"/>
<jsp:setProperty property="jspInit" name="count" value="<%=path %>"/>
<jsp:setProperty property="jspDestroy" name="count" value="<%=path %>"/>
<!DOCTYPE html>
<html>
<head>
<title>fileCounter.jsp</title>
</head>
<body>

<%!
	String path;
	public void jspInit(){
		path = getServletContext().getRealPath("/");
	} 
	%>
	<%  
	if(session.isNew()){
	%> 
	<jsp:setProperty property="count" name="count" value="1"/>
	<jsp:setProperty property="saveFile" name="count" value="<%=path %>"/>
	<% 
	}
	%>
<h2>총 방문자 수 : <jsp:getProperty property="count" name="count"/></h2>
</body>
</html>