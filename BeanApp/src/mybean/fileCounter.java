package mybean;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

public class fileCounter {
	int count;
	BufferedReader br;	
	PrintWriter pw;
	String path;
	
	public void setPath(String path){
		this.path = path;
	}
	
	public String getPath(){
		return path;
	}
	
	public int getCount(){
		return count;
	}
	
	
	public int getJspInit(){
		//this.path = path;
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
		return count;
	}
	
	public void setJspDestroy(boolean a){
		//setSaveFile();
	}
	
	public void setSaveFile(String path){
		this.path = path;
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
	
	public void setCount1(boolean count1){
		count++;
		System.out.println(count);
	}
}
