package work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
import work.notice.BoardMapper;
import work.notice.BoardVO;
import work.notice.Criteria;

@Log4j
@Service
@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardServiceImpl implements BoardService{

	// 아래와 같이 @Autowired를 직접 설정해 줄 수도 있고, Setter를 이용해서 처리할 수도 있지만
	// @Setter(onMethod_ = @Autowired)
	// 스프링 4.3부터는 단일 파라미터를 받는 생성자의 경우에는 필요한 파라미터를 자동으로 주입할 수 있습니다.
	// 위에서 @AllArgsConstructor는 모든 파라미터를 이용하는 생성자를 만들기 때문에
	// 실제 코드는 BoardMapper를 주입받는 생성자가 만들어지게 됩니다.
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register............." + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get........................" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify................." + board);
		// 정상적으로 수정 처리가 이루어지면 1이라는 값이 반환되기 때문에 '==' 연산자를 이용해서
		// true/false를 처리할 수 있습니다.
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove..................." + bno);
		// 정상적으로 수정 처리가 이루어지면 1이라는 값이 반환되기 때문에 '==' 연산자를 이용해서
		// true/false를 처리할 수 있습니다.
		return mapper.delete(bno) == 1;
	}

//	@Override
//	public List<BoardVO> getList() {
//		log.info("getList......................................");
//		
//		return mapper.getList();
//	}

	// Page 299 getList() 메서드에 Criteria 타입의 cri 매개변수 정의
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with crietria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}











