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
	private Vector carList = new Vector();		// ������ȣ�� ������ �÷���
	
	public void setEnter(String enter){
		CarDto dto = new CarDto(enter, System.currentTimeMillis());
		carList.add(dto); // carList���� CarDto��ü�� ����ȴ�
	}
	
	public void setExit(String exit){
		CarDto dto = null;
		for(int i=0; i<carList.size();i++){
			dto = (CarDto)carList.get(i);  // carList������ i��° ��ü�� CarDto���·� ��ȯ�Ͽ� ����
			if(exit.equals(dto.getPlateNumber())){ // ���Ե� dto��ü�� PlateNumber�� exit�� ������ 
				carList.remove(i);   // ���ٸ� carList�� i��° ��ü�� ����
				break;
			}
		}
	}
	
	public int getTotal(){
		return carList.size(); // carList�÷����� ũ��(����)
	}
	
	// Ư�� ���� ��ȸ
	public CarDto getCarDto(String plateNumber){ 
		// getter�޼��忡�� �Ű������� �� �� ���� -> �׼��±׸� ����� �� ����
		return null;
	}
	
	/*
	public CarDto[] getCarList(){
		CarDto[] cars = new CarDto[carList.size()];
		for(int i=0; i<carList.size();i++){ // carList�� �����͸� cars�迭�� �ű��
			cars[i] = (CarDto)carList.get(i);
		}
		
		return cars;
	}*/
	
	
	public Vector getCarList(){
		return carList;
	}
	
}
