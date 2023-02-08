package work.notice;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class PageDTO {

	private int startPage;  // 시작 페이지 필드 정의
	private int endPage;  	// 끝 페이지 필드 정의
	private boolean prev, next;  // prev(이전), next(다음) 처리 필드 정의
	
	private int total;  // 전체 데이터 수 필드 정의
	private Criteria cri; // pageNum, amount로 구성된 Criteria 객체 정의

	public PageDTO(Criteria cri, int total) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = startPage > 1;
		this.next = this.endPage < realEnd;
		
		
	}
	
	
	
	
	
	
}
