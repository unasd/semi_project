<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String userPass = request.getParameter("pass");
	dto = dao.getBoard(num);	// 선택된 글의 dto정보를 불러온다
	
	if(userPass != null){  // 처음페이지 로딩시에 null값이 아닐 때만 비교수행
		if(userPass.equals(dto.getPass())){	// 불러온 dto정보에서 pass를 꺼내서 비교
			dao.deleteBoard(num);
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
	} // 첫번째 if문에 걸리지 않으면 그냥 페이지 출력
%>
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp" >
<input type="hidden" name="num" value="<%=num %>" />
<!-- 페이지가 다시 로딩될 때 값을 유지하지 못하므로
				num값을 같은 페이지로 다시 던져야 한다 -->
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>
