<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
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

<div>
		<form method="post" action="googletest.jsp">
			
			<div>
				<div></div><br/>
				<div>�ڵ� : <input type="text" name="code" /></div>						
			</div>
			<hr/>
			<div>
				<div>
					<input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;					
				</div> 	
			</div>			
	</form>
</div>
<%!
	int tinput_count[]= new int[10];
	int toutput_count[]=new int[10];
	String tinput_name[]=new String[10];
	//String toutput_name;
	String code;
%>
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;
 

///���ް˻�
try{
	String url = "jdbc:mysql://192.168.10.49:3306/testboard";
	String id = "root";                                                    // ����� ����
	String pw = "1234";                                                // ����� ������ �н�����

	Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
	conn=DriverManager.getConnection(url,id,pw); 
	response.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");
	
	code = request.getParameter("code");
	
		/* String sql1 = "SELECT tinput.name, sum(tinput.count), sum(toutput.count) "
				+"FROM tinput INNER JOIN toutput ON tinput.code = toutput.code WHERE tinput.code=?";  */
		/* String sql1 = "SELECT tinput.name, sum(tinput.count), sum(toutput.count) "
				+"FROM tinput INNER JOIN toutput ON tinput.code = toutput.code group by tinput.code";  */
		//pstmt = conn.prepareStatement(sql1);                    
		//pstmt.setString(1,code);
		//rs = pstmt.executeQuery();
		
		String sql = "SELECT name, sum(count) FROM tinput GROUP BY code";
		pstmt = conn.prepareStatement(sql);
		//pstmt.setString(1, code);
		rs = pstmt.executeQuery();
		
		int i =0;
		%>
		<%=code %>
		<%
		while(rs.next()){	
			//rs.next();
			tinput_name[i] = rs.getString("name");
			tinput_count[i] = rs.getInt("sum(count)");
			i++;
		}
		%>
		<%=code %>
		<%
		sql = "SELECT sum(count) FROM toutput GROUP BY code";
		pstmt = conn.prepareStatement(sql);
		//pstmt.setString(1, code);
		rs = pstmt.executeQuery();
		%>
		<%=code %>
		<%
		i=0;
		while(rs.next()){	
			//rs.next();
			//toutput_name = rs.getString("name");
			toutput_count[i] = rs.getInt("sum(count)");
			i++;
		}
		%>
		<%=code %>
		<%
	
	}

	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		//e.printStackTrace();
		//out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
	}
	finally	{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
	}
%>
<%=tinput_name[0] %>
<%=tinput_count[0]%>
<%=toutput_count[0]%><br/><br/>
<%=tinput_name[1] %>
<%=tinput_count[1]%>
<%=toutput_count[1]%><br/><br/>
<%=tinput_name[2] %>
<%=tinput_count[2]%>
<%=toutput_count[2]%><br/><br/>
<%=tinput_name[3] %>
<%=tinput_count[3]%>
<%=toutput_count[3]%>
<div id="container" style="width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
   <thead>
      <tr>
         <th>��ǰ��</th>
         <th>����</th>
         <th>����</th>
      </tr>
   </thead>
   <tbody>
	<%for(int i=0;i<tinput_name.length;i++){
	%>
      <tr>
         <th><%=tinput_name[i]%></th>
         <td><%=tinput_count[i]%></td>
         <td><%=toutput_count[i]%></td>
      </tr>
   <%
	}
   %>
   </tbody>
</table>

</body>
</html>