<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>checkdelete.jsp</title>
</head>
<body>
<jsp:useBean id="dao" class="totalsite.board.BoardDao" />
<%
	String[] s = request.getParameterValues("deletebox");
	for(int i=0;i<s.length;i++){
		dao.deleteBoard(Integer.parseInt(s[i]));
	}
	response.sendRedirect("List.jsp");
%>
</body>
</html>