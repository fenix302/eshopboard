package work.notice;

import java.util.List;

import org.apache.ibatis.annotations.Select;


public interface BoardMapper {
	
//	@Select("select * from tb_jw_notice where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
}
