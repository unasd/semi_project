package mybean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class SawonDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public SawonDao(){ // �����ڸ� ���� �ʱ�ȭ �ϸ鼭 �������
		try{
			pool = DBConnectionMgr.getInstance();
			// ������ �ִ��� ���߿� �ϴ� ���� ȿ�����̹Ƿ�
			// �ν��Ͻ��� ��ġ�� Ȯ���Ѵ� 
		}
		catch(Exception err){
			System.out.println("DB���� ���� : "+err);
		}
	}
	
	// index.jsp���� ����ϱ� ���� �޼���
	public Vector getList(String search, String searchText){
		// DB�κ��� ������ ������ ��´�
		Vector list = new Vector();
		String sql = null;
		try{
			if(searchText==null || searchText.isEmpty()){
				sql="select * from tblSawon";
			}
			else{
				sql="SELECT * FROM tblsawon WHERE "
						+search+" like '%"+searchText+"%'";
			}
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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
		String sql = "INSERT INTO tblsawon VALUES(seq_no.nextVal, ?, ?, ?, ?, ?, ?, ?)";
		
		try{
			con = pool.getConnection();
			
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
			System.out.println("addSawon() : " +err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	public SawonDto getSawon(int no){
		SawonDto dto=new SawonDto();
		try{
			con = pool.getConnection();
			
			String sql = "SELECT id, name, age, pass, addr, ext, dept FROM tblsawon WHERE no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setPass(rs.getString("pass"));
				dto.setAddr(rs.getString("addr"));
				dto.setExt(rs.getString("ext"));	
				dto.setDept(rs.getString("dept"));
			}		
		}
		catch(Exception err){
			System.out.println("getSawon() : " +err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}
	
	public void editSawon(SawonDto dto){	// ����
		
		try{
			con = pool.getConnection();
			
			String sql = "UPDATE tblsawon SET id=?, name=?, pass=?, age=?, addr=?, " 
					+"ext=?, dept=? WHERE no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getExt());
			pstmt.setString(7, dto.getDept());
			pstmt.setInt(8, dto.getNo());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("editSawon() : "+err);
		}
	}
	
	public void deleteSawon(int no){	// ���� ������� �޴´�
		try{
			con = pool.getConnection();
			String sql = "DELETE tblsawon WHERE no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeQuery();
		}
		catch(Exception err){
			System.out.println("deleteSawon() : "+err);
		}
	}
}
