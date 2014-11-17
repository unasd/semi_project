package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Plist_searchCommand_1 implements Command {
	Vector v_plist_search = new Vector();
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DBConnectionMgr pool=null;
	String sql = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String c = req.getParameter("code");	
		String day = req.getParameter("day");	
		String des = req.getParameter("des");	
		String name = req.getParameter("name");
		System.out.println(c);
		
		// 사원번호 + 전체검색	
		try{  
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			if(c == "" && day ==""  && des=="" && name == ""){
				sql = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
				"where p.pnum = s.pnum order by pcode";                     
				pstmt = con.prepareStatement(sql);                       
			}
			if(c != "" ){
				sql = "select pcode,pname,pdes,phdate,posname from plist p , pposit s "+
				"where p.pnum = s.pnum and pcode = ?"; 
				pstmt = con.prepareStatement(sql);                        
				pstmt.setString(1,c);
			}
			rs = pstmt.executeQuery(); 
				
			while(rs.next()){
				StockDto dto = new StockDto();
				dto.setPcode(rs.getInt("pcode"));
				dto.setPname(rs.getString("pname"));
				dto.setPdes(rs.getInt("pdes"));
				dto.setPosname(rs.getString("posname"));
				dto.setPhdate(rs.getString("phdate"));
					
				v_plist_search.add(dto);
					
				System.out.println(dto.getPname());
			}
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}	
	req.setAttribute("v_plist_search", v_plist_search);
	return "plist-search.jsp";
	}
}
