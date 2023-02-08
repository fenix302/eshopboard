package work.mark;

import java.io.Serializable;

public class MarkBean implements Serializable{
	private String productCode;     //제품코드
	private String userCode;     //유저코드
	private int markRating;

	public MarkBean() {
		super();
	}

	public MarkBean(String productCode, String userCode, int markRating) {
		super();
		this.productCode = productCode;
		this.userCode = userCode;
		this.markRating = markRating;
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

	public int getMarkRating() {
		return markRating;
	}

	public void setMarkRating(int markRating) {
		this.markRating = markRating;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MarkBean [productCode=");
		builder.append(productCode);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", markRating=");
		builder.append(markRating);
		builder.append("]");
		return builder.toString();
	}
}
