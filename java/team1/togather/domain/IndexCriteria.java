package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class IndexCriteria {
	private int page;
	private int pageSize;

	public IndexCriteria() {
		this.page = 1;
		this.pageSize = 6;
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
			this.pageSize = 6;			
			return;
		}
		this.pageSize = pageSize;			
	}
	
	public int getPageStart() {
		return (this.page - 1)*this.pageSize;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + "]";
	}
}
