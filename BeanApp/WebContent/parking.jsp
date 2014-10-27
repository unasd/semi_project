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

<h1>주차 관리 프로그램</h1>
<form action="parking.jsp" method="post">
	주차장에 들어온 차번호 : <input type="text" name="enter" />
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="입차" />
</form>

<form action="parking.jsp" method="post">
	주차장에서 나간 차번호 : <input type="text" name="exit" />
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="출차" />
</form>
<hr/>
주차된 차량 목록 : <br/>
<table border="1">
	<tr>
		<th>차량 번호</th><th>입차 시간</th>
	</tr>
	
<%
	java.util.Vector cars = parking.getCarList();
	for(int i=0;i<cars.size();i++){
		pageContext.setAttribute("car", cars.get(i)); // car라는 변수에 저장
		// car라는 객체가 page로 생성되었기 때문에 pageContext로 변수 저장
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
총 주차대수 : <jsp:getProperty property="total" name="parking"/>대
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
carDto			r		CarDto & CarDto[]  단일 값을 리턴 & 배열을 리턴(인덱스프로퍼티)
 -->