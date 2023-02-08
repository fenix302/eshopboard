package work.mark;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.sell.SellService;

@Controller
public class MarkController {
//	@Resource(name = "replyService")
//	private MarkService replyService;
//
//	@Resource(name = "sellService")
//	private SellService sellService;
//
//	@RequestMapping(value="/work/reply/createReply.do", method=RequestMethod.POST)
//	public ModelAndView createReply
//	(HttpServletRequest request){
//		ModelAndView mv = new ModelAndView();
//
//		HttpSession session = request.getSession();
//
//		Map<String, String> replyParam = new HashMap<String, String>();
//		Map<String, String> sellParam = new HashMap<String, String>();
//
//		String userCode = (String)session.getAttribute("userCode");
//		String productCode = request.getParameter("productCode");
//		String userReply = request.getParameter("userReply");
//		String replyYn = request.getParameter("replyYn");
//		String sellRating = request.getParameter("sellRating");
//		String sellCode = request.getParameter("sellCode");
//
//		replyParam.put("userCode", userCode);
//		replyParam.put("productCode", productCode);
//		replyParam.put("userReply", userReply);
//
//		if("N".equals(replyYn)){
//			sellParam.put("sellRating", sellRating);
//			sellParam.put("sellCode", sellCode);
//
//			sellService.updateSellRating(sellParam);
//		}
//
//		//댓글 생성
//		replyService.createReply(replyParam);
//
//		mv.setViewName("redirect:/work/product/retrieveProduct.do?productCode=" + productCode);
//
//		return mv;
//	}
//
//	@RequestMapping(value="/work/reply/deleteReply.do", method=RequestMethod.GET)
//	public ModelAndView deleteReply(HttpServletRequest request){
//		ModelAndView mv = new ModelAndView();
//
//		HttpSession session = request.getSession();
//
//		Map<String, String> replyParam = new HashMap<String, String>();
//
//		String userCode = (String)session.getAttribute("userCode");
//		String voteCode = request.getParameter("voteCode");
//		String userReplyNo = request.getParameter("userReplyNo");
//
//
//		replyParam.put("userCode", userCode);
//		replyParam.put("voteCode", voteCode);
//		replyParam.put("userReplyNo", userReplyNo);
//
//		//댓글 삭제
//		replyService.deleteReply(replyParam);
//
//		mv.setViewName("redirect:/work/result/retrieveResult.do?voteCode=" + voteCode);
//
//		return mv;
//	}

}
