package mybean;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

public class fileCounter {
	int count;
	BufferedReader br;	
	PrintWriter pw;
	String path;
	
	public void setJspInit(String path){
		try{
			br = new BufferedReader(new FileReader(path+"\\counter.txt"));
		
			String line=br.readLine();
			count = Integer.parseInt(line);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(br!=null){ 
				try{br.close();}
				catch(Exception err){err.printStackTrace();}
			}
		}
		//System.out.println("jspinit : "+count);
		//System.out.println("jspinit : "+path+"\\counter.txt.");
	}
	
	public void setJspDestroy(String path){
		setSaveFile(path);
	}
	
	public void setSaveFile(String path){
		try{
			pw = new PrintWriter(path+"\\counter.txt");
			pw.println(count);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(pw!=null){ 
				try{pw.close();}
				catch(Exception err){err.printStackTrace();}
			}
		}
	}
	
	public void setCount(int count){
		this.count++;
		//System.out.println("setcount : "+this.count);
	}
	
	public int getCount(){
		//System.out.println("getcount : "+count);
		return count;
	}
}
