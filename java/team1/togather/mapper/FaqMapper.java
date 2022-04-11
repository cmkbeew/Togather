package team1.togather.mapper;

import java.util.List;

import team1.togather.domain.Faq;

public interface FaqMapper {
	List<Faq> list();
	void insert(Faq faq);
	Faq selectBySeq(long fseq);
	void delete(long fseq);
	void update(Faq faq);
}
