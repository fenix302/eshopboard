package work.notice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
import work.service.BoardService;

@Controller
@Log4j
@RequestMapping("/notice/*")
@NoArgsConstructor
@Getter
@ToString
@Setter(onMethod_ = @Autowired)
public class BoardController {
	
	@Autowired
	private BoardService service;

	//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}

	// Page 300 BoardController list() 메서드에
	// Criteria 타입으로 cri(pageNum과 amount 생성 인스턴스 객체) 처리하도록 수정
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, Model model) {
		
		ModelAndView mv = new ModelAndView();
		
		log.info("list : " + cri);
//		model.addAttribute("list", service.getList(cri));
		mv.addObject("list", service.getList(cri));
		
		// list()는 'pageMaker'라는 이름으로 PageDTO 클래스에서 객체를 만들어서
		// Model에 담아줍니다. PageDTO를 구성하기 위해서는 전체 데이터 수가 필요한데,
		// 아직 그 처리가 이루이지지 않았으므로 임의의 값으로 123을 지정.
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		// Page 324 BoardController에서는 BoardService 인터페이스를 통해서
		// getTotal()을 호출하도록 변경 처리합니다.
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
		mv.addObject("pageMaker", new PageDTO(cri, total));
		
		mv.setViewName("/notice/list");
		return mv;
	}
	
	// 게시물의 등록 작업은 POST 방식으로 처리(아래에 @PostMapping 참고)하지만,
	// 화면에서 입력을 받아야 하므로 GET방식으로 입력 페이지를 볼 수 있도록 BoardController에 
	// @GetMapping 방식으로 register() 메서드를 추가합니다.
	// register() 메서드는 입력 페이지를 보여주는 역할만을 하기 때문에
	// 별도의 처리가 필요하지 않습니다.
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {
		
	}
	
	// register() 메서드는 조금 다르게 String을 리턴 타입으로 지정하고,
	// RedirectAttributes를 파라미터로 지정합니다. 이것은 등록 작업(register)이 끝난 후
	// 다시 목록 화면으로 이동하기 위함인데, 추가적으로 새롭게 등록된 게시물의 번호를 같이 전달하기 위해서
	// RedirectAttributes 를 이용합니다. 리턴시에는 'redirect:' 접두어를 사용하는데
	// 이를 이용하면 스프릴 MVC가 내부적으로 response.sendRedirect()를 처리해 주기 때문에 편리합니다.
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = {"/get", "/modify"}, method = RequestMethod.GET)
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + bno);
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	
}







