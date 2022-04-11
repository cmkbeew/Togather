package team1.togather.service;

import static team1.togather.constant.CheckedConstant.NO_ID;
import static team1.togather.constant.CheckedConstant.NO_PWD;
import static team1.togather.constant.CheckedConstant.YES_ID_PWD;
import static team1.togather.constant.CheckedConstant.YES_JOIN;
import static team1.togather.constant.CheckedConstant.already;
import static team1.togather.constant.CheckedConstant.already_email;
import static team1.togather.constant.CheckedConstant.already_phone;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import team1.togather.domain.Block;
import team1.togather.domain.Category;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.Message;
import team1.togather.mapper.MemberMapper;
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	@Override
	public int join(Member member) {

		int join = 0;
		int joincheck_phone = joincheck(member.getPhone());
		int joincheck_email = joincheck2(member.getEmail());
		//System.out.println("joincheck: "+joincheck_phone);
		//System.out.println("member.getPhone(): "+member.getPhone());
		//System.out.println("joincheck_email: "+joincheck_email);
		//System.out.println("member.getEmail(): "+member.getEmail());
		if(joincheck_phone==NO_ID && joincheck_email==NO_ID) {//데이터 베이스에 없으면 회원가입성공
			//System.out.println("암호화 전 비밀번호 : "+member.getPwd());
			String encrypted = BCrypt.hashpw(member.getPwd(), BCrypt.gensalt());
			//System.out.println("암호화 후 비밀번호 : "+member.getPwd());
			member.setPwd(encrypted);
			String addr = member.getMaddr();
			member.setMaddr(addr.replaceAll(","," "));
			join = mapper.join(member);
			/*System.out.println(member.getMnum());
			System.out.println("주소 : " +member.getMaddr());
			System.out.println("관심지역 :"+member.getPfr_loc());
			System.out.println("이름 : "+member.getMname());
			System.out.println("성별 : "+member.getGender());
			System.out.println("생일 : "+member.getBirth());
			System.out.println("데이터베이스 들어간 후 비밀번호 : "+member.getPwd());
			System.out.println("이메일 : " +member.getEmail());
			System.out.println("폰번호 : " +member.getPhone());
			System.out.println("카테고리 : " +member.getCategory());
			System.out.println("이건뭐임 : " +member.getAthur());*/
			System.out.println("주소 : " +member.getMaddr());
			join = YES_JOIN;
		}else if(joincheck_phone==already){
			join =already_phone;
			//System.out.println("폰같을때");
		}else if(joincheck_email==already) {
			join=already_email;
			//System.out.println("이메일같을때");
		}
		return join;
	}
	@Override
	public int joincheck(String phone) {
		int joincheck_phone = mapper.joincheck(phone);
		return joincheck_phone;
	}
	@Override
	public int joincheck2(String email) {
		int joincheck_email = mapper.joincheck2(email);
		return joincheck_email;
	}
	@Override
	public int logincheck(Member member) {
		Member m = mapper.logincheck(member);
		if(m==null) {//아이디없음
			return NO_ID;
		}else if(!BCrypt.checkpw(member.getPwd(), m.getPwd())) {//비번다를때
			return NO_PWD;
		}else {//로그인성공
			return YES_ID_PWD;
		}
	}
	@Override
	public Member login(Member member) {
		Member m = mapper.logincheck(member);
		return m;
	}
	@Override
	public int kakaologincheck(Member member) {
		int kakaologincheck = mapper.kakaologincheck(member);
		if(kakaologincheck==1) {
			kakaologincheck=YES_ID_PWD;
		}
		return kakaologincheck;
	}
	@Override
	public Member kakaologin(Member member) {
		Member m = mapper.kakaologin(member);
		return m;
	}
	@Override
	public long memberCount() {

		return mapper.memberCount();
	}
	@Override
	public Member memberInfo(MemInGroup meminGroup) {

		return mapper.memberInfo(meminGroup);
	}
	@Override
	public void blocking(Block block) {
		mapper.blocking(block);

	}
	@Override
	public List<String> blockedNameList(HttpSession session) {
		Member m = (Member) session.getAttribute("m");
		long sessionMnum = m.getMnum();
		List<String> blockedNameList = mapper.blockedNameList(sessionMnum);//여러명
		return blockedNameList;
	}
	@Override
	public void blockingCancel(Block block) {
		mapper.blockingCancel(block);

	}

	//////////////////////////////////////메세지
	@Override
	public void sendMessage(Message message) {
		mapper.sendMessage(message);

	}
	@Override
	public Long messageViewCheck(long mnum) {
		return mapper.messageViewCheck(mnum);
	}
	@Override
	public void viewChecked(long mnum) {
		mapper.viewChecked(mnum);

	}
	@Override
	public List<Message> messageList(Map<String,Object> map) {

		return mapper.messageList(map);
	}
	@Override
	public Message messageContent(long meseq) {
		return mapper.messageContent(meseq);
	}
	@Override
	public void replyToMessage(Message message) {
		mapper.replyToMessage(message);

	}
	@Override
	public void messageChecked(long meseq) {
		mapper.messageChecked(meseq);

	}
	//////////////////////////////////////회원가입 카테고리
	@Override
	public List<Category> firstCategory() {
		return mapper.firstCategory();
	}
	@Override
	public List<Category> secondCategory(Category category) {
		return mapper.secondCategory(category);
	}
	@Override
	public List<Category> thirdCategory(Category category) {
		return mapper.thirdCategory(category);
	}
	@Override
	public Integer messageCount(long mnum) {
		return mapper.messageCount(mnum);
	}
	@Override
	public void messageDelete(long meseq) {
		mapper.messageDelete(meseq);

	}
	@Override
	public Long nextPostMessage(Message message) {
		return mapper.nextPostMessage(message);
	}
	@Override
	public Long previousMessage(Message message) {
		return mapper.previousMessage(message);
	}
	@Override
	public String getMnameByMnum(Long mnum) {
		return mapper.getMnameByMnum(mnum);
	}

}
