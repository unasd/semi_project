package totalsite.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import totalsite.dbcp.DBConnectionMgr;

public class BoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public BoardDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("BoardDao() : "+err);
		}
	}
	
	// 전체 글 가져오기
	public Vector getBoardList(String keyField, String keyWord){
		Vector v = new Vector();
		String sql = null;
		try{
			if(keyWord==null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "SELECT * FROM tblboard ORDER BY num desc";
			}
			else{
				sql = "SELECT * FROM tblboard WHERE " + keyField +
						" like '%" + keyWord + "%' ORDER BY num desc";
			}
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				//System.out.println(rs.getString("subject"));
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() : "+err);
		}
		return v;
	}
	
	// 글 저장하기
	public void insertBoard(BoardDto dto){
		String sql = null;
		try{
			con=pool.getConnection();
			sql ="INSERT INTO tblboard VALUES(seq_num.nextVal, ?, ?, "
					+ "?, ?, ?, ?, 0, ?, sysdate, 0, 0)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHomepage());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPass());
			pstmt.setString(7, dto.getIp());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 선택한 글 한개 가져오기
	public BoardDto getBoard(int num){
		BoardDto dto = new BoardDto();
		String sql = null;
		try{
			con = pool.getConnection();
			sql = "UPDATE tblboard set count=count+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "SELECT * FROM tblboard WHERE num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				//dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPass(rs.getString("pass"));
				//dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
			}
		}
		catch(Exception err){
			System.out.println("getBoard() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}
	
	// 글 수정
	public void updateBoard(BoardDto dto){
		String sql = null;
		try{
			con=pool.getConnection();
			sql="UPDATE tblboard SET name=?, email=?, subject=?, content=? WHERE num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getNum());
			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updateBoard() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 글 삭제
	public void deleteBoard(int num){
		String sql =null;
		try{
			con=pool.getConnection();
			sql="DELETE tblboard WHERE num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updateBoard() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
