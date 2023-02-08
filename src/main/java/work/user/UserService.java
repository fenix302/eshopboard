package work.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	public List<UserBean> retrieveUserList();
	public UserBean retrieveUser(String id);
	public String retrieveUserId(String email);
	public String retrieveUserPw(String id, String email);
	public boolean logincheck(String id, String pw);
	public void deleteUser(String id);
	public UserBean retrieveSessionInfo(String id);
	public void updateUser(UserBean bean);
	public void createUser(UserBean bean);
	public List<Map<String, String>> retrievePostByDong(Map<String, String> userParam);

	public Map<String,String> retrieveRentBookCnt(Map<String, String> userParam);
	public Map<String,String> retrieveReserveBookCnt(Map<String, String> userParam);

	public void updatePlusRentBookCnt(Map<String, String> userParam);
	public void updateMinusRentBookCnt(Map<String, String> userParam);

	public void updatePlusReserveBookCnt(Map<String, String> userParam);
	public void updateMinusReserveBookCnt(Map<String, String> userParam);

}
