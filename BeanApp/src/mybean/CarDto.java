/*
 * name			r/w		data type
   -----------------------------------
   plateNumber		r		String
   parkingTime		r		java.util.Date
 */

package mybean;

import java.io.Serializable;
import java.util.Date;

public class CarDto implements Serializable{		// �����ִ� �����͸� �����ش� (����ȣ, �����ð�)
	private String plateNumber;
	private long parkingTime;
	
	public CarDto(){}
	public CarDto(String plate, long time){	// setter�޼��� ��ſ� �����ڷ� ���� ����
		plateNumber = plate;
		parkingTime = time;
	}
	
	public String getPlateNumber(){  // ������ȣ�� �̾ƿ��� �޼���
		return plateNumber;
	}
		
	public Date getParkingTime(){
		return new Date(parkingTime);  // �и��� ������ parkingTime�� date������ ��ȯ
	}
	
}
