import java.util.ArrayList;
import java.util.List;

import semi.StockDao;
import semi.StockDto;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
  
public class Jsontest {  
  
    public void testArrayCollection() {  
    	StockDao dao = new StockDao();
    	ArrayList infoList = (ArrayList)dao.getList(); // 우선 json 데이터로 변환할 데이터를 DB에서 추출
    	JSONObject jsonObject = new JSONObject(); // JSONObject 생성
    	JSONArray cell = new JSONArray(); // JSONObject list 를 넣을 JSONArray
    	StockDto data = null; // 데이터를 꺼내올 BeanVO 객체 생성
    	
    	for(int i=0; i<infoList.size(); i++) { // 루프를 돌려 list에 담긴 데이터를 BeanVO에 주입
	    	data = (StockDto)infoList.get(i); // 이제 data 에는 객체들이 차례로 담겼음
	    	JSONObject obj = new JSONObject(); // 다시 한번 JSONObject로 감싸기 위해 객체 선언
	    	obj.put( "item1" , data.getCname()); // obj에 객체의 데이터를 꺼내 차례로 담는다
	    	obj.put( "item2" , data.getCode()); // ( key , value ) 형식
	    	obj.put( "item3" , data.getName());
	    	cell.add(obj); // 아까 만들어진 cell Array객체에 VO담은 객체를 주입
    	}
    	
    	jsonObject.put("rows", cell); // 마지막으로 JSON객체에 JSONArray 객체를 넣으면 끝!
    }  
}  