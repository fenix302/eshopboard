package work.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void createCart(Map<String, String> cartParam){
		sqlSession.insert("cart.createCart", cartParam);
	}

	public List<Map<String, String>> retrieveCartList(Map<String, String> cartParam){
		return sqlSession.selectList("cart.retrieveCartList", cartParam);
	}

	public void deleteCart(Map<String, String> cartParam){
		sqlSession.delete("cart.deleteCart", cartParam);
	}
}
