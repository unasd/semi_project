<%@page contentType="text/html;charset=euc-kr" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

  <script src="//code.jquery.com/jquery-1.10.2.js"></script>

  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

  <link rel="stylesheet" href="/resources/demos/style.css">

  <script>

  $(function() {

    $( "#tabs" ).tabs();

  });

  </script>


</head>

<body>
<div id="tabs">
<ul>

    <li><a href="#tabs-1">�԰�</a></li>

    <li><a href="#tabs-2">���</a></li>

    <li><a href="#tabs-3">���</a></li>

  </ul>

 <div id="tabs-1">
	<form style="float: left" method="post" action="input-search.jsp">
	<input type="image" src="images/b.png" name="Submit" value="�԰���ȸ">
	</form>
	
	<form style="float: left" method="post" action="input-all-search.jsp">
	<input type="image" src="images/d.png" name="Submit" value="�԰� ��ü��ȸ">
	</form>
	
	<form style="float: left" method="post" action="input.jsp">
	<input type="submit" value="�԰��Է�" />
	</form>
</div>

 <div id="tabs-2">
	<form style="float: left" method="post" action="output-search.jsp">
	<input type="submit" value="�����ȸ" />
	</form>
	
	<form style="float: left" method="post" action="output-all-search.jsp">
	<input type="submit" value="��� ��ü��ȸ">
	</form>
	
	<form style="float: left" method="post" action="output.jsp">
	<input type="submit" value="����Է�" />
	</form>
</div>

 <div id="tabs-3">
	<form method="post" action="stock-search.jsp">
	<input type="image" src="images/c.png" name="Submit" value="�����ȸ">
	</form>
</div>

<!-- 
	<div style="float: left">
	<form method="post" action="input-search.jsp">
	<input type="image" src="images/b.png" name="Submit" value="�԰���ȸ">
	</form>
	</div>
	
	<div style="float: left">
	<form method="post" action="output-search.jsp">
	<input type="submit" value="�����ȸ" />
	</form>
	</div>
	
	<div style="float: left">
	<form method="post" action="stock-search.jsp">
	<input type="image" src="images/c.png" name="Submit" value="�����ȸ">
	</form>
	</div>
	
	<div style="float: left">
	<form method="post" action="input-all-search.jsp">
	<input type="image" src="images/d.png" name="Submit" value="�԰� ��ü��ȸ">
	</form>
	</div>
	
	<div style="float: left">
	<form method="post" action="output-all-search.jsp">
	<input type="submit" value="��� ��ü��ȸ">
	</form>
	</div>
	
	<div style="float: left">
	<form method="post" action="input.jsp">
	<input type="submit" value="�԰��Է�" />
	</form>
	</div>
	
	<div>
	<form method="post" action="output.jsp">
	<input type="submit" value="����Է�" />
	</form>
	</div>
 -->
</div>
<br/>
<hr/>
</body>
</html>