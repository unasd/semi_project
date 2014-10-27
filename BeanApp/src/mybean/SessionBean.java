/*
 * 	name						r/w		data type
	-----------------------------------------------
	elapsedTime					r		long
	restart						w		boolean
	elapsedTimeAfterInst		r		long
	elapsedTimeAferLastAccess	r		long
 * 
 */

package mybean;

public class SessionBean {
	private long startTime;  // Ÿ�̸Ӹ� ������ �ð�
	private long instTime;	 // ��ü �ð�
	private long lastAccessTime; // ������Ƽ�� ������ ���� ����ð�
	
	// �������� ó�� �ε� ���� �� �ʱ�ȭ�ϴ� ������
	public SessionBean(){	
		startTime = System.currentTimeMillis();
		instTime = startTime;				// ��ü�� ���۵��� ���� �ð�
		lastAccessTime = startTime;
	}
	
	// Ÿ�̸Ӱ� ���µ� �� ����� �ð��� �˷���
	public long getElapsedTime(){	
		lastAccessTime = System.currentTimeMillis();
		// �ش� ������Ƽ(�޼���)�� ������ �ð� ���� ���� ���������� ����
		return (lastAccessTime - startTime)/1000;
	}
	
	// ��ü�ð� 
	public long getElasedTimeAfterInst(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - instTime)/1000;
	}
	
	
	public long getElapsedTimeAfterLastAccess(){
		//long current = System.currentTimeMillis();
		long elapsed = (System.currentTimeMillis() - lastAccessTime)/1000;
		lastAccessTime = System.currentTimeMillis();
		return elapsed;
	}
	
	// ���� �ð��� �ٽ� ����ð����� ����
	public void setRestart(boolean restart){
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}
}
