package work.code;

import java.util.List;
import java.util.Map;

public interface CodeService {
	public List<CodeBean> retrieveCodeList(Map<String, String> codeParam);
}
