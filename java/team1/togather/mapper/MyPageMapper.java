package team1.togather.mapper;


import java.util.List;

import team1.togather.domain.Category;
import team1.togather.domain.Member;
public interface MyPageMapper {

	Member list(long mnum);
	Member nowpasswordcheck(Member member); // 비밀번호 확인
	void updatepassword(Member member); //
	int emailcheck(String email); // 이메일체크
	void updateemail(Member member); // 이메일 가입
	void updatemaddrandpfr_loc(Member member); // 주소지 선호지 업데이트
	List<Category> firstCategory();//첫번째 카테고리
	List<Category> secondCategory(Category category);//두번쨰카테고리
	List<Category> thirdCategory(Category category);//세번쨰카테고리
	
	void updateCategory(Member member); // 카테고리 업데이트
}
