package team1.togather.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.*;
import team1.togather.service.NotificationService;

@AllArgsConstructor
@Controller
@RequestMapping("notification")
public class NotificationController {
	
	
	private NotificationService service;
	
	@ResponseBody
	@GetMapping("listRest")
	public List<Notification> listRest(String option, String notificationSearch, Integer page, Integer pageSize){
		System.out.println("listRest안 option: "+option+" notificationSearch: "+notificationSearch+" page: "+page+" pagesize: "+pageSize);
		
		Map<String, String> map = new HashMap<String, String>();
		NotificationCriteria cri = new NotificationCriteria(page, pageSize);
		map.put("option", option);
		map.put("notificationSearch", notificationSearch);
		map.put("startRow", String.valueOf(cri.getStartRow()));
		map.put("endRow", String.valueOf(cri.getEndRow()));

		System.out.println(" map:" +map);
		return service.getNotificationBySearch(map);
	}
	
	@GetMapping("/listCri")
	public void listCriGET(Model model, NotificationCriteria cri) {
		model.addAttribute("notificationList", service.listPageCri(cri));
	}
	
	@GetMapping("notice")
	public String notificationList(NotificationCriteria cri, Model model, HttpServletRequest request) {
		model.addAttribute("notificationList", service.listPageCri(cri)); // =listPageCri()
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			cri.setPage(Integer.parseInt(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			cri.setPageSize(Integer.parseInt(pageSize));
		}
		nPageMaker pm = new nPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(service.pageCount()); //calcDate()실행
		
		
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		return "notification/notice";
	}
	
	@PostMapping("notificationWithSearch")
	public String notificationListWithSearch(NotificationCriteria cri, Model model, HttpServletRequest request) {
		System.out.println("notification컨트롤러안 listpageGET: cri값: " +cri);
		model.addAttribute("notification", service.listPageCri(cri)); // =listPageCri()
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			System.out.println("현재 페이지: "+pageAt);
			cri.setPage(Integer.parseInt(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			System.out.println("현재 페이지사이즈: "+pageSize);
			cri.setPageSize(Integer.parseInt(pageSize));
		}
		if(request.getParameter("notificationSearch")!=null) {
			String notification = request.getParameter("notification");
			System.out.println("현재 notificationSearch: "+notification);

		}
		nPageMaker pm = new nPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(service.pageCount()); //calcDate()실행
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		return "notification/notice";
		
	}
	
	//공지사항 자세한내용
	@GetMapping("noticeContent")
	public ModelAndView content(long nseq) {
		service.updateNView(nseq);
		Notification notification = service.getNotificationContent(nseq);
		System.out.println("notification " + notification.getNseq() );
		ModelAndView mv = new ModelAndView("notification/noticeContent","noticeContent",notification);		
		return mv ;
		//return "notification/noticeContent";
		
		}
	
	
	//인풋폼인데 정보 넣어진 상태
	@GetMapping("noticeInput")
	public ModelAndView noticeInput(HttpSession session) {
		Member member =(Member)session.getAttribute("m");
		ModelAndView mv = new ModelAndView("notification/noticeInput","member",member);
		return mv;		
	}
	
	//넣고나서
	@PostMapping("noticeInsert")
	public String noticeInsert(Notification notification) {
		service.insert(notification);
		System.out.println("값 ");
		return "redirect:notice";
	}
	//업데이트폼
	@GetMapping("noticeUpdate")
	public ModelAndView noticeUpdate(Long nseq, HttpSession session) {
		Member member =(Member)session.getAttribute("m");
		Notification notification = service.getNotificationContent(nseq);
		ModelAndView mv = new ModelAndView("notification/noticeUpdate" ,"notification",notification);
		mv.addObject(member);
		return mv;
	}
	// 업데이트 수정하기 누르면
	@PostMapping("noticeUpdate")
	public String noticeUpdate(Notification notification) {
		service.update(notification);
		System.out.println("notification : "+ notification);
		return "redirect:notice";
	}
	@GetMapping("noticeDelete")
	public String noticeDelete(Long nseq) {
		service.delete(nseq);
		System.out.println();
		return "redirect:notice";
	}

	


}
