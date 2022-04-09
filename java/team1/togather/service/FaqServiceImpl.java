package team1.togather.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import team1.togather.domain.Faq;
import team1.togather.domain.FaqVo;
import team1.togather.mapper.FaqMapper;

@Service
@AllArgsConstructor
public class FaqServiceImpl implements FaqService {
	private FaqMapper faqMapper;
	
	@Override
	public List<Faq> listPageS(int page){
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1)*10;
		return faqMapper.listPage(page);
	}
	
	@Override
	public List<Faq> selectPerPageS(FaqVo faqVo){
		return faqMapper.selectPerPage(faqVo);
	}
	
	@Override
	public int selectCountS() {
		return faqMapper.selectCount();
	}

	@Override
	public void insertS(Faq faq) {
		faqMapper.insert(faq);
	} 

	@Override
	public void deleteS(long fseq) {
		faqMapper.delete(fseq);
	}
	
	@Override
	public Faq selectBySeqS(long fseq) {
		return faqMapper.selectBySeq(fseq);
	}
	
	@Override
	public void updateS(Faq faq) {
		faqMapper.update(faq);
	}
	
	@Override
	public List<Faq> selectBySearchS(Map map){
		return faqMapper.selectBySearch(map);
	}

}
