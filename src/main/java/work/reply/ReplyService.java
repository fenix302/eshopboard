package work.reply;

import java.util.List;
import java.util.Map;


public interface ReplyService {
	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam);

	public Map<String, String> retrieveReply(Map<String, String> replyParam);

	public void createReply(Map<String, String> replyParam);

	public void updateReply(Map<String, String> replyParam);
	public void deleteReply(Map<String, String> replyParam);
}
