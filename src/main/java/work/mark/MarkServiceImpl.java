package work.mark;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("markService")
public class MarkServiceImpl implements MarkService{
	@Resource(name = "markDAO")
	private MarkDAO markDAO;

	public Map<String, String> retrieveMark(Map<String, String> markParam){
		return markDAO.retrieveMark(markParam);
	}

	public void createMark(Map<String, String> markParam){
		markDAO.createMark(markParam);
	}
}
