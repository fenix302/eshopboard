package work.notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// Criteria 네이밍 의미는 "검색의 기준"을 의미합니다.
@Getter @Setter @ToString
public class Criteria {

	private int pageNum;  // 페이지 번호 필드 정의
	private int amount;	  // 페이지당 보여주는 데이터 수 필드 정의
	
	private String type;	// 검색 조건 처리를 위한 검색 조건(type) 필드 정의
	private String keyword; // 검색에 사용하는 키워드(keyword) 필드 정의
	
	public Criteria() {
		this(1, 10); 	// 1 페이지당 10개
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// getTypeArr() 메서드는 검색 조건이 각 글자(T, W ,C)로 구성되어 있을 경우 검색 조건을 배열로 만들어서 한번에 처리하기 위함입니다.
	// getTypeArr()을 이용해서 MyBatis의 동적 태그를 활용할 수 있습니다.
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	
	
}
