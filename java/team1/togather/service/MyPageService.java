package team1.togather.service;


import java.util.List;

import team1.togather.domain.Category;
import team1.togather.domain.Member;
public interface MyPageService {
	
	Member list(long mnum);
	Member nowpasswordcheck(Member member);
	int nowpassword(Member member); // 비밀번호있는지 확인 
	void updatepassword(Member member);
	
	void updateemail(Member member); // 이메일 업데이트
	int emailcheck(String email); //중복체크
	void updatemaddrandpfr_loc(Member member); // 주소지 선호지 업데이트
	
	List<Category> firstCategory();//첫번째 카테고리
	List<Category> secondCategory(Category category);//두번쨰카테고리
	List<Category> thirdCategory(Category category);//세번쨰카테고리
	void updateCategory(Member member); // 카테고리 업데이트
}
