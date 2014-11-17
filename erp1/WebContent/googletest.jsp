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
				<div>코드 : <input type="text" name="code" /></div>						
			</div>
			<hr/>
			<div>
				<div>
					<input class="b1"  type="submit" value="전송"  />&nbsp;&nbsp;&nbsp;					
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
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;
 

///직급검색
try{
	String url = "jdbc:mysql://192.168.10.49:3306/testboard";
	String id = "root";                                                    // 사용자 계정
	String pw = "1234";                                                // 사용자 계정의 패스워드

	Class.forName("com.mysql.jdbc.Driver");                      // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
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

	catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
		//e.printStackTrace();
		//out.println("member 테이블 호출에 실패했습니다.");
	}
	finally	{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
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
         <th>상품명</th>
         <th>매입</th>
         <th>매출</th>
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