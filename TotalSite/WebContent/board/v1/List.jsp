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
		document.read.submit();	// ȣ��Ǹ� read��� form��ü�� submit
	}
	
	function fnAll(){
		if(document.f1.all.checked){
			for(var i=0;f1.deletebox.length;i++){
				f1.deletebox[i].checked=true;
			}
		}
		else{
			for(var i=0;f1.deletebox.length;i++){
				f1.deletebox[i].checked=false;
			}
		}
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
	//BoardDto dto = null;
%>
<center><br>
<h2>JSP Board</h2>
<jsp:useBean id="dto" class="totalsite.board.BoardDto" />
<table align=center border=0 width=80%>
<tr>
	<td align=left>Total : <%=v.size() %> Articles(
		<font color=red>  1 / 10 Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
<form name="f1" method="post" action="checkdelete.jsp">
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td width="10%"> ��ȣ </td>
				<td><input type="submit" value="����" /><input type="checkbox" name="all" onclick="fnAll()"/></td>
				<td width="40%"> ���� </td>
				<td width="20%"> �̸� </td>
				<td width="20%"> ��¥ </td>
				<td width="10%"> ��ȸ�� </td>
			</tr>
		<% if(v.isEmpty()){ %>
			<div align="center"><b>��ϵ� ���� �����ϴ�.</b></div>
		<%
		}else{
			for(int i=0;i<v.size();i++){
				dto = (BoardDto)v.get(i);
				//pageContext.setAttribute("dto", dto);
		%>
			<tr align="center">
				<td><%=dto.getNum() %></td>
				<td><input type="checkbox" name="deletebox" value="<%=dto.getNum()%>" /></td>
				<td><a href="javascript:fnRead('<%=dto.getNum()%>')"/><%=dto.getSubject() %></a></td>
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
</form>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td align="left">Go to Page </td>
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