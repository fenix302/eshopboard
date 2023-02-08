package work.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam){
		return sqlSession.selectList("reply.retrieveReplyList", replyParam);
	}

	public Map<String, String> retrieveReply(Map<String, String> replyParam){
		return sqlSession.selectOne("reply.retrieveReply", replyParam);
	}

	public void createReply(Map<String, String> replyParam){
		sqlSession.insert("reply.createReply", replyParam);
	}

	public void updateReply(Map<String, String> replyParam){
		sqlSession.update("reply.updateReply", replyParam);
	}

	public void deleteReply(Map<String, String> replyParam){
		sqlSession.delete("reply.deleteReply", replyParam);
	}


}
