package work.service;

import java.util.List;

import work.notice.BoardVO;
import work.notice.Criteria;


public interface BoardService {

	public void register(BoardVO board);
	
	// 특정한 게시물을 가져오는 get() 메서드는 처음부터 메서드의 리턴 타입을 결정해서 진행할 수 있습니다.
	public BoardVO get(Long bno);	
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
		
	// 전체 리스트를 구하는 getList() 메서드는 처음부터 메서드의 리턴 타입을 결정해서 진행할 수 있습니다.
//	public List<BoardVO> getList();		
	
	// Page 298 BoardService에서 getList() 메서드에 Criteria를 파라미터로 처리하도록 수정합니다.
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
