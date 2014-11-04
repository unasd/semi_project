<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function fnAddFileInput(){
		var cnt = document.post.add.value;
		var div = document.getElementById("fileInputDiv");
		div.innerHTML="";
		
		for(var i=0; i<cnt; i++){
			var str="<input type='file' name='upfile"+i+"'/><br/><br/>";
			div.innerHTML += str;
		}
	}
	
	function fnElementChk(f){ 
		var cnt = f.elements.length; 
		var paramIndex = 1;
		
		for(var i=0; i<cnt; i++){
			if(f.elements[i].type=="file"){
				if(f.elements[i].value == ""){
					alert(paramIndex + "번째가 비어있음. \n제대로 입력해라.");
					f.elements[i].focus(); 
					return;	
				}
				paramIndex++;
			}
		}
		f.submit();
	}
</script>
</head>
<body>
<center>
<br><br>
<table width=80% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=84F399 height=25 align=center>글쓰기</td>
 </tr>
</table>
<br>
<table width=80% cellspacing=0 cellpadding=3 align=center>
<form name=post method=post action="PostProc.jsp" enctype="multipart/form-data">
<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>" />
 <tr>
  <td align=center>
   <table border=0 width=100% align=center>
    <tr>
     <td width=10%>성 명</td>
     <td width=90%><input type=text name=name size=10 maxlength=8></td>
    </tr>
    <tr>
	 <td width=10%>E-Mail</td>
	 <td width=90%><input type=text name=email size=30 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>홈페이지</td>
     <td width=90%><input type=text name=homepage size=40 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>제 목</td>
     <td width=90%><input type=text name=subject size=50 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>내 용</td>
     <td width=90%><textarea name=content rows=10 cols=50></textarea></td>
    </tr>
    <tr>
     <td width=10%>비밀 번호</td> 
     <td width=90% ><input type=password name=pass size=15 maxlength=15></td>
    </tr>
    
    <tr>
     <td width=10%>파일 첨부</td>
     <td width=90% ><input type="file" name="upfile"/></td>
    </tr>
    
    <tr>
     <td colspan=2><hr size=1></td>
    </tr>
    <tr>
     <td><input type="submit" value="등록" />&nbsp;&nbsp;
     <!-- <input type=button value="등록" onclick="fnElementChk(this.form)"/> -->
         <input type=reset value="다시쓰기"/>&nbsp;&nbsp;
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