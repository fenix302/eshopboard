package work.reply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	@Resource(name = "replyDAO")
	private ReplyDAO replyDAO;

	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam){
		return replyDAO.retrieveReplyList(replyParam);
	}

	public Map<String, String> retrieveReply(Map<String, String> replyParam){
		return replyDAO.retrieveReply(replyParam);
	}

	public void createReply(Map<String, String> replyParam){
		replyDAO.createReply(replyParam);
	}

	public void updateReply(Map<String, String> replyParam){
		replyDAO.updateReply(replyParam);
	}

	public void deleteReply(Map<String, String> replyParam){
		replyDAO.deleteReply(replyParam);
	}
}
