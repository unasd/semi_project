package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Stock_chartCommand implements Command {
	Vector v_tinput_chart = new Vector();
	Vector v_toutput_chart = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String code = req.getParameter("code");
		System.out.println(code);
		
		pool = DBConnectionMgr.getInstance();
		try{
			con = pool.getConnection();
			/*
			if(code != ""){
				sql= "SELECT * FROM tstock WHERE code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, code);
			}
			*/
			//if(code == ""){
				sql= "SELECT name, sum(count) FROM tinput GROUP BY code";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					StockDto dto =new StockDto();
					dto.setName(rs.getString("name"));
					dto.setCount(rs.getInt("sum(count)"));
					//System.out.println(rs.getString("name"));
					//System.out.println(rs.getString("sum(count)"));
					
					v_tinput_chart.add(dto);
				}
				
				sql = "SELECT sum(count) FROM toutput GROUP BY code";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					StockDto dto =new StockDto();
					dto.setCount(rs.getInt("sum(count)"));
					
					v_toutput_chart.add(dto);
				}
				int asize = v_tinput_chart.size(); 
				int bsize = v_toutput_chart.size(); 
				int an = asize-bsize;
				System.out.println(an);
				if(an != 0){
				for(int i=0;i<an;i++){
					StockDto dto = new StockDto();
					dto.setCount(0);
					v_toutput_chart.add(dto);
					}
				}
				
				for(int i=0;i<5;i++){
					StockDto dto = new StockDto();
					System.out.println(dto.getCount());
					//System.out.println("È®ÀÎ");
				}
				
			//}
			
		}
		catch(Exception err){
			System.out.println("Stock_chartCommand : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("v_tinput_chart", v_tinput_chart);
		req.setAttribute("v_toutput_chart", v_toutput_chart);
		return "stock-chart.jsp";
	}

}
