package team1.togather.service;

import java.util.List;

import team1.togather.domain.BoardCriteria;
import team1.togather.domain.Member;
import team1.togather.domain.QandA;
import team1.togather.domain.QaReply;

public interface QandA_Service {
	public List<QandA> listCri(BoardCriteria cri); // 페이징처리(cri객체사용)
	public Integer pageCount(); //db테이블 모든글 개수 계산 후 리턴
	QandA pwdQA(QandA qanda);//비밀글 들어가기
	Long upDateCheck(QandA qanda);//수정권한체크
	void update(QandA qanda);//수정하기
	void delete(QandA qanda);//qanda 삭제
	void views(QandA qanda);//조회수
	void qaReply(QaReply qaReply);//리플 작성
	Long qreplyCount(QandA qanda);//리플 갯수
	Long nextPost(long qseq);//content에서 다음글 
	Long nextPostUser(long qseq);//content에서 다음글유저
	Long previousPost(long qseq);//content에서 이전
	Long previousPostUser(long qseq);//content에서 유저 이전
	
	List<QandA> QAlist();
	QandA qaContent(QandA qanda);
	List<QaReply> qreplyList(QandA qanda);//qna 댓글 리스트
	List<Member> qaNameList();//qna 작성자 목록
	void qaCreate(QandA qanda);//qna 작성
	QandA createqaInfo(QandA qanda);//qna만들고 그 작성글로 이동하는
	
	
}

