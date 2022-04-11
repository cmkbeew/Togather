package team1.togather.mapper;

import java.util.List;
import java.util.Map;

import team1.togather.domain.Faq;
import team1.togather.domain.FaqVo;

public interface FaqMapper {
	List<Faq> listPage(Integer page);
	List<Faq> selectPerPage(FaqVo faqVo);
	Integer selectCount();
	
	void insert(Faq faq);
	void delete(long fseq);
	
	Faq selectBySeq(long fseq);
	void update(Faq faq);
	
	//검색
	List<Faq> selectBySearch(Map map);
}
