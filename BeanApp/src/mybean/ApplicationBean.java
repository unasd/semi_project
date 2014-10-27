/*
 * 	name 			r/w			data type
	---------------------------------------
	counter			w				int
	restart			w				?
	visitCount		r				int
 * 
 */

package mybean;

public class ApplicationBean {
	int cnt;
	
	public void setNewVisit(int cnt){
		//this.cnt = this.cnt + cnt;
	}
	
	public void setRestart(boolean restart){
		this.cnt = 0;
	}
	
	public int getVisitCount(){
		return cnt++;
	}
}
