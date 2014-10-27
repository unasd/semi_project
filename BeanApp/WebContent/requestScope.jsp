<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="req" class="mybean.RequestBean" scope="request">
	<jsp:setProperty name="req" property="header" param="header1"/>
	<jsp:setProperty name="req" property="footer" param="footer"/>
</jsp:useBean>
<jsp:include page="inc/header.jsp" />
<form method="post" action="requestScope.jsp">
	머릿말에 들어갈 내용 : <br/>
	<textarea rows="2" cols="60" name="header1"></textarea>
	<br/><br/>
	꼬릿말에 들어갈 내용 : <br/>
	<textarea rows="2" cols="60" name="footer"></textarea>
	<br/><br/>
	<input type="submit" value="새로 고침" />
</form>
<jsp:include page="inc/footer.jsp" />
</body>
</html>

<!-- 
	name			r/w		date type
	====================================
 	header			r/w		String
 	footer			r/w		String
 -->