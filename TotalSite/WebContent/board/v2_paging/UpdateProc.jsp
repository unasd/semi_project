<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="totalsite.board.*" %>

<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>

<%
	/*
	 ��й�ȣ�� ����� ������ �����Ƿ� ������ Update ����������
	�����ʰ� UpdateProc���� �����Ѵ�  */
	int num = Integer.parseInt(request.getParameter("num"));
	String userPass = request.getParameter("pass");
	dto = dao.getBoard(num);
	
	if(userPass.equals(dto.getPass())){
		dto = new BoardDto();	// dto������ ������ ���ο� ��ü
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
			alert("�� �Է� �Ǿ����ϴ�.");
		</script>
<%			
		response.sendRedirect("List.jsp");
	}
	else{
%>
		<script>
			alert("�н����尡 Ʋ�Ƚ��ϴ�.");
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