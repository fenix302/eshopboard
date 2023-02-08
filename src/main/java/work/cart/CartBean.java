package work.cart;

import java.io.Serializable;

public class CartBean implements Serializable{
	private String cartCode;    //장바구니코드
	private String productCode; //제품코드
	private String userCode;    //유저코드
	private int cartPrice;      //판매단가
	private int cartCount;      //판매수량
	private String cartDate;    //장바구니에 담은날짜

	public CartBean() {
		super();
	}

	public CartBean(String cartCode, String productCode, String userCode,
			int cartPrice, int cartCount, String cartDate) {
		super();
		this.cartCode = cartCode;
		this.productCode = productCode;
		this.userCode = userCode;
		this.cartPrice = cartPrice;
		this.cartCount = cartCount;
		this.cartDate = cartDate;
	}

	public String getCartCode() {
		return cartCode;
	}

	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public String getCartDate() {
		return cartDate;
	}

	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
}
