package semi;

public class StockDto {
	private int code;		// ��ǰ�ڵ�
	private String name;	// tinput���̺� ��ǰ��	
	private int count;		// �԰���
	private String idate;	// �԰���
	private String odate;	// �����
	private int des;		// �μ���ȣ
	
	//������̺� ����
	private String pname;		// �����	
	private String posname;		// ����
	private String phdate;	// �Ի�����
	private int psa;		// �޿�
	private int pnum;		// ���޹�ȣ
	private int pdes;		// �μ���ȣ
	private int pcode;		// �����ȣ
	private int unpaid;		// ����
	private int paid;		// ����
	private int late;		// ����
	
	private String sort;	//���ĺκ�
	
	
	
	
	

	//
	//private int iname;		// tlist�� tstock���̺� ��ǰ��
	private String cname;	// ����ó��
	private int price;		// �԰�
	private int sprice; 	// ���
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public int getDes() {
		return des;
	}
	public void setDes(int des) {
		this.des = des;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}	
	
	public String getPname() {		
		return pname;
		
	}
	public void setPname(String pname) {
		if(pname == null){
		this.pname = "qwer";}
		else if(pname != null){
		this.pname = pname;}
	}
	public String getPosname() {
		return posname;
	}
	public void setPosname(String posname) {
		this.posname = posname;
	}
	public String getPhdate() {
		return phdate;
	}
	public void setPhdate(String phdate) {
		this.phdate = phdate;
	}
	public int getPsa() {
		return psa;
	}
	public void setPsa(int psa) {
		this.psa = psa;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPdes() {
		return pdes;
	}
	public void setPdes(int pdes) {
		this.pdes = pdes;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public int getUnpaid() {
		return unpaid;
	}
	public void setUnpaid(int unpaid) {
		this.unpaid = unpaid;
	}
	public int getPaid() {
		return paid;
	}
	public void setPaid(int paid) {
		this.paid = paid;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
}
