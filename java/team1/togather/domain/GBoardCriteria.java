package team1.togather.domain;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class GBoardCriteria {
	private long page;
	private long pageSize;
	private String option ="글쓴이";
	private String ocontent = "장";
	private long gseq;
	
	public GBoardCriteria(long page, long pageSize, long gseq) {
		this.page = page;
		this.pageSize = pageSize;
		this.gseq = gseq;
	}
	public GBoardCriteria() {
		this.page = 1;
		this.pageSize = 10;
	}
	public long getStartRow() {
		return (page-1)*pageSize;
	}
	public long getEndRow() {
		return page*pageSize;
	}

	public long getPage() {
		return page;
	}
	
	public void setPage(long page) {
		if(page <=0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public long getPageSize() {
		return pageSize;
	}

	public void setPageSize(long pageSize) {
		if(pageSize <=0 || pageSize > 100) {
			this.pageSize = 10;			
			return;
		}
		this.pageSize = pageSize;			
	}
	
	
	public long getPageStart() {
		return (this.page - 1)*this.pageSize;
	}
	
	public long getGseq() {
		return gseq;
	}
	public void setGseq(long gseq) {
		this.gseq = gseq;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + "]";
	}
}
