package team1.togather.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import team1.togather.domain.Category;
import team1.togather.domain.Gathering;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.fileset.Path;
import team1.togather.service.GatheringService;
import team1.togather.service.GroupTabService;
import team1.togather.service.MemberService;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("groupTab")
public class GroupTabController {
	@Autowired
	private GroupTabService groupTabService;
	@Autowired
	private GatheringService gatheringService;
	@Autowired
	private MemberService memberService;


	@GetMapping("myGroup.do")
	public ModelAndView myGroup(MemInGroup memInGroup) {
		List<GroupTab> list = groupTabService.myGroup(memInGroup);
		List<Long> groupMemberCount = new ArrayList<>();
		for(int i =0;i<list.size();i++) {
			groupMemberCount.add(groupTabService.groupMemberCount(list.get(i).getGseq()));
		}
		List<String> namelist = groupTabService.selectAllname(memInGroup.getMnum());
		ModelAndView mv = new ModelAndView("groupTab/myGroup", "list", list);
		mv.addObject("groupMemberCount", groupMemberCount);
		mv.addObject("namelist", namelist);
		return mv;
	}
	@GetMapping("groupInfo.do")
	public ModelAndView groupInfo(long gseq,MemInGroup memInGroup,HttpSession session) throws ParseException {
		System.out.println("gseq: "+gseq);
		GroupTab groupInfo = groupTabService.selectByGSeqS(gseq);
		Long groupMemberCount = groupTabService.groupMemberCount(gseq);
		Member groupMemberName = groupTabService.groupInfoMemberName(gseq);
		List<Map<String,String>> memInGroupName = groupTabService.memInGroupName(memInGroup);
		Long memInGroupCheck = groupTabService.memInGroupCheck(memInGroup);
		List<Gathering> gatheringList = gatheringService.ga_selectByGseqS(gseq); //정모 목록 가져오기 (대현추가)
		Long gatheringCountInGroup = groupTabService.gatheringCountInGroup(gseq);
		
		ModelAndView mv = new ModelAndView("groupTab/groupInfo", "groupInfo", groupInfo);
		mv.addObject("groupMemberCount", groupMemberCount);
		mv.addObject("groupMemberName", groupMemberName);
		mv.addObject("memInGroupCheck",memInGroupCheck);
		mv.addObject("memInGroupName",memInGroupName);
		mv.addObject("gatheringList", gatheringList);//정모 목록 가져오기 (대현추가)
		mv.addObject("gatheringCountInGroup", gatheringCountInGroup);//모임info 정모갯수(대현추가)
		
		Member m = (Member)session.getAttribute("m");
		HashMap<String,Object> map = new HashMap<>();
		map.put("mnum",m.getMnum());
		map.put("gseq",groupInfo.getGseq());
		//System.out.println("map: "+map);
		List<HashMap<String,Object>> endTime = groupTabService.endTime(map);
		System.out.println("endTime: "+endTime);

		List<String> gatheringDate = new ArrayList<>();
		List<String> gatheringTime = new ArrayList<>();
		//List<String> ddate2 = new ArrayList<>();
		List<Gathering> endTimeGathering = new ArrayList<>();
		if(endTime.size()!=0) {
			for(int i =0;i<endTime.size();i++) {
				gatheringDate.add((String)endTime.get(i).get("GA_DATE"));
				gatheringTime.add((String)endTime.get(i).get("TIME"));
			}
			String todayfm = new SimpleDateFormat("yyyy-MM-dd HH:mm:00").format(new Date(System.currentTimeMillis()));
			System.out.println("todayfm : "+todayfm);
			//yyyy-MM-dd 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
			System.out.println("gatheringDate: "+gatheringDate);
			for(int i=0;i<gatheringDate.size();i++) {
				String dday=gatheringDate.get(i);
				String ttime = gatheringTime.get(i);
				System.out.println("ttime: "+ttime);
				dday+= " "+ttime+":00";
				System.out.println("dday: "+dday);
				//비교할 date와 today를데이터 포맷으로 변경
				Date date = new Date(dateFormat.parse(dday).getTime()); 
				Date today = new Date(dateFormat.parse(todayfm).getTime()); 
				System.out.println("date: "+date);
				System.out.println("today: "+today);
				//compareTo메서드를 통한 날짜비교
				int compare = date.compareTo(today); 
				System.out.println("compare:"+compare);
				int index=dday.indexOf(" ");
				dday = dday.substring(0, index);
				System.out.println("서브스트링후 디데이: "+dday);
				//조건문
				if( 0<=compare) {
					//ddate2.add(dday);
					endTimeGathering=groupTabService.endTimeGathring(dday);
					System.out.println("date가 today보다 큽니다.(date > today)");
				}else if(compare < 0) {
					groupTabService.gatheringDelete(dday);
				  System.out.println("today가 date보다 큽니다.(date < today)");
				}/*else {
					//ddate2.add(dday);
					endTimeGathering=groupTabService.endTimeGathring(dday);
				  System.out.println("today와 date가 같습니다.(date = today)");
				  break;
				}*/
			} 
			//System.out.println("name2: "+endTimeGathering.get(0).getGa_date().toString());
			if(endTimeGathering.size()!=0) {
				String memberName = groupTabService.endTimeName(endTimeGathering.get(0).getGseq());
				System.out.println("endTimeGathering: "+endTimeGathering.get(0));
				mv.addObject("endTimeGathering", endTimeGathering.get(0));
				mv.addObject("name", memberName);
				System.out.println("memberName: "+memberName);
			}		
		}
		return mv;
	}
	@GetMapping("groupCreate.do")
	public ModelAndView groupCreate() {
		List<Category> firstCategory = memberService.firstCategory();
		ModelAndView mv = new ModelAndView("groupTab/groupCreate","firstCategory",firstCategory);
		return mv;
	}
	@PostMapping("groupCreate.do")
	public String groupCreate(GroupTab groupTab,HttpSession session) {
		String fname = null;
		MultipartFile uploadFile = groupTab.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String ofname = uploadFile.getOriginalFilename(); //파일의 원본이름
			String ext = FilenameUtils.getExtension(ofname); //파일의 확장자 구하기
			
			UUID uuid = UUID.randomUUID(); //UUID 구하기 -> 뭔지 잘 모르겠음. //아마 저장할 때 이름 겹치지않게 하려고 랜덤으로 이름을 부여하는 용도?...
			fname = ofname + uuid + "." + ext;
			try {
				uploadFile.transferTo(new File(Path.FILE_STORE + fname));
			}catch(IOException ie) {}
			groupTab.setFname(fname);
		}
		groupTabService.insertS(groupTab);
		GroupTab g = groupTabService.insertGroupInfo(groupTab);
		Member m =(Member)session.getAttribute("m");
		return "redirect:groupInfo.do?gseq="+g.getGseq()+"&mnum="+m.getMnum();	
	}
	@GetMapping("groupDelete.do")
	public String groupDelete(long gseq) {
		groupTabService.memInGroupDelete(gseq);
		groupTabService.deleteS(gseq);
		return "redirect:/";
	} 
	@PostMapping("groupUpdatecheck")
	@ResponseBody
	public Long groupUpdatecheck(MemInGroup memInGroup) {
		//0=모임장 1=운영진 2=일반
		Long grade = groupTabService.grade(memInGroup);
		if(grade ==null) {//가입안한 사람
			grade=(long) 3;
			return grade;
		}else {	
			if(grade==0 || grade ==1) {//모임장이거나 운영자
				return grade;
			}else {//일반회원
				return grade;
			}
		}
	}
	@PostMapping("groupDeletecheck")
	@ResponseBody
	public Long groupDeletecheck(MemInGroup memInGroup) {
		//0=모임장 1=운영진 2=일반
		Long grade = groupTabService.grade(memInGroup);
		if(grade ==null) {//가입안한 사람
			grade=(long) 3;
			return grade;
		}else {	
			return grade;
		}
	}
	@GetMapping("groupUpdate.do")
	public ModelAndView groupUpdate(long gseq) {
		GroupTab updateList = groupTabService.selectByGSeqS(gseq);
		ModelAndView mv = new ModelAndView("groupTab/groupUpdate", "updateList", updateList);
		return mv;
		
	}
	@PostMapping("groupUpdate.do")
	public String groupUpdate(GroupTab groupTab, HttpSession session) {
		System.out.println("들어옴업두");
		long gseq = groupTab.getGseq();
		System.out.println("groupUpdate_gseq: " + gseq + "groupUpdate_groupTab: " + groupTab);
		
		String fname = groupTab.getFname();
		MultipartFile uploadFile = groupTab.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String ofname = uploadFile.getOriginalFilename(); //파일의 원본이름
			int idx = ofname.lastIndexOf("."); //파일명까지 자르기
			String ofheader = ofname.substring(0, idx);
			String ext = FilenameUtils.getExtension(ofname); //파일의 확장자 구하기
			
			UUID uuid = UUID.randomUUID(); 
			fname = ofheader + uuid + "." + ext;
			try {
				uploadFile.transferTo(new File(Path.FILE_STORE + fname));
			}catch(IOException ie) {}
			groupTab.setFname(fname);
		}
		
		groupTabService.updateS(groupTab);
		
		Member m =(Member)session.getAttribute("m");
		return "redirect:groupInfo.do?gseq="+gseq+"&mnum="+m.getMnum();
	}
	@PostMapping("memInGroup")
	@ResponseBody
	public int memInGroup(MemInGroup memInGroup,HttpSession session) {
		int check=0;
		long limit = groupTabService.LIMIT(memInGroup);
		Long groupMemberCount = groupTabService.groupMemberCount(memInGroup.getGseq());
		if(limit<=groupMemberCount) {
			check=1;
			
			
		}else {
			groupTabService.memInGroup(memInGroup);
			check=0;
		}
		return check;
	}
	@PostMapping("groupQuit")
	@ResponseBody
	public String groupQuit(MemInGroup memInGroup,long gseq) {
		List<Map<String,String>> memInGroupName = groupTabService.memInGroupName(memInGroup);
		groupTabService.groupQuit(memInGroup);
		Long groupMemberCount = groupTabService.groupMemberCount(gseq);
		String result="";
		if(groupMemberCount==0) {
			groupTabService.memInGroupDelete(gseq);
			groupTabService.deleteS(gseq);
			result="0";
		}else {
			result="1";
		}
		return result;
	}
	
	//03.26 대현추가
		@PostMapping("gatheringCreateCheck")
		@ResponseBody
		public Long gatheringCreateCheck(long gseq) {
			Long check = groupTabService.gatheringCountInGroup(gseq);
			if(check >= 5) {
				return (long)0;
			}else{
				return (long)1;
			}
		}
		//강퇴
		@PostMapping("kickout")
		@ResponseBody
		public void kickout(MemInGroup memInGroup) {

			groupTabService.kickout(memInGroup);
			
		}
		//권한바꿈
		@PostMapping("gradeChange")
		@ResponseBody
		public void gradeChange(MemInGroup memInGroup,long num) {
			System.out.println("#memInGroup: " + memInGroup);
			System.out.println("#num: " + num);
			if(num==1) {
				groupTabService.gradeChange(memInGroup);//운영진으로
			}else {
				groupTabService.gradeChange2(memInGroup);//회원으로
			}
			
		}
}