package work.code;

import java.io.Serializable;

public class CodeBean implements Serializable{
	private String commTyCd;
	private String commCd;
	private String commCdNm;

	public CodeBean() {
		super();
	}

	public CodeBean(String commTyCd, String commCd, String commCdNm) {
		super();
		this.commTyCd = commTyCd;
		this.commCd = commCd;
		this.commCdNm = commCdNm;
	}

	public String getCommTyCd() {
		return commTyCd;
	}

	public void setCommTyCd(String commTyCd) {
		this.commTyCd = commTyCd;
	}

	public String getCommCd() {
		return commCd;
	}

	public void setCommCd(String commCd) {
		this.commCd = commCd;
	}

	public String getCommCdNm() {
		return commCdNm;
	}

	public void setCommCdNm(String commCdNm) {
		this.commCdNm = commCdNm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CodeBean [commTyCd=");
		builder.append(commTyCd);
		builder.append(", commCd=");
		builder.append(commCd);
		builder.append(", commCdNm=");
		builder.append(commCdNm);
		builder.append("]");
		return builder.toString();
	}
}
