<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>
<body>
    <%int a = 1114; %>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
    <form id="form_test">
    	<p id="p1">11111</p>
    </form>
<script type="text/javascript">
    var a = <%=a %> ;
     google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	function drawChart() {

 	 var data = google.visualization.arrayToDataTable([
    ['Year', 'Sales', 'Expenses'],
    ['2004',  1234,      400],
    ['2005',  1170,      460],
    ['2006',  660,       1120],
    ['2007',  1030,      a]
    ['2008',  1030,      a]
  	]);

 	 var options = {
  	  title: 'Company Performance',
   	 hAxis: {title: 'Year', titleTextStyle: {color: 'red'}}
 	 };

  	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

 	 chart.draw(data, options);

	}
</script>
</body>
</html>