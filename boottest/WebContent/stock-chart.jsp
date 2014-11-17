<%@page import="java.util.Vector"%>
<%@page import="semi.StockDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
<link rel="stylesheet" type="text/css" href="css/Copy of table.css">
<script>
$(function () {
    $('#container').highcharts({
        data: {
            table: document.getElementById('datatable')
        },
        chart: {
            type: 'column'
        },
        title: {
            text: 'Data extracted from a HTML table in the page'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Units'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});
</script>
</head>
<body>
<%
if(request.getAttribute("v_tinput_chart")!=null){
	Vector v_tinput_chart = (Vector)request.getAttribute("v_tinput_chart");
	Vector v_toutput_chart = (Vector)request.getAttribute("v_toutput_chart");
%>
<div id="container" style="width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable" style="width : 400px; border: 1px;">
   <thead>
      <tr>
         <th>상품명</th>
         <th>매입</th>
         <th>매출</th>
      </tr>
   </thead>
   <tbody>
      <%for(int i=0;i<v_tinput_chart.size();i++){
    	  StockDto i_dto = new StockDto();
    	  StockDto o_dto = new StockDto();
    	  i_dto = (StockDto)v_tinput_chart.get(i);
    	  o_dto = (StockDto)v_toutput_chart.get(i);
      %>
      	<tr>
        <td><%=i_dto.getName() %></td>
        <td><%=i_dto.getCount() %></td>
        <td><%=o_dto.getCount() %></td>
        </tr>
       <%
       }
       %>
   </tbody>
</table>
<%
}
%>
</body>
</html>