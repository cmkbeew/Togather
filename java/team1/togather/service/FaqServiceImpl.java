package team1.togather.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.Faq;
import team1.togather.mapper.FaqMapper;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqMapper faqMapper;

	@Override
	public List<Faq> listS() {
		return faqMapper.list();
	}

	@Override
	public void insertS(Faq faq) {
		faqMapper.insert(faq);
	}

	@Override
	public Faq selectBySeqS(long fseq) {
		return faqMapper.selectBySeq(fseq);
	}

	@Override
	public void deleteS(long fseq) {
		faqMapper.delete(fseq);
	}

	@Override
	public void updateS(Faq faq) {
		faqMapper.update(faq);
	}

}
