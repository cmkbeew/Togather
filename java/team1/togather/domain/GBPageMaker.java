package team1.togather.domain;

public class GBPageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private GBoardCriteria cri;
	
	private int displayPageNum = 10;

	public GBPageMaker() {}
	public GBPageMaker(int totalCount, int startPage, int endPage, boolean prev, boolean next, GBoardCriteria cri,
			int displayPageNum) {
		super();
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.cri = cri;
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) { //변경
		this.totalCount = totalCount;
		calcDate();
	}
	
	private void calcDate() {
		endPage = (int) (Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) +1;
		int tempEndPage = (int) (Math.ceil(totalCount/(double)cri.getPageSize()));
		if(endPage > tempEndPage) endPage = tempEndPage;
		prev = (cri.getPage() == 1? false:true);
		next = (endPage == cri.getPage()? false:true);
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

	public GBoardCriteria getCri() {
		return cri;
	}

	public void setCri(GBoardCriteria cri) { //변경
		this.cri = cri;
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
				+ prev + ", next=" + next + ", cri=" + cri + ", displayPageNum=" + displayPageNum + "]";
	}
}
