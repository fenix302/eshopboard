package work.sell;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.cart.CartService;
import work.product.ProductService;
import work.user.UserService;

@Controller
public class SellController {
	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "sellService")
	private SellService sellService;

	@Resource(name = "cartService")
	private CartService cartService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/sell/createSell.do", method=RequestMethod.GET)
	public ModelAndView createSell(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String productCode = request.getParameter("productCode");
		String sellPrice = request.getParameter("sellPrice");
		String sellCount = request.getParameter("sellCount");

		String fromCart = request.getParameter("fromCart");

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> sellParam = new HashMap<String, String>();

		sellParam.put("productCode", productCode);
		sellParam.put("userCode", userCode);
		sellParam.put("sellPrice", sellPrice);
		sellParam.put("sellCount", sellCount);

		//판매테이블에 저장
		sellService.createSell(sellParam);

		if(fromCart != null){
			Map<String, String> cartParam = new HashMap<String, String>();
			Map<String, String> productParam = new HashMap<String, String>();
			sellParam = new HashMap<String, String>();

			String cartCode = request.getParameter("cartCode");
			String sellCode = sellService.retrieveMaxSellCode();

			cartParam.put("cartCode", cartCode);
			sellParam.put("sellCode", sellCode);

			cartService.deleteCart(cartParam);
			sellService.updateSellYn(sellParam);

			mv.setViewName("redirect:/work/sell/retrieveSellConfirm.do?productCode=" + productCode);

		}else{
			mv.setViewName("redirect:/work/sell/retrieveSellList.do");
		}

		return mv;
	}

	@RequestMapping(value="/work/sell/updateFinalBuy.do", method=RequestMethod.GET)
	public ModelAndView updateFinalBuy(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> productParam = new HashMap<String, String>();
		Map<String, String> sellParam = new HashMap<String, String>();

		String productCode = request.getParameter("productCode");
		String sellCode = request.getParameter("sellCode");
		String sellCount = request.getParameter("sellCount");

		sellParam.put("sellCode", sellCode);

		productParam.put("productCode", productCode);
		productParam.put("productCount", sellCount);

		productService.updateProductCountMinus(productParam);

		sellService.updateSellYn(sellParam);

		mv.setViewName("redirect:/work/sell/retrieveSellConfirm.do?productCode=" + productCode);

		return mv;
	}

	@RequestMapping(value="/work/sell/retrieveSellConfirm.do", method=RequestMethod.GET)
	public ModelAndView retrieveSellConfirm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String productCode = request.getParameter("productCode");

		mv.addObject("productCode", productCode);

		mv.setViewName("/sell/sellConfirmR");

		return mv;
	}


	@RequestMapping(value="/work/sell/retrieveSellList.do", method=RequestMethod.GET)
	public ModelAndView retrieveSellList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> sellParam = new HashMap<String, String>();

		sellParam.put("userCode", userCode);

		List<Map<String, String>> dsSellList = sellService.retrieveSellList(sellParam);

		mv.addObject("dsSellList", dsSellList);

		mv.setViewName("/sell/sellListR");

		return mv;
	}

	@RequestMapping(value="/work/sell/retrieveBuyList.do", method=RequestMethod.GET)
	public ModelAndView retrieveBuyList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> sellParam = new HashMap<String, String>();

		sellParam.put("userCode", userCode);

		List<Map<String, String>> dsBuyList = sellService.retrieveBuyList(sellParam);

		mv.addObject("dsBuyList", dsBuyList);

		mv.setViewName("/sell/sellBuyListR");

		return mv;
	}

	@RequestMapping(value="/work/sell/retrieveStatisticsForProduct.do",method=RequestMethod.GET)
	public ModelAndView retrieveStatisticsForProduct(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String sort = request.getParameter("sort");

		JSONArray jsonDonutArr = new JSONArray();
		JSONArray jsonBarArr = new JSONArray();

		List<Map<String, String>> dsProduct = sellService.retrieveStatisticsForProduct();
		JSONObject jsonObj = null;

		for(int i = 0; i < dsProduct.size(); i++){
			jsonObj = new JSONObject();
			String productname = dsProduct.get(i).get("PRODUCT_NAME");
			String sellPrice = String.valueOf(dsProduct.get(i).get("SELL_PRICE"));

			jsonObj.put("label", productname);
			jsonObj.put("value", sellPrice);

			jsonDonutArr.add(jsonObj);

			jsonObj = new JSONObject();

			jsonObj.put("y", productname);
			jsonObj.put("a", sellPrice);

			jsonBarArr.add(jsonObj);
		}

		mv.addObject("objDonut", jsonDonutArr);
		mv.addObject("objBar", jsonBarArr);

		if(sort != null) mv.addObject("sort", sort);

		mv.setViewName("/statistics/statisticsForSell");

		return mv;
	}

	@RequestMapping(value="/work/sell/retrieveStatisticsForCategory.do",method=RequestMethod.GET)
	public ModelAndView retrieveStatisticsForCategory(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String sort = request.getParameter("sort");

		JSONArray jsonDonutArr = new JSONArray();
		JSONArray jsonBarArr = new JSONArray();

		List<Map<String, String>> dsCategory = sellService.retrieveStatisticsForCategory();
		JSONObject jsonObj = null;

		for(int i = 0; i < dsCategory.size(); i++){
			jsonObj = new JSONObject();
			String productCategoryCd = dsCategory.get(i).get("PRODUCT_CATEGORY_CD");
			String sellPrice = String.valueOf(dsCategory.get(i).get("SELL_PRICE"));

			jsonObj.put("label", productCategoryCd);
			jsonObj.put("value", sellPrice);

			jsonDonutArr.add(jsonObj);

			jsonObj = new JSONObject();

			jsonObj.put("y", productCategoryCd);
			jsonObj.put("a", sellPrice);

			jsonBarArr.add(jsonObj);
		}

		mv.addObject("objDonut", jsonDonutArr);
		mv.addObject("objBar", jsonBarArr);

		if(sort != null) mv.addObject("sort", sort);

		mv.setViewName("/statistics/statisticsForSell");

		return mv;
	}

}
