package work.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name = "userDAO")
	private UserDAO UserDAO;

	@Autowired
	public void setUserDAO(UserDAO dao){
		this.UserDAO = dao;
	}

	public String retrieveUserId(String email){
		return UserDAO.retrieveUserId(email);
	}

	public String retrieveUserPw(String id, String email){
		return UserDAO.retrieveUserPw(id, email);
	}

	public List<UserBean> retrieveUserList()  {
		return UserDAO.retrieveUserList();
	}

	public UserBean retrieveUser(String id)  {
		return UserDAO.retrieveUser(id);
	}

	public UserBean retrieveSessionInfo(String id)  {
		return UserDAO.retrieveSessionInfo(id);
	}

	public boolean logincheck(String id, String pw){
		return UserDAO.logincheck(id, pw);
	}

	public void deleteUser(String id)  {
		UserDAO.deleteUser(id);
	}

	public void createUser(UserBean bean)  {
		UserDAO.createUser(bean);
	}

	public void updateUser(UserBean bean)  {
		UserDAO.updateUser(bean);
	}

	public List<Map<String, String>> retrievePostByDong(Map<String, String> userParam){
		return UserDAO.retrievePostByDong(userParam);
	}

	public void updatePlusRentBookCnt(Map<String, String> userParam){
		UserDAO.updatePlusRentBookCnt(userParam);
	}

	public void updateMinusRentBookCnt(Map<String, String> userParam){
		UserDAO.updateMinusRentBookCnt(userParam);
	}

	public void updatePlusReserveBookCnt(Map<String, String> userParam){
		UserDAO.updatePlusReserveBookCnt(userParam);
	}

	public void updateMinusReserveBookCnt(Map<String, String> userParam){
		UserDAO.updateMinusReserveBookCnt(userParam);
	}

	public Map<String,String> retrieveRentBookCnt(Map<String, String> userParam){
		return UserDAO.retrieveRentBookCnt(userParam);
	}

	public Map<String,String> retrieveReserveBookCnt(Map<String, String> userParam){
		return UserDAO.retrieveReserveBookCnt(userParam);
	}


}
