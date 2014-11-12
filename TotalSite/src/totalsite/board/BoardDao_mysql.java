package totalsite.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import totalsite.dbcp.DBConnectionMgr;

public class BoardDao_mysql {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public BoardDao_mysql(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("BoardDao() : "+err);
		}
	}
	
	// ��ü �� ��������
	public Vector getBoardList(String keyField, String keyWord){
		Vector v = new Vector();
		String sql = null;
		try{
			if(keyWord==null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "SELECT * FROM tblboard ORDER BY pos";
			}
			else{
				sql = "SELECT * FROM tblboard WHERE " + keyField +
						" like '%" + keyWord + "%' ORDER BY pos";
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
				dto.setNum(rs.getInt("seq"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() : "+err);
		}
		return v;
	}
	
	// �� �����ϱ�
	public void insertBoard(BoardDto dto){
		String sql = null;
		try{
			con=pool.getConnection();
			sql ="UPDATE tblboard SET pos=pos+1";
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql ="INSERT INTO tblboard VALUES(?, "
					+ "?, ?, ?, ?, 0, ?, now(), 0, 0, ?, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHomepage());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPass());
			pstmt.setString(7, dto.getIp());
			pstmt.setString(8, dto.getFilename());
			pstmt.setString(9, dto.getOfilename());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// ������ �� �Ѱ� ��������
	public BoardDto getBoard(int num){
		BoardDto dto = new BoardDto();
		String sql = null;
		try{
			con = pool.getConnection();
			sql = "UPDATE tblboard set count=count+1 where seq=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "SELECT * FROM tblboard WHERE seq=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("seq"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setFilename(rs.getString("filename"));
				dto.setOfilename(rs.getString("ofilename"));
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
	
	// �� ����
	public void updateBoard(BoardDto dto){
		String sql = null;
		try{
			con=pool.getConnection();
			sql="UPDATE tblboard SET name=?, email=?, subject=?, content=? WHERE seq=?";
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
	
	// �� ����
	public void deleteBoard(int num){
		String sql =null;
		try{
			con=pool.getConnection();
			sql="DELETE tblboard WHERE seq=?";
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
	
	// ���� ���� pos�� ����  
	public void replyUpdatepos(BoardDto dto){ // �亯�� �޷��� �θ��� ��
		String sql=null;
		try{
			con=pool.getConnection();
			sql ="UPDATE tblboard SET pos=pos+1 WHERE pos>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPos());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyUpdatepos() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// �亯
	public void replyBoard(BoardDto dto){ // ���� �亯�� ��
		String sql=null;
		try{
			//int pos = dto.getPos();
			//int depth = dto.getDepth();
			con=pool.getConnection();
			sql = "insert into tblboard(name,email,homepage,"
		               + "subject,content,pass,count,ip,regdate,pos,depth) values("
		               + "?,?,?,?,?,?,0,?,now(),?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHomepage());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPass());
			pstmt.setString(7, dto.getIp());
			pstmt.setInt(8, dto.getPos()+1);
			pstmt.setInt(9, dto.getDepth()+1);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyBoard() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// �鿩 ����
	public String useDepth(int depth){
		String result ="";
		for(int i=0; i<depth*3; i++){
			result += "&nbsp;";
		}
		
		return result;
	}
}