<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="totalsite.board.*" %>

<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>

<%
	/*
	 비밀번호가 노출될 위험이 있으므로 검증을 Update 페이지에서
	하지않고 UpdateProc에서 수행한다  */
	int num = Integer.parseInt(request.getParameter("num"));
	String userPass = request.getParameter("pass");
	dto = dao.getBoard(num);
	
	if(userPass.equals(dto.getPass())){
		dto = new BoardDto();	// dto정보를 저장할 새로운 객체
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(num);
		
		dao.updateBoard(dto);
%>
		<%--
		<jsp:setProperty property="*" name="dto"/> 
		<jsp:setProperty property="name" name="dto"/>
		<jsp:setProperty property="email" name="dto"/>
		<jsp:setProperty property="subject" name="dto"/>
		<jsp:setProperty property="content" name="dto"/>
		<jsp:getProperty property="num" name="dto"/> --%>

		<script>
			alert("잘 입력 되었습니다.");
		</script>
<%			
		response.sendRedirect("List.jsp");
	}
	else{
%>
		<script>
			alert("패스워드가 틀렸습니다.");
			history.back();
		</script>
<%		
	}
%>
<%-- <jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/> --%>
<%
	/* dao.updateBoard(dto);
	response.sendRedirect("List.jsp"); */
%>