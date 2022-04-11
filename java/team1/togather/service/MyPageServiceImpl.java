package team1.togather.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import static team1.togather.constant.CheckedConstant.SAME_PWD;

import java.util.List;

import static team1.togather.constant.CheckedConstant.NOTSAME_PWD;
import static team1.togather.constant.CheckedConstant.SAME_EMAIL;
import static team1.togather.constant.CheckedConstant.NOTSAME_EMAIL;

import team1.togather.domain.Category;
import team1.togather.domain.Member;
import team1.togather.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {

	
	@Autowired
	private MyPageMapper mypagemapper;

	@Override
	public Member list(long mnum) {
		return mypagemapper.list(mnum);
	}

	@Override	// 현재 비밀번호 맞으면 0 틀리면 1
	public int nowpassword(Member member) {
		Member m = mypagemapper.nowpasswordcheck(member);
		if(BCrypt.checkpw(member.getPwd(), m.getPwd()))
			return SAME_PWD;
		else {
			return NOTSAME_PWD;
		}
	}

	@Override // 업데이트
	public void updatepassword(Member member) {
		String encrypted = BCrypt.hashpw(member.getPwd(), BCrypt.gensalt());
		member.setPwd(encrypted);
		mypagemapper.updatepassword(member);				
	}
	
	@Override
	public Member nowpasswordcheck(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int emailcheck(String email) {
		int email_check = mypagemapper.emailcheck(email);
		return email_check;
		//db 에 있는거랑 비교 있으면 카운트 1 올라감
	}

	@Override
	public void updateemail(Member member) {
		mypagemapper.updateemail(member);		
	}

	@Override
	public void updatemaddrandpfr_loc(Member member) {
		
		mypagemapper.updatemaddrandpfr_loc(member);
		
	}
	@Override
	public List<Category> firstCategory() {
		return mypagemapper.firstCategory();
	}
	@Override
	public List<Category> secondCategory(Category category) {
		return mypagemapper.secondCategory(category);
	}
	@Override
	public List<Category> thirdCategory(Category category) {
		return mypagemapper.thirdCategory(category);
	}

	@Override
	public void updateCategory(Member member) {
		mypagemapper.updateCategory(member);		
	}
	

}
