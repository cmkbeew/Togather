package team1.togather.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;import java.util.List;

import static team1.togather.constant.CheckedConstant.SAME_PWD;
import static team1.togather.constant.CheckedConstant.NOTSAME_PWD;
import static team1.togather.constant.CheckedConstant.SAME_EMAIL;
import static team1.togather.constant.CheckedConstant.NOTSAME_EMAIL;
import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import team1.togather.service.MyPageService;
import team1.togather.domain.Category;
import team1.togather.domain.Member;

@Log4j
@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService mypageservice;
	
	
	
	@GetMapping("main")
	public ModelAndView main(HttpServletRequest request) {	
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("m");
		long mnum = member.getMnum();
		Member member1= mypageservice.list(mnum);		
		ModelAndView mv = new ModelAndView("mypage/main","member",member1);
		return mv;		
	}
	
	
	
	@PostMapping("nowpassword")
	@ResponseBody
	public int nowpassword(Member member,HttpSession session) {		
		int nowpassword = mypageservice.nowpassword(member);
		if(nowpassword == SAME_PWD) {
			return 	SAME_PWD;
		}		
		else return	NOTSAME_PWD;
	}
	@GetMapping("updatepassword")
	public String updatepassword(Member member) {
		mypageservice.updatepassword(member);
		return "redirect:main";
	}
	@GetMapping("updateemail")
	public ModelAndView updateemail(Member member,HttpSession session ) {	
		
		Member updatemember = (Member)session.getAttribute("m");	
		updatemember.setEmail(member.getEmail());
		ModelAndView mv = new ModelAndView("mypage/updateemail","member",updatemember);
		System.out.println("member폼 : " + updatemember.getEmail());
		
		return mv;		
		
	}
	@ResponseBody
	@PostMapping("updateemail")
	public ModelAndView updateemail2(Member member,HttpSession session) {
		mypageservice.updateemail(member);
		
		Member updatemember = (Member)session.getAttribute("m");	
		ModelAndView mv = new ModelAndView("mypage/updateemail","member",updatemember);
		
		return mv;		
		
	}
	@PostMapping("emailcheck")
	@ResponseBody
	public int emailcheck(String email,HttpSession session) {		
		int email_check = mypageservice.emailcheck(email);
		System.out.println("email_check : "+ email_check);
		if(email_check == 1) {
			return 	1;
		}		
		else return	0;
	}
	
	@ResponseBody
	@PostMapping("updatemaddrandpfr_loc")
	public int updatemaddrandpfr_loc(Member member, HttpSession session) {
//		
//		mypageservice.updatemaddrandpfr_loc(member);
//		Member updatemaddrandpfr_loc = (Member)session.getAttribute("m");
//		updatemaddrandpfr_loc.setMaddr(member.getMaddr());
//		updatemaddrandpfr_loc.setPfr_loc(member.getPfr_loc());
		
		Member m = (Member)session.getAttribute("m");		
		System.out.println("거주지 " + member.getMaddr());
		System.out.println("선호지 " + member.getPfr_loc());
		System.out.println("처음 로그인 한 세션 거주지2 " + m.getMaddr());
		System.out.println("처음 로그인 한 세션 선호지2 " + m.getPfr_loc());
		
		if(member.getMaddr().equals(m.getMaddr()) && member.getPfr_loc().equals(m.getPfr_loc())){
			return 0;
		}else {
			member.setMnum(m.getMnum());
			mypageservice.updatemaddrandpfr_loc(member);
			m.setMaddr(member.getMaddr());
			m.setPfr_loc(member.getPfr_loc());
			System.out.println("바뀐 m.setMaddr : " + m.getMaddr());
			System.out.println("바뀐 m.setPfr_loc : " + m.getPfr_loc());
			return 1;
		}							
	}
	@GetMapping("updatemaddrandpfr_loc")
	public String updatemaddrandpfr_loc(Member member) {
		mypageservice.updatemaddrandpfr_loc(member);
		return "redirect:main";
	} 
	@GetMapping("categoryform.do")
	public ModelAndView join() {
		List<Category> firstCategory = mypageservice.firstCategory();
		ModelAndView mv = new ModelAndView("mypage/updatecategory","firstCategory",firstCategory);
		return mv;
	}
	@ResponseBody
	@GetMapping("category")
	public List<Category> category(HttpSession session,Category category, long sequence) {
		List<Category> categorys= new ArrayList<>();
		System.out.println("sequence :"+ sequence);
		Member category1 = (Member)session.getAttribute("m");
		System.out.println("categoty " + category1.getMnum());
		if(sequence==2) {
			categorys = mypageservice.secondCategory(category);
		}else if(sequence==3) {
			categorys = mypageservice.thirdCategory(category);
		}
		return categorys;		
	}
	@ResponseBody
	@PostMapping("updatecategory")
	public int updatecategory(Member member, HttpSession session) {
		Member m = (Member)session.getAttribute("m");
		
		System.out.println("관심사1 " + member.getCategory_first());
		System.out.println("관심사2" + member.getCategory_second());
		System.out.println("관심사2" + member.getCategory_third());
		
		System.out.println("바뀐 관심사1 " + m.getCategory_first());
		System.out.println("바뀐 관심사2" + m.getCategory_second());
		System.out.println("바뀐 관심사3" + m.getCategory_third());
		
		/*if(member.getCategory_first().equals(m.getCategory_first()) &&
		   member.getCategory_second().equals(m.getCategory_second()) && 
		   member.getCategory_third().equals(m.getCategory_third())) {
		   return 0;
		}else if (member.getCategory_first().equals(member.getCategory_second())&&
				  member.getCategory_first().equals(member.getCategory_third())&&
			      member.getCategory_second().equals(member.getCategory_third())){
		   return 0;
		} else {*/
		 member.setMnum(m.getMnum());
		 mypageservice.updateCategory(member);
		 if(member.getCategory_first() !=null) {
			 m.setCategory_first(member.getCategory_first());
		 }
		
		 if(member.getCategory_second() !=null) {
			 m.setCategory_second(member.getCategory_second());
		 }
		 if(member.getCategory_third() !=null) {
			 m.setCategory_third(member.getCategory_third());
		 }
		 
		
		System.out.println("바뀐 m.getCategory_first : " + m.getCategory_first());
		System.out.println("바뀐 m.getCategory_second : " + m.getCategory_second());
		System.out.println("바뀐 m.getCategory_third : " + m.getCategory_third());
		
		return 1;
		//}	
	}			
}
