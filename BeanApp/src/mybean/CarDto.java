/*
 * name			r/w		data type
   -----------------------------------
   plateNumber		r		String
   parkingTime		r		java.util.Date
 */

package mybean;

import java.io.Serializable;
import java.util.Date;

public class CarDto implements Serializable{		// 관련있는 데이터를 묶어준다 (차번호, 입차시간)
	private String plateNumber;
	private long parkingTime;
	
	public CarDto(){}
	public CarDto(String plate, long time){	// setter메서드 대신에 생성자로 값을 저장
		plateNumber = plate;
		parkingTime = time;
	}
	
	public String getPlateNumber(){  // 차량번호만 뽑아오는 메서드
		return plateNumber;
	}
		
	public Date getParkingTime(){
		return new Date(parkingTime);  // 밀리초 단위인 parkingTime을 date단위로 변환
	}
	
}
