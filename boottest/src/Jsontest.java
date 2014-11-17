import java.util.ArrayList;
import java.util.List;

import semi.StockDao;
import semi.StockDto;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
  
public class Jsontest {  
  
    public void testArrayCollection() {  
    	StockDao dao = new StockDao();
    	ArrayList infoList = (ArrayList)dao.getList(); // �켱 json �����ͷ� ��ȯ�� �����͸� DB���� ����
    	JSONObject jsonObject = new JSONObject(); // JSONObject ����
    	JSONArray cell = new JSONArray(); // JSONObject list �� ���� JSONArray
    	StockDto data = null; // �����͸� ������ BeanVO ��ü ����
    	
    	for(int i=0; i<infoList.size(); i++) { // ������ ���� list�� ��� �����͸� BeanVO�� ����
	    	data = (StockDto)infoList.get(i); // ���� data ���� ��ü���� ���ʷ� �����
	    	JSONObject obj = new JSONObject(); // �ٽ� �ѹ� JSONObject�� ���α� ���� ��ü ����
	    	obj.put( "item1" , data.getCname()); // obj�� ��ü�� �����͸� ���� ���ʷ� ��´�
	    	obj.put( "item2" , data.getCode()); // ( key , value ) ����
	    	obj.put( "item3" , data.getName());
	    	cell.add(obj); // �Ʊ� ������� cell Array��ü�� VO���� ��ü�� ����
    	}
    	
    	jsonObject.put("rows", cell); // ���������� JSON��ü�� JSONArray ��ü�� ������ ��!
    }  
}  