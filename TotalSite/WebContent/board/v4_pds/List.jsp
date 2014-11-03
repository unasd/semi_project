<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.Vector" %>
<%@ page import="totalsite.board.BoardDto" %>

<%! // keyWord�� �����ϰ� �����ϴ� �޼���
	public String getParam(HttpServletRequest req, String pname){
		if(req.getParameter(pname) != null){		// keyWord���� ���� �Ű�����
			return req.getParameter(pname);
		}
		else{
			return "";
		}
	}

	// ����¡�� �ʿ��� ������ 
	int totalRecord = 0; 	 // ��ü ���� ����
	int numPerPage = 10; 	 // �� �������� �ѷ��� ���� ����
	int pagePerBlock = 3;	 // �� ���� ������ �� 
	int totalPage = 0;		 // ��ü ������ ��
	int totalBlock = 0;		 // ��ü �� ��
	int nowPage = 0;		 // ���� ������ ������ ��ȣ
	int nowBlock = 0;		 // ���� ������ �� ��ȣ
	int beginPerPage = 0;	 // ������ �� ���� ��ȣ
%>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	function fnRead(param){
		document.read.num.value=param;
		document.read.submit();	// ȣ��Ǹ� read��� form��ü�� ����
	}
</script>
<BODY>
<%
request.setCharacterEncoding("euc-kr");	
%>
<jsp:useBean id="dao" class="totalsite.board.BoardDao" />
<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	if(keyField==null){
		keyField="name";
	}
	
	if(keyWord==null){
		keyWord="";
	}
	 
	Vector v = dao.getBoardList(keyField, keyWord);
	BoardDto dto = null;
	
	totalRecord = v.size();		// ��ü ���� ���� = ���� ������
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); 
	// �Ҽ��� �ڸ��� ������ �ø��Ͽ� ������ �۵� ������ �Ҵ�ǰ�
	
	if(request.getParameter("nowPage") != null){ 	
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} // ù �ε������� nowPage null ���̹Ƿ� null�� �ƴҶ��� �ɸ��� �Ѵ�
	
	if(request.getParameter("nowBlock") != null){
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	}
	
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
	// ������ �������� �� �Ҵ�ǰ�
	
	beginPerPage = nowPage*numPerPage;
	
%>
<center><br>
<h2>JSP Board</h2>
<%-- <jsp:useBean id="dto" class="totalsite.board.BoardDto" /> --%>
<table align=center border=0 width=80%>
<tr>
	<td align=left>Total : <%=totalRecord %> Articles(
		<font color=red> <%=nowPage+1 %> / <%=totalPage %> Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td width="10%"> ��ȣ </td>
				<td width="40%"> ���� </td>
				<td width="20%"> �̸� </td>
				<td width="20%"> ��¥ </td>
				<td width="10%"> ��ȸ�� </td>
			</tr>
		<% if(v.isEmpty()){ %>
			<div align="center"><b>��ϵ� ���� �����ϴ�.</b></div>
		<%
		}else{
			for(int i=beginPerPage;i<beginPerPage + numPerPage;i++){
				if(i == totalRecord)
					break;
				dto = (BoardDto)v.get(i);
				//pageContext.setAttribute("dto", dto);
		%>
			<tr>
				<td><%=dto.getNum() %></td>
				<td>
				<%=dao.useDepth(dto.getDepth())%>
				<%if(dto.getDepth()>0) {%>
					<img src="/TotalSite/images/re.gif"/>
				<%} %>
				<a href="javascript:fnRead('<%=dto.getNum()%>')"/><%=dto.getSubject() %></a></td>
				<!-- ������ ������ fnRead() �Լ��� ȣ��� -->
				<td><%=dto.getName() %></td>
				<td><%=dto.getRegdate() %></td>
				<td><%=dto.getCount() %></td>
			</tr>
		<% 
			}
		}
		%>
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td align="left">Go to Page 
	<%
		if(nowBlock > 0){
	%>
		&nbsp;&nbsp;:::<a href="List.jsp?nowPage=<%=(nowBlock-1) * pagePerBlock%>&nowBlock=<%=nowBlock-1%>">����</a>
	<%
		}
	%>
	<%   
		for(int i=0; i<pagePerBlock; i++){
			if((nowBlock*pagePerBlock)+i == totalPage)
				break;
	%>		
			<a href="List.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i%>&nowBlock=<%=nowBlock%>">
			<%=i+1+(nowBlock*pagePerBlock) %></a>&nbsp;&nbsp;&nbsp;
	<%		
		}
	%>
	
	<%
		if(totalBlock > nowBlock + 1){	
	%>
		&nbsp;&nbsp;:::<a href="List.jsp?nowPage=<%=(nowBlock+1) * pagePerBlock%>&nowBlock=<%=nowBlock+1%>">����</a>
	<%
		}
	%>
	</td>
	<td align=right>
		<a href="Post.jsp">[�۾���]</a>
		<a href="List.jsp">[ó������]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="name" <%if(keyField.equals("name")){%> selected="true" <%}%>> �̸�
				<option value="subject" <%if(keyField.equals("subject")){%> selected="true" <%}%>> ����
				<option value="content" <%if(keyField.equals("content")){%> selected="true" <%}%>> ����
			</select>

			<input type="text" size="16" name="keyWord" value='<%=getParam(request, "keyWord") %>'>
			<input type="button" value="ã��" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
</center>	
<form name="read" method="post" action="Read.jsp">	<!-- ������ ������ fnRead�� ���� submit �ȴ� -->
	<input type="hidden" name="num" />
	<input type="hidden" name="keyField" value="<%=keyField %>" />
	<input type="hidden" name="keyWord" value="<%=keyWord %>" />
</form>
</BODY>
</HTML>