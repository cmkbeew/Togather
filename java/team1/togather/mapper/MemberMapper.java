package team1.togather.mapper;

import java.util.List;
import java.util.Map;

import team1.togather.domain.Block;
import team1.togather.domain.Category;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.Message;

public interface MemberMapper {
	int join(Member member);
	int joincheck(String phone);
	int joincheck2(String email);
	Member logincheck(Member member);
	int kakaologincheck(Member member);
	Member kakaologin(Member member);
	long memberCount();
	Member memberInfo(MemInGroup meminGroup);
	void blocking(Block block);
	List<String> blockedNameList(long mnum);
	void blockingCancel(Block block);
	void sendMessage(Message message);//메세지 보내기
	Long messageViewCheck(long mnum);//메세지 알림
	void viewChecked(long mnum);//메세지 알림끄기
	void messageChecked(long meseq);//확인한 메세지만 알림끄기
	List<Message> messageList(Map<String,Object> map);//본인 메세지함 리스트
	Message messageContent(long meseq);//메세지 내용
	Integer messageCount(long mnum);//메세지 총갯수
	void replyToMessage(Message message);//답변하기
	void messageDelete(long meseq);//삭제하기
	Long nextPostMessage(Message message);//다음글
	Long previousMessage(Message message);//이전글
	List<Category> firstCategory();//첫번째 카테고리
	List<Category> secondCategory(Category category);//두번쨰카테고리
	List<Category> thirdCategory(Category category);//세번쨰카테고리

	String getMnameByMnum(Long mnum);
}

