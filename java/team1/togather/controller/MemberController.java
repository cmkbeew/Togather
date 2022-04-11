package team1.togather.controller;

import static team1.togather.constant.CheckedConstant.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.Block;
import team1.togather.domain.Category;
import team1.togather.domain.IndexCriteria;
import team1.togather.domain.IndexPage;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.Message;
import team1.togather.service.GroupTabService;
import team1.togather.service.MemberService;



@Controller
@AllArgsConstructor
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private GroupTabService groupTabService;
	@GetMapping("/joinform.do")
	public ModelAndView join() {
		List<Category> firstCategory = service.firstCategory();
		ModelAndView mv = new ModelAndView("member/join","firstCategory",firstCategory);
		return mv;
	}

	@GetMapping("/category")
	@ResponseBody
	public List<Category> category(Category category,long sequence) {
		List<Category> categorys= new ArrayList<>();
		if(sequence==2) {
			categorys = service.secondCategory(category);
		}else if(sequence==3) {
			categorys = service.thirdCategory(category);
		}

		return categorys;
	}


	@RequestMapping("/join")
	@ResponseBody
	public int join(Member member,HttpSession session,String category_first,String category_second,String category_third) {
		int join = service.join(member);
		if(join==YES_JOIN) {
			Member m = service.login(member);
			session.setAttribute("m", m);
		}
		return join;
	}

	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}

	@GetMapping("/memberInfo")
	public ModelAndView memberInfo(MemInGroup memInGroup,HttpSession session) {
		Member memberInfo = service.memberInfo(memInGroup);
		long gseq=memInGroup.getGseq();
		List<String> blockedNameList = service.blockedNameList(session);
		String blockedCheck="";
		if(blockedNameList.size()!=0) {
			for(int i =0;i<blockedNameList.size();i++) {
				if(blockedNameList.get(i).equals(memberInfo.getMname())) {
					blockedCheck="차단한 회원입니다";
				}
			}
		}
		Member m = (Member)session.getAttribute("m");
		memInGroup.setMnum(m.getMnum());
		Long grade = groupTabService.grade(memInGroup);
		ModelAndView mv = new ModelAndView("/member/memberInfo", "memberInfo", memberInfo);
		mv.addObject("blockedCheck", blockedCheck);
		mv.addObject("gseq", gseq);
		mv.addObject("grade", grade);
		return mv;
	}



	@PostMapping("/blocking")
	@ResponseBody
	public int blocking(Block block) {
		service.blocking(block);
		return 1;
	}
	@PostMapping("/blockingCancel")
	@ResponseBody
	public int blockingCancel(Block block) {
		service.blockingCancel(block);
		return 1;
	}
	@PostMapping("/login")
	@ResponseBody
	public int logincheck(Member member,HttpSession session) {
		int logincheck = service.logincheck(member);
		if(logincheck==YES_ID_PWD) {
			Member m = service.login(member);
			session.setAttribute("m", m);
		}
		return logincheck;
	}
	@PostMapping("/kakaologin")
	@ResponseBody
	public int kakaologincheck(Member member,HttpSession session) {
		int kakaologincheck = service.kakaologincheck(member);
		if(kakaologincheck==YES_ID_PWD) {
			Member m = service.kakaologin(member);
			session.setAttribute("m", m);
			System.out.println("카카오로그인 m: "+m);
		}
		return  kakaologincheck;
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	/////////////////////////
	@GetMapping("/sendMessageForm")
	public ModelAndView sendMessageForm(Message message,long gseq) {
		ModelAndView mv = new ModelAndView("member/sendMessageForm", "message", message);
		mv.addObject("gseq", gseq);
		return mv;
	}

	@PostMapping("/sendMessage")
	public String sendMessage(Message message,long gseq) {
		service.sendMessage(message);
		String memberInfoBack="";
		memberInfoBack+="redirect:memberInfo?mnum="+message.getFrom_mnum()+"&gseq="+gseq;
		return memberInfoBack;
	}

	@GetMapping("/messageList")
	public ModelAndView messageList(HttpSession session,IndexCriteria cri,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		Member m = (Member)session.getAttribute("m");
		map.put("mnum",m.getMnum());
		map.put("startRow",cri.getStartRow());
		map.put("endRow",cri.getEndRow());
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			cri.setPage(Integer.parseInt(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			cri.setPageSize(Integer.parseInt(pageSize));
		}
		IndexPage pm = new IndexPage();
		pm.setCri(cri);
		pm.setTotalCount(service.messageCount(m.getMnum())); //calcDate()실행

		mv.addObject("pm", pm);
		mv.addObject("cri", cri);
		List<Message> messageList = service.messageList(map);
		mv.addObject("messageList", messageList);
		return mv;
	}

	@GetMapping("/messageContent")
	public ModelAndView messageContent(long meseq,IndexCriteria cri,HttpServletRequest request) {
		Message messageContent = service.messageContent(meseq);
		service.messageChecked(meseq);
		ModelAndView mv = new ModelAndView("member/messageContent", "messageContent", messageContent);
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			mv.addObject("page", pageAt);
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			mv.addObject("pageSize", pageSize);
		}
		return mv;
	}

	@PostMapping("/replyToMessage")
	public String replyToMessage(Message message,IndexCriteria cri,HttpServletRequest request) {
		service.replyToMessage(message);
		String pageAt="";
		String pageSize="";
		if(request.getParameter("page")!=null) {
			pageAt = request.getParameter("page");
		}
		if(request.getParameter("pageSize")!=null) {
			pageSize = request.getParameter("pageSize");
		}
		return "redirect:messageContent?mnum="+message.getTo_mnum()+"&page="+pageAt+"&pageSize="+pageSize+"&meseq="+message.getMeseq();
	}

	@GetMapping("/messageDelete")
	public String messageDelete(long meseq,long mnum,IndexCriteria cri,HttpServletRequest request) {
		service.messageDelete(meseq);
		String pageAt="";
		String pageSize="";
		if(request.getParameter("page")!=null) {
			pageAt = request.getParameter("page");
		}
		if(request.getParameter("pageSize")!=null) {
			pageSize = request.getParameter("pageSize");
		}
		return "redirect:messageList?mnum="+mnum+"&page="+pageAt+"&pageSize="+pageSize;
	}

	@PostMapping("/nextMessageCheck")
	@ResponseBody
	public Long nextMessageCheck(Message message) {
		Long nextMeseq = service.nextPostMessage(message);
		return nextMeseq;

	}

	@PostMapping("/previousMessage")
	@ResponseBody
	public Long previousMessage(Message message) {
		Long nextMeseq = service.previousMessage(message);
		return nextMeseq;
	}
}