package team1.togather.service;

import java.util.List;

import team1.togather.domain.Faq;

public interface FaqService {
	List<Faq> listS();
	void insertS(Faq faq);
	Faq selectBySeqS(long fseq);
	void deleteS(long fseq);
	void updateS(Faq faq);
}
