package work.mark;

import java.util.Map;

public interface MarkService {
	public Map<String, String> retrieveMark(Map<String, String> markParam);
	public void createMark(Map<String, String> markParam);

}
