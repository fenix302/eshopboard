package work.reply;

import java.io.Serializable;

public class ReplyBean implements Serializable{
	private String productCode;     //제품코드
	private String userCode;     //유저코드
	private int userReplyNo;	 //댓글일련번호
	private String userReply;    //댓글내용
	private String replyDate;    //댓글날짜

	public ReplyBean() {
		super();
	}

	public ReplyBean(String productCode, String userCode, int userReplyNo,
			String userReply, String replyDate) {
		super();
		this.productCode = productCode;
		this.userCode = userCode;
		this.userReplyNo = userReplyNo;
		this.userReply = userReply;
		this.replyDate = replyDate;
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

	public int getUserReplyNo() {
		return userReplyNo;
	}

	public void setUserReplyNo(int userReplyNo) {
		this.userReplyNo = userReplyNo;
	}

	public String getUserReply() {
		return userReply;
	}

	public void setUserReply(String userReply) {
		this.userReply = userReply;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReplyBean [productCode=");
		builder.append(productCode);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", userReplyNo=");
		builder.append(userReplyNo);
		builder.append(", userReply=");
		builder.append(userReply);
		builder.append(", replyDate=");
		builder.append(replyDate);
		builder.append("]");
		return builder.toString();
	}
}
