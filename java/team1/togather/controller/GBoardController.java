package team1.togather.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import team1.togather.domain.GBReply;
import team1.togather.domain.GBoard;
import team1.togather.domain.GBPageMaker;
import team1.togather.domain.GBoardCriteria;
import team1.togather.domain.Member;
import team1.togather.service.GBReplyService;
import team1.togather.service.GBoardService;
import team1.togather.fileset.GBPath;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/gboard")
public class GBoardController {
	private GBoardService gboardService;
	private GBReplyService gbreplyService;
	
	@ResponseBody
	@GetMapping("gblistRest")
	public ModelAndView gblistRest(String option, String gboardSearch, GBoardCriteria cri, HttpServletRequest request, long gseq){
		ModelAndView mv =new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("gboardSearch", gboardSearch);
		map.put("startRow", String.valueOf(cri.getStartRow()));
		map.put("endRow", String.valueOf(cri.getEndRow()));
		map.put("gseq",cri.getGseq());
		mv.addObject("serch", gboardService.getGBoardBySearch(map));
		System.out.println("dd: "+gboardService.getGBoardBySearch(map));
		
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			cri.setPage(Long.parseLong(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			cri.setPageSize(Long.parseLong(pageSize));
		}
		
		GBPageMaker pm = new GBPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(gboardService.gbpageCount(gseq)); //calcDate()실행
		mv.addObject("gseq",cri.getGseq());
		mv.setViewName("jsonView");
		return mv;
	}
	@GetMapping("/gblistCri")
	public void gblistCriGET(Model model, GBoardCriteria cri) {
		model.addAttribute("gboardList", gboardService.gblistCri(cri));
	}
	
	@GetMapping("gblistPage")
	public ModelAndView gboardList(GBoardCriteria cri, Model model, HttpServletRequest request, Long mnum, Long gseq) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("gboardList", gboardService.gblistCri(cri)); // =listPageCri()
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			cri.setPage(Long.parseLong(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			cri.setPageSize(Long.parseLong(pageSize));
		}
		GBPageMaker pm = new GBPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(gboardService.gbpageCount(gseq)); //calcDate()실행
		mv.addObject("gseq",cri.getGseq());
		mv.addObject("pm", pm);
		mv.addObject("cri", cri);
		mv.setViewName("gboard/gblist");
		System.out.println("pm= " + pm);
		System.out.println("pmstr= " + pm.getStartPage());
		System.out.println("pmed= " + pm.getEndPage());
		return mv;
	}
	@GetMapping("gboardWithSearch")
	public String gboardListWithSearch() {
		return "gboard/gblist";
	}
	@PostMapping("gboardWithSearch")
	public String gboardListWithSearch(GBoardCriteria cri, Model model, HttpServletRequest request, long gseq) {
		model.addAttribute("gboardList", gboardService.gblistCri(cri)); // 
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			cri.setPage(Long.parseLong(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			cri.setPageSize(Long.parseLong(pageSize));
		}
		if(request.getParameter("gboardSearch")!=null) {
			String gboardSearch = request.getParameter("gboardSearch");

		}
		GBPageMaker pm = new GBPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(gboardService.gbpageCount(gseq)); //calcDate()실행
		
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		return "gboard/gblist";
	}
	
	@GetMapping("gbwrite.do")
	public ModelAndView gbwrite(HttpSession session,long gseq) {
		Member gbmember =(Member)session.getAttribute("m");
		
		ModelAndView mv = new ModelAndView("gboard/gbwrite","gbmember",gbmember);
		mv.addObject("gseq", gseq);
		return mv;
	}
	@PostMapping("gbwrite.do")
	public String gbwrite(GBoard gboard, MultipartFile gbfiles, HttpServletRequest request) {
		String gbofname = gbfiles.getOriginalFilename();
		if(gbofname != null) gbofname = gbofname.trim();
		if(gbofname.length() != 0) {
			gboardService.gbwrite(gboard, gbfiles);
		}
		else {
			gboardService.gbwrite(gboard, gbfiles);
		}
		long gseq = Long.parseLong(request.getParameter("gseq"));
		return "redirect:gblistPage.do?gseq="+gseq+"";
	}

	@GetMapping("gbcontent.do")
	public ModelAndView gbcontent(long gbnum, HttpSession session) {
		gboardService.updateGBView(gbnum);
		GBoard gboard = gboardService.getGBoard(gbnum);
		ArrayList<GBReply> gbrlist = gbreplyService.gbrlistS(gbnum);
		Member gbmember =(Member)session.getAttribute("m");
		ModelAndView mv = new ModelAndView("gboard/gbcontent", "gboard", gboard);
		mv.addObject("gbrlist", gbrlist);
		mv.addObject("gbnum", gbnum);
		
		return mv;
	}
	

	@GetMapping("gbupdate.do")
	public ModelAndView gbupdate(long gbnum, HttpSession session) {
		GBoard gboard = gboardService.getGBoard(gbnum);
		Member gbmember =(Member)session.getAttribute("m");
		ModelAndView mv = new ModelAndView("gboard/gbupdate", "gboard", gboard);
		return mv;
	}
	@PostMapping("gbupdate.do")
	public String gbupdate(GBoard gboard, HttpServletRequest request) {
		gboardService.gbedit(gboard);
		long gbnum = Long.parseLong(request.getParameter("gbnum"));
		return "redirect:gbcontent.do?gbnum="+gbnum+"";
	}
	@GetMapping("gbdel.do")
	public String gbdelete(long gbnum, @RequestParam String gbfname, HttpServletRequest request) {
		File gbfile = new File(GBPath.GBFILE_STORE, gbfname);
		if(gbfile.exists()) gbfile.delete();
		gboardService.gbremove(gbnum);
		long gseq = Long.parseLong(request.getParameter("gseq"));
		return "redirect:gblistPage.do?gseq="+gseq+"";
	}
	
	@PostMapping("gbrwrite.do")
    public String gbrcreate(GBReply gbreply, HttpServletRequest request, HttpServletResponse response)  { 
		gbreplyService.gbrinsertS(gbreply); 
		long gbnum = Long.parseLong(request.getParameter("gbnum"));
		return "redirect:gbcontent.do?gbnum="+gbnum+"";
    }
	
	@GetMapping("gbfdownload.do")
	public ModelAndView gbfdownload(String gbfname, HttpServletRequest request, HttpServletResponse response) {
		File gbfile = new File(GBPath.GBFILE_STORE, gbfname);
		long gbnum = Long.parseLong(request.getParameter("gbnum"));
		if(gbfile.exists()) {
			return new ModelAndView("gbfileDownloadView", "downloadFile", gbfile);
		}else {
			return new ModelAndView("redirect:gbcontent.do?gbnum="+gbnum+"");
		}
	}
	
	
	
}
