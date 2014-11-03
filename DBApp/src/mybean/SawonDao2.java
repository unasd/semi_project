package mybean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class SawonDao2 {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public SawonDao2(){ // 생성자를 통해 초기화 하면서 연결생성
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("연결 실패");
		}
	}
	
	// index.jsp에서 사용하기 위한 메서드
	public Vector getList(String search, String searchText){
		Vector list = new Vector();
		String sql = null;
		try{
			if(searchText==null){
				sql = "SELECT * FROm tblsawon";
			}
			else{
				sql = "SELECT * FROM tblsawon WHERE "
					+search+" like '%"+searchText+"%'";
			}
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				SawonDto dto = new SawonDto();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setExt(rs.getString("ext"));
				dto.setDept(rs.getString("dept"));
				//System.out.println(rs.getString("dept"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getList() : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	public void addSawon(SawonDto dto){
		try{
			con = pool.getConnection();
			String sql = "INSERT INTO tblsawon VALUES(seq_no.nextVal, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getExt());
			pstmt.setString(7, dto.getDept());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("addSawon : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	public SawonDto getSawon(int no){
		SawonDto dto = new SawonDto();
		return dto;
	}
	
	public void editSawon(SawonDto dto){	// 수정
		
		
	}
	
	public void deleteSawon(int no){	// 삭제 사번전달 받는다
		
	}
}
