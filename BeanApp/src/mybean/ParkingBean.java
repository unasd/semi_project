/*
 * 	name			r/w		data type
--------------------------------------
enter			w		String
exit			w		String
total			r		int
carDto			r		CarDto & CarDto[]
 */

package mybean;

import java.util.Vector;

public class ParkingBean {
	private Vector carList = new Vector();		// 차량번호를 저장할 컬렉션
	
	public void setEnter(String enter){
		CarDto dto = new CarDto(enter, System.currentTimeMillis());
		carList.add(dto); // carList에는 CarDto객체가 저장된다
	}
	
	public void setExit(String exit){
		CarDto dto = null;
		for(int i=0; i<carList.size();i++){
			dto = (CarDto)carList.get(i);  // carList벡터의 i번째 객체를 CarDto형태로 변환하여 대입
			if(exit.equals(dto.getPlateNumber())){ // 대입된 dto객체의 PlateNumber와 exit가 같은지 
				carList.remove(i);   // 같다면 carList의 i번째 객체를 삭제
				break;
			}
		}
	}
	
	public int getTotal(){
		return carList.size(); // carList컬렉션의 크기(갯수)
	}
	
	// 특정 차를 조회
	public CarDto getCarDto(String plateNumber){ 
		// getter메서드에는 매개변수를 쓸 수 없다 -> 액션태그를 사용할 수 없다
		return null;
	}
	
	/*
	public CarDto[] getCarList(){
		CarDto[] cars = new CarDto[carList.size()];
		for(int i=0; i<carList.size();i++){ // carList의 데이터를 cars배열로 옮긴다
			cars[i] = (CarDto)carList.get(i);
		}
		
		return cars;
	}*/
	
	
	public Vector getCarList(){
		return carList;
	}
	
}
