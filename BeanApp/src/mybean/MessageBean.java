package mybean;

public class MessageBean {
	private String msg;
	
	public void setMessage(String msg){
		this.msg = msg;
	}
	
	public String getMessage(){
		msg = msg+"ºó";
		return msg;
	}
}
