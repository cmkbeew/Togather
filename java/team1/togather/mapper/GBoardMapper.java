package team1.togather.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import team1.togather.domain.GBoardCriteria;
import team1.togather.domain.GBoard;

public interface GBoardMapper {
	ArrayList<GBoard> gblist();
	ArrayList<GBoard> gblist(int pageAt, int ps);
	ArrayList<GBoard> gblist(String option, String ocontent);
	
	GBoard selectgbnum(long gbnum);
	
	void gbinsert(GBoard gboard);
	void gbupdate(GBoard gboard);
	void gbdelete(long gbnum);
	
	
	public List<GBoard> gblistPageCri(GBoardCriteria cri); 
	public Integer gbpageCount(long gseq); 
	public List<GBoard> getGBoardBySearch(Map map);
	
	GBoard selectgseq(long gseq);
	
	public void updateGBView(Long gbnum);
}
