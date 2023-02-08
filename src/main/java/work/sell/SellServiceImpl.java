package work.sell;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("sellService")
public class SellServiceImpl implements SellService{
	@Resource(name = "sellDAO")
	private SellDAO sellDAO;

	public List<Map<String, String>> retrieveSellList(Map<String, String> sellParam){
		return sellDAO.retrieveSellList(sellParam);
	}

	public List<Map<String, String>> retrieveBuyList(Map<String, String> sellParam){
		return sellDAO.retrieveBuyList(sellParam);
	}

	public void createSell(Map<String, String> sellParam){
		sellDAO.createSell(sellParam);
	}

	public String retrieveMaxSellCode(){
		return sellDAO.retrieveMaxSellCode();
	}

	public void updateSellYn(Map<String, String> sellParam){
		sellDAO.updateSellYn(sellParam);
	}

	public List<Map<String, String>> retrieveStatisticsForProduct(){
		return sellDAO.retrieveStatisticsForProduct();
	}

	public List<Map<String, String>> retrieveStatisticsForCategory(){
		return sellDAO.retrieveStatisticsForCategory();
	}

}
