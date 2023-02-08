package work.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.product.ProductService;
import work.user.UserService;

@Controller
public class CartController {
	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "cartService")
	private CartService cartService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/cart/createCart.do", method=RequestMethod.GET)
	public ModelAndView createCart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String productCode = request.getParameter("productCode");
		String cartPrice = request.getParameter("cartPrice");
		String cartCount = request.getParameter("cartCount");

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> cartParam = new HashMap<String, String>();
		Map<String, String> productParam = new HashMap<String, String>();

		cartParam.put("productCode", productCode);
		cartParam.put("userCode", userCode);
		cartParam.put("cartPrice", cartPrice);
		cartParam.put("cartCount", cartCount);

		//장바구니 테이블에 저장
		cartService.createCart(cartParam);

		productParam.put("productCode", productCode);
		productParam.put("productCount", cartCount);

		productService.updateProductCountMinus(productParam);

//		productService.updateProductCountMinus(productParam);

		mv.setViewName("redirect:/work/cart/retrieveCartList.do");

		return mv;
	}

	@RequestMapping(value="/work/cart/deleteCart.do", method=RequestMethod.GET)
	public ModelAndView deleteCart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> cartParam = new HashMap<String, String>();
		Map<String, String> productParam = new HashMap<String, String>();

		String cartCode = request.getParameter("cartCode");
		String productCode = request.getParameter("productCode");
		String productCount = request.getParameter("productCount");

		cartParam.put("cartCode", cartCode);

		cartService.deleteCart(cartParam);

		productParam.put("productCode", productCode);
		productParam.put("productCount", productCount);

		productService.updateProductCountPlus(productParam);

		mv.setViewName("redirect:/work/cart/retrieveCartList.do");

		return mv;
	}

	@RequestMapping(value="/work/cart/retrieveCartConfirm.do", method=RequestMethod.GET)
	public ModelAndView retrieveCartConfirm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String productCode = request.getParameter("productCode");

		mv.addObject("productCode", productCode);

		mv.setViewName("/cart/cartConfirmR");

		return mv;
	}


	@RequestMapping(value="/work/cart/retrieveCartList.do", method=RequestMethod.GET)
	public ModelAndView retrieveCartList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> cartParam = new HashMap<String, String>();

		cartParam.put("userCode", userCode);

		List<Map<String, String>> dsCartList = cartService.retrieveCartList(cartParam);

		mv.addObject("dsCartList", dsCartList);

		mv.setViewName("/cart/cartListR");

		return mv;
	}

}
