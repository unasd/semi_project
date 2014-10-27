/*
 *  name			r/w		date type
	====================================
 	header			r/w		String
 	footer			r/w		String
 */

package mybean;

public class RequestBean {
	private String header, footer;
	
	public void setHeader(String header){
		this.header = header;
	}
	
	public String getHeader(){
		return header;
	}
	
	public void setFooter(String footer){
		this.footer = footer;
	}
	
	public String getFooter(){
		return footer;
	}
}
