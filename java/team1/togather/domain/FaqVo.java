package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class FaqVo {
	private int page = 1;
	private int pageSize = 5;
	private String option ="제목";
	
	public FaqVo(int page, int pageSize) {
		super();
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public int getStartRow() {
		return (page-1)*pageSize;
	}
	public int getEndRow() {
		return page*pageSize;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <=0 || pageSize > 100) {
			this.pageSize = 10;			
			return;
		}
		this.pageSize = pageSize;			
	}
	
	//페이징처리 시작하는 값생성
	//멤버변수가 아니지만 getter와 setter를 생성하면 Mapper에서 접근가능하다.
	//Mapper에서 사용하는 법 #{pageStart}
	public int getPageStart() {
		return (this.page - 1)*this.pageSize;
	}
	
	//toString()
	@Override
	public String toString() {
		return "FaqVo [page=" + page + ", pageSize=" + pageSize + "]";
	}
}
