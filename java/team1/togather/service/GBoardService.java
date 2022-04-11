package team1.togather.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import team1.togather.domain.GBoardCriteria;
import team1.togather.domain.GBoard;

public interface GBoardService {

	public List<GBoard> gblistCri(GBoardCriteria cri); 
	public int gbpageCount(long gseq);
	
	GBoard getGBoard(long gbnum);
	
	void gbwrite(GBoard gboard, MultipartFile files);
	void gbedit(GBoard gboard);
	void gbremove(long gbnum);
	
	public List<GBoard> getGBoardBySearch(Map map);
	
	GBoard getGseq(long gseq);
	
	void updateGBView(Long gbnum);
}
