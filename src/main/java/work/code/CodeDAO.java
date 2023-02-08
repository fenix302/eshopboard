package work.code;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<CodeBean> retrieveCodeList(Map<String, String> codeParam)  {
		return sqlSession.selectList("code.retrieveCodeList", codeParam);
	}
}
