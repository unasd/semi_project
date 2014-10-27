package mybean;

import java.util.Random;

public class DiceBean {
	private Random random = new Random();
	private int min, max;
	//int rnum;
	
	public void setMinNumber(int min){
		this.min = min;
	}
	
	public int getMinNumber(){
		return min;
	}
	
	
	public void setMaxNumber(int max){
		this.max = max;
	}
	
	public int getMaxNumber(){
		return max;
	}
		
	public int getRandomNumber(){
		return random.nextInt(max-min+1)+min;		
		//rnum = (int)(Math.random()*max+min);
		//return rnum;
	}
}
