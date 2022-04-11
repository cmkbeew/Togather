package team1.togather.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.BoardCriteria;
import team1.togather.domain.Member;
import team1.togather.domain.QaReply;
import team1.togather.domain.QandA;
import team1.togather.mapper.QandA_Mapper;

@Service
public class QandA_ServiceImpl implements QandA_Service {
	@Autowired
	private QandA_Mapper mapper;
	@Override
	public List<QandA> QAlist() {
		return mapper.QAlist();
	}
	@Override
	public QandA qaContent(QandA qanda) {
		
		return mapper.qaContent(qanda);
	}
	@Override
	public List<QaReply> qreplyList(QandA qanda) {
		return mapper.qreplyList(qanda);
	}
	@Override
	public List<Member> qaNameList() {
		// TODO Auto-generated method stub
		return mapper.qaNameList();
	}
	@Override
	public void qaCreate(QandA qanda) {
		mapper.qaCreate(qanda);
		
	}
	@Override
	public QandA createqaInfo(QandA qanda) {
		return mapper.createqaInfo(qanda);
	}
	@Override
	public List<QandA> listCri(BoardCriteria cri) {
		return mapper.listPageCri(cri);
	}
	@Override
	public Integer pageCount() {	
		return mapper.pageCount();
	}
	@Override
	public QandA pwdQA(QandA qanda) {
		
		return mapper.pwdQA(qanda);
	}
	@Override
	public Long upDateCheck(QandA qanda) {
		
		return mapper.upDateCheck(qanda);
	}
	@Override
	public void update(QandA qanda) {
		mapper.update(qanda);
		
	}
	@Override
	public void delete(QandA qanda) {
		mapper.delete(qanda);
		
	}
	@Override
	public void views(QandA qanda) {
		mapper.views(qanda);
		
	}
	@Override
	public void qaReply(QaReply qaReply) {
		mapper.qaReply(qaReply);
		
	}
	@Override
	public Long qreplyCount(QandA qanda) {
		return mapper.qreplyCount(qanda);
		
	}
	@Override
	public Long nextPost(long qseq) {
		return mapper.nextPost(qseq);
	}
	@Override
	public Long nextPostUser(long qseq) {
		return mapper.nextPostUser(qseq);
	}
	@Override
	public Long previousPost(long qseq) {
		return mapper.previousPost(qseq);
	}
	@Override
	public Long previousPostUser(long qseq) {	
		return mapper.previousPostUser(qseq);
	}

}
