<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" type="text/css" href="css/table.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>


   <form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="input" />
      <div style="border: 1px" >         
         <div>
            <div>�԰��Է�</div>
            <div>��ǰ�ڵ� : <input type="text" name="code" /></div>            
            <div>�԰��� : <input type="text" name="count" /></div>
            <div>�԰�¥ : <input type="text" id="datepicker" name="idate" /></div>
         </div>
   <hr/>         
            <div>               
               <input class="b1" type="submit" value="����" />               
            </div>               
      </div>
   </form>
   <table width="550" border="1">
   </table>
   
</body>
</html>