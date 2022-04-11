package team1.togather.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import team1.togather.domain.Board;
import team1.togather.domain.BoardCriteria;

public interface BoardMapper {
	ArrayList<Board> blist();
	ArrayList<String> getCategory();
	ArrayList<Board> blist(int pageAt, int ps);
	ArrayList<Board> blist(String option, String ocontent);
	String getNameByMnum(long mnum);
	Board getBoardContent(Long bnum);
	ArrayList<Board> Rlist();
	void insert(Board board);
	void delete(Long bnum);
	void update(Board board);
	//조회수
	public void updateBView(Long bnum);

	//페이징
	public List<Board> listPage(Integer page); //특정페이지 글정보확인
	public List<Board> listPageCri(BoardCriteria cri); // 페이징처리(cri객체사용)
	public Integer pageCount(); //db테이블 모든글 개수 계산 후 리턴
	public List<Board> getBoardBySearch(Map map);

	
}
