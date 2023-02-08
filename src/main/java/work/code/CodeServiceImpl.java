package work.code;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("codeService")
public class CodeServiceImpl implements CodeService{
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	public List<CodeBean> retrieveCodeList(Map<String, String> codeParam) {
		return codeDAO.retrieveCodeList(codeParam);
	}




}
