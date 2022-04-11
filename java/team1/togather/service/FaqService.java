package team1.togather.service;

import java.util.List;
import java.util.Map;

import team1.togather.domain.Faq;
import team1.togather.domain.FaqVo;

public interface FaqService {
	//FAQ 리스트
	List<Faq> listPageS(int page);
	List<Faq> selectPerPageS(FaqVo faqVo);
	int selectCountS();
	
	void insertS(Faq faq);
	void deleteS(long fseq);
	Faq selectBySeqS(long fseq);
	void updateS(Faq faq);
	
	//검색
	List<Faq> selectBySearchS(Map map);
}
