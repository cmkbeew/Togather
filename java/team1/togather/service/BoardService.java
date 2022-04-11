package team1.togather.service;

import java.util.List;
import java.util.Map;

import team1.togather.domain.Board;
import team1.togather.domain.BoardCriteria;

public interface BoardService {
	public List<Board> listPage(int page);
	public List<Board> listCri(BoardCriteria cri); //페이징 처리된 글목록
	public int pageCount();
	
	void insert(Board board);
	Board getBoardContent(Long bnum);
	void delete(Long bnum);
	void update(Board board);
	public List<Board> getBoardBySearch(Map map);
	void updateBView(Long bnum);
}
