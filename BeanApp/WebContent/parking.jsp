<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="car" class="mybean.CarDto" />
<jsp:useBean id="parking" class="mybean.ParkingBean" scope="application"/>

<jsp:setProperty property="enter" name="parking"/>
<jsp:setProperty property="exit" name="parking"/>

<h1>���� ���� ���α׷�</h1>
<form action="parking.jsp" method="post">
	�����忡 ���� ����ȣ : <input type="text" name="enter" />
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="����" />
</form>

<form action="parking.jsp" method="post">
	�����忡�� ���� ����ȣ : <input type="text" name="exit" />
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="����" />
</form>
<hr/>
������ ���� ��� : <br/>
<table border="1">
	<tr>
		<th>���� ��ȣ</th><th>���� �ð�</th>
	</tr>
	
<%
	java.util.Vector cars = parking.getCarList();
	for(int i=0;i<cars.size();i++){
		pageContext.setAttribute("car", cars.get(i)); // car��� ������ ����
		// car��� ��ü�� page�� �����Ǿ��� ������ pageContext�� ���� ����
%>
	<tr>
		<td><jsp:getProperty property="plateNumber" name="car" /></td>
		<td><jsp:getProperty property="parkingTime" name="car" /></td>
	</tr>
<%		
	}
%>
</table>
<br/><br/>
�� ������� : <jsp:getProperty property="total" name="parking"/>��
</body>
</html>
<!-- 
class name : mybean.CarDto
name			r/w		data type
-----------------------------------
plateNumber		r		String
parkingTime		r		java.util.Date

class name : mybean.ParkingBean
name			r/w		data type
--------------------------------------
enter			w		String
exit			w		String
total			r		int
carDto			r		CarDto & CarDto[]  ���� ���� ���� & �迭�� ����(�ε���������Ƽ)
 -->