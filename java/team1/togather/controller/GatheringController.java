package team1.togather.controller;

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
import lombok.extern.log4j.Log4j;
import team1.togather.domain.Gathering;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGathering;
import team1.togather.domain.Member;
import team1.togather.service.GatheringService;
import team1.togather.service.GroupTabService;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("gathering")
public class GatheringController {
	@Autowired
	private GatheringService gatheringService;
	private GroupTabService groupTabService;
	
	@GetMapping("gatheringInfo.do") //정모 디테일
	public ModelAndView gatheringInfo(long ga_seq, MemInGathering memInGathering) {
		Gathering gatheringInfo = gatheringService.ga_selectByGaSeqS(ga_seq);
		Long gatheringMemberCount = gatheringService.gatheringMemberCount(ga_seq);
		Member gatheringCreateName = gatheringService.gatheringCreaterName(ga_seq);
		Long memInGatheringCheck = gatheringService.memInGatheringCheck(memInGathering);
		List<Map<String, String>> memInGatheringName = gatheringService.memInGatheringName(memInGathering);
//		Member user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		log.info("==================================");
//		log.info("@ChatController, GET Chat / Username : " + user.getMname());
		ModelAndView mv = new ModelAndView("gathering/gatheringInfo", "gatheringInfo", gatheringInfo);
		mv.addObject("gatheringMemberCount", gatheringMemberCount); //정모 참여인원 카운트
		mv.addObject("gatheringCreateName", gatheringCreateName); //정모 만든사람 이름 
		mv.addObject("memInGatheringName", memInGatheringName); //정모 참여자들 이름
		mv.addObject("memInGatheringCheck", memInGatheringCheck); //정모 참여 여부 판단
//		mv.addObject("user", user);
		return mv;
	}
	@GetMapping("gatheringCreate.do") //정모만들기 페이지로 이동
	public ModelAndView gatheringCreate(long gseq, HttpSession session) {
		GroupTab groupInfo = groupTabService.selectByGSeqS(gseq);
		Member m = (Member)session.getAttribute("m");
		ModelAndView mv = new ModelAndView("gathering/gatheringCreate", "gseq", gseq);
		mv.addObject("groupInfo", groupInfo);
		mv.addObject("m", m);
	    return mv;
	}
	@PostMapping("gatheringCreate.do") //정모 만들기 값 포스트
	public String gatheringCreate(Gathering gathering, HttpSession session) {
		gatheringService.ga_insertS(gathering);
		Gathering g = gatheringService.insertGatheringInfo(gathering); //max(ga_seq) gathering 정보
		GroupTab groupInfo = groupTabService.selectByGSeqS(gathering.getGseq());
		Member m = (Member)session.getAttribute("m");
		return "redirect:../gathering/gatheringInfo.do?ga_seq=" + g.getGa_seq() +"&mnum="+m.getMnum();
	}
	@PostMapping("gatheringDeleteCheck")
	@ResponseBody
	public Long gatheringDeleteCheck(MemInGathering memInGathering) {
		Long grade = gatheringService.grade(memInGathering);
		if(grade == null) {
			grade=(long)3;
			return grade;
		}else {
			return grade;
		}
	}
	
	@GetMapping("gatheringDelete.do") //정모삭제
	public String gatheringDelete(long ga_seq, long gseq, long mnum) {
		gatheringService.memInGatheringDelete(ga_seq);
		gatheringService.ga_deleteS(ga_seq);
		return "redirect:../groupTab/groupInfo.do?gseq="+gseq+"&mnum="+mnum;
	}
	
	@PostMapping("gatheringUpdateCheck")
	@ResponseBody
	public Long gatheringUpdateCheck(MemInGathering memInGathering) {
		Long grade = gatheringService.grade(memInGathering);
		if(grade == null) {
			grade = (long) 3;
			return grade;
		}else {
			return grade;
		}
	}
	
	@GetMapping("gatheringUpdate.do")
	public ModelAndView gatheringUpdate(long ga_seq) {
		Gathering updateList = gatheringService.ga_selectByGaSeqS(ga_seq);
		ModelAndView mv = new ModelAndView("gathering/gatheringUpdate", "updateList", updateList);
		return mv;
	}
	
	@PostMapping("gatheringUpdate.do")
	public String gatheringUpdate(Gathering gathering, long mnum) {
		long ga_seq = gathering.getGa_seq();
		gatheringService.ga_updateS(gathering);
		return "redirect:gatheringInfo.do?ga_seq="+ga_seq+"&mnum="+mnum;
	}
	
	@PostMapping("memInGathering")
	@ResponseBody
	public String memInGathering(MemInGathering memInGathering, HttpSession session) {
		gatheringService.memInGathering(memInGathering);
		return "ok";
	}
	
	@PostMapping("gatheringQuit")
	@ResponseBody
	public String gatheringQuit(MemInGathering memInGathering, long ga_seq) {
		List<Map<String, String>> memInGatheringName = gatheringService.memInGatheringName(memInGathering);
		gatheringService.gatheringQuit(memInGathering);
		Long gatheringMemeberCount = gatheringService.gatheringMemberCount(ga_seq);
		String result="";
		if(gatheringMemeberCount==0) {
			gatheringService.memInGatheringDelete(ga_seq);
			gatheringService.ga_deleteS(ga_seq);
			result="0";
		}else {
			result="1";
		}
		return result;
	}
	
	@GetMapping("gatheringSearchMap.do")
	public String gatheringSearchMap() {
		return "gathering/searchMap";
	}
	
	@GetMapping("time.do")
	public String time() {
		return "gathering/time";
	}
	
//	private long getGaSeq(HttpServletRequest request) {
//		long ga_seq = -1;
//		String ga_seqStr = request.getParameter("ga_seq");
//		if(ga_seqStr != null) {
//			ga_seqStr = ga_seqStr.trim();
//			if(ga_seqStr.length() != 0) {
//				try {
//					ga_seq = Long.parseLong(ga_seqStr);
//					return ga_seq;
//				}catch(NumberFormatException nfe) {}
//			}
//		}
//		return ga_seq;
//	}
//	
	
}
