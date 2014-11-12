package semi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StockDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public StockDao() {
		pool = DBConnectionMgr.getInstance();
	}

	// �԰��Է� �޼���
	public void addInput(StockDto stockdto) {
		String sql = null;
		try {
			con = pool.getConnection();

			sql = "SELECT iname, cname, price, sprice, des FROM tlist WHERE code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCode());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				stockdto.setName(rs.getString("iname"));
				stockdto.setCname(rs.getString("cname"));
				stockdto.setPrice(rs.getInt("price"));
				stockdto.setSprice(rs.getInt("sprice"));
				stockdto.setDes(rs.getInt("des"));
			}

			sql = "UPDATE tstock SET count = count+ ? WHERE code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCount());
			pstmt.setInt(2, stockdto.getCode());
			int result = pstmt.executeUpdate();
			// System.out.println("���� ����Ʈ : "+result);

			if (result == 0) {
				sql = "INSERT into tstock VALUES(?, ?, ?, ?, ?, ?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setString(3, stockdto.getCname());
				pstmt.setInt(4, stockdto.getCount());
				pstmt.setInt(5, stockdto.getPrice());
				pstmt.setInt(6, stockdto.getSprice());
				pstmt.setInt(7, stockdto.getDes());
				pstmt.executeUpdate();

				sql = "INSERT INTO tinput VALUES(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setInt(3, stockdto.getCount());
				pstmt.setString(4, stockdto.getIdate());
				pstmt.setInt(5, stockdto.getDes());
				pstmt.executeUpdate();
			}

			sql = "INSERT INTO tinput VALUES(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCode());
			pstmt.setString(2, stockdto.getName());
			pstmt.setInt(3, stockdto.getCount());
			pstmt.setString(4, stockdto.getIdate());
			pstmt.setInt(5, stockdto.getDes());
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// ����Է� �޼���
	public void addOutput(StockDto stockdto) {
		String sql = null;
		try {
			con = pool.getConnection();

			sql = "select iname, cname, price, sprice , des from tlist where code = ?"; // sql
																						// ����
			pstmt = con.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸�
												// �������Ѵ�.
			pstmt.setInt(1, stockdto.getCode());
			rs = pstmt.executeQuery();
			rs.next();
			stockdto.setName(rs.getString("iname"));
			stockdto.setCname(rs.getString("cname"));
			stockdto.setPrice(rs.getInt("price"));
			stockdto.setSprice(rs.getInt("sprice"));
			stockdto.setDes(rs.getInt("des"));
			
			sql = "select count from tstock where code = ?"; // sql
			pstmt.setInt(1, stockdto.getCode());
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("count");
			
			int ocount = stockdto.getCount();
			
			if(count>ocount){
			
			String sql3 = "update tstock set count = count- ? where code=?";
			pstmt = con.prepareStatement(sql3);

			pstmt.setInt(1, stockdto.getCount());
			pstmt.setInt(2, stockdto.getCode());
			int result = pstmt.executeUpdate();

			if (result == 0) {
				sql = "INSERT into tstock VALUES(?, ?, ?, ?, ?, ?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setString(3, stockdto.getCname());
				pstmt.setInt(4, stockdto.getCount());
				pstmt.setInt(5, stockdto.getPrice());
				pstmt.setInt(6, stockdto.getSprice());
				pstmt.setInt(7, stockdto.getDes());
				pstmt.executeUpdate();

				sql = "INSERT INTO toutput VALUES(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setInt(3, stockdto.getCount());
				pstmt.setString(4, stockdto.getOdate());
				pstmt.setInt(5, stockdto.getDes());
				pstmt.executeUpdate();
			}
			else{
			sql = "INSERT INTO toutput VALUES(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCode());
			pstmt.setString(2, stockdto.getName());
			pstmt.setInt(3, stockdto.getCount());
			pstmt.setString(4, stockdto.getOdate());
			pstmt.setInt(5, stockdto.getDes());
			pstmt.executeUpdate();
			}
		}
			else{
				System.out.println("��� ���ų� ����Ʈ�� ���� ��ǰ�Դϴ�.");
			}
		} catch (Exception err) {
			System.out.println("��� ���ų� ����Ʈ�� ���� ��ǰ�Դϴ�.");
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// �����޿�
	public void final_sal_search(StockDto stockdto) {
		String sql = null;
		
		try {
			con = pool.getConnection();

			sql = "select psa,pname,p.pdes,p.pnum from plist p , psal s where p.pdes = s.pdes and p.pnum = s.pnum and pcode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getPcode());
			rs = pstmt.executeQuery();
			if(rs.next());
			int psa = rs.getInt("psa");
			stockdto.setPname(rs.getString("pname"));
			stockdto.setPdes(rs.getInt("p.pdes"));
			stockdto.setPnum(rs.getInt("p.pnum"));
			
			sql = "select posname from pposit where pnum = ?"; // sql ����
			pstmt = con.prepareStatement(sql); 												
			pstmt.setInt(1, stockdto.getPnum());
			rs = pstmt.executeQuery();
			if(rs.next());			
			stockdto.setPosname(rs.getString("posname"));
			
			sql = "select unpaid , late from patt where pcode = ?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, stockdto.getPcode());
			rs = pstmt.executeQuery();  
			if(rs.next());			
			int unpaid = rs.getInt("unpaid");
			int late = rs.getInt("late");
			
			if(unpaid != 0){
				psa = psa - (unpaid * 50000);
			}
			
			if(late != 0){
				psa = psa - (late * 5000);
			}
			
			stockdto.setPsa(psa);
			stockdto.setUnpaid(unpaid);
			stockdto.setLate(late);
			
			
			
		} catch (Exception err) {
			System.out.println("�Էµ� ���� ���ų� ����Ʈ�� ���� �����ȣ �Դϴ�.");
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
