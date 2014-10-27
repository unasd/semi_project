package mybean;

import java.util.Calendar;

public class CalendarBean {
	private Calendar cal;
	
	public CalendarBean(){
		cal = Calendar.getInstance();
	}
	
	public int getYear(){
		return cal.get(Calendar.YEAR);
	}
	public int getMonth(){
		return cal.get(Calendar.MONTH)+1;
	}
	public int getDate(){
		return cal.get(Calendar.DATE);
	}
}
