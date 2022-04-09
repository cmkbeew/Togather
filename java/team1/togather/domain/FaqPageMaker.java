package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class FaqPageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private FaqVo faqVo; //for page, pageSize 값
	
	private int displayPageNum = 5; // 화면에 보여지는 페이지블럭 수 
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcDate();
	}
	private void calcDate() {
		endPage = (int) (Math.ceil(faqVo.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) +1;
		int tempEndPage = (int) (Math.ceil(totalCount/(double)faqVo.getPageSize()));
		if(endPage > tempEndPage) endPage = tempEndPage;
		prev = (faqVo.getPage() == 1? false:true);
		next = (endPage == faqVo.getPage()? false:true);
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public FaqVo getFaqVo() {
		return faqVo;
	}

	public void setFaqVo(FaqVo faqVo) { //변경
		this.faqVo = faqVo;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", faqVo=" + faqVo + ", displayPageNum=" + displayPageNum + "]";
	}
}
	
	
