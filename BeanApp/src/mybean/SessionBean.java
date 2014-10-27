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
	private long startTime;  // 타이머를 리셋한 시간
	private long instTime;	 // 전체 시간
	private long lastAccessTime; // 프로퍼티에 접근한 이후 경과시간
	
	// 페이지가 처음 로딩 됐을 때 초기화하는 생성자
	public SessionBean(){	
		startTime = System.currentTimeMillis();
		instTime = startTime;				// 객체가 시작됐을 때의 시간
		lastAccessTime = startTime;
	}
	
	// 타이머가 리셋된 후 경과된 시간을 알려줌
	public long getElapsedTime(){	
		lastAccessTime = System.currentTimeMillis();
		// 해당 프로퍼티(메서드)에 접근한 시간 측정 위해 공통적으로 들어간다
		return (lastAccessTime - startTime)/1000;
	}
	
	// 전체시간 
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
	
	// 시작 시간을 다시 현재시간으로 세팅
	public void setRestart(boolean restart){
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}
}
