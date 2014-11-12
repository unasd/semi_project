package totalsite.board;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import totalsite.dbcp.DBConnectionMgr;

public class ReadCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) 
			throws UnsupportedEncodingException {
		
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		BoardDto dto = new BoardDto();
		int num = Integer.parseInt(req.getParameter("num"));
		String keyField = req.getParameter("keyField"); // 받아서 다시 List페이지로 돌려줘야한다 
		String keyWord = req.getParameter("keyWord");
		System.out.println(keyField);
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DBConnectionMgr pool;
		pool=DBConnectionMgr.getInstance();
		String sql =null;
		
		try{
			con=pool.getConnection();
			sql="SELECT * FROM tblboard WHERE num=?";
			con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setFilename(rs.getString("filename"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("name"));
				dto.setOfilename(rs.getString("ofilename"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
			}
		}
		catch(Exception err){
			System.out.println("ReadCommand.java : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("dto", dto);
		req.setAttribute("keyField", keyField);
		req.setAttribute("keyWord", keyWord);
		return "/board/v5_mvc/Read.jsp";
	}
}
