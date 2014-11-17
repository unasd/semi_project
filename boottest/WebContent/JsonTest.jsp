<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 
 <title>JSP JSON TESTPage</title>

 <!-- Ajax ����� ���� jquery -->
 <script src="//code.jquery.com/jquery.js"></script>
 
 <!-- JavaScript -->
 <script type="text/javascript">
  function insert_action(){
   var mForm = document.insert; // form�� ���� �������� ����
   var obj = new Object(); // JSON�������� ��ȯ �� ������Ʈ
   obj.user_id = mForm.user_id.value; // form�� ���� ������Ʈ�� ����
   obj.user_password = mForm.user_password.value;
    
   var json_data = JSON.stringify(obj); // form�� ���� ���� ������Ʈ�� JSON�������� ��ȯ
    
   var request = $.ajax({
    url:"���� ������ URL",
    type:"POST",
    data:json_data, // {��user_id��:���Է°���, ��user_password��:���Է°���} �������� ���� ��
    dataType:"json"
   });
   request.done(function(data){ // ���� ��, ��� �� �޾ƿ��� �κ�
    if (data != null){
     if (data.error == 2) { // ���� �� JSON ������ {��error��:2} ���� �������� ����
                                                                         // data ������Ʈ�� error�� ���� 2�� ���� �̺�Ʈ ó��
      alert("�̹� ��ϵǾ� �ִ� ���̵� �Դϴ�.");
     } else if (data.submit == true) {
      alert("��� �Ϸ�! �α��� �Ͻñ� �ٶ��ϴ�.");
     }
    }
   });
   request.fail(function(jqXHR, textStatus){ // ���� �߻�
    alert("��� ���� �߻�!");
   });
  }
 </script>
</head>
<body>
 <form name="insert" method="post" action=" ">
  <input type="text" name="user_id" id="user_id" placeholder="���̵� �Է��� �ּ���." >
  <input type="password" name="user_password" id="user_password" placeholder="��й�ȣ�� �Է��� �ּ���." >
  <button type="button" onclick="insert_action()">���</button>
 </form>
</body>
</html>