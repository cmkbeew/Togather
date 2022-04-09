package team1.togather.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.Faq;
import team1.togather.domain.FaqPageMaker;
import team1.togather.domain.FaqVo;
import team1.togather.service.FaqService;

@Controller
@AllArgsConstructor
@RequestMapping("faq")
public class FaqController {
	private FaqService faqService;
	/*
	@GetMapping("listFaqVo")
	public void listFaqVoGet(Model model, FaqVo faqVo) {
		model.addAttribute("faqList", faqService.selectPerPageS(faqVo));
	}*/
	
	@GetMapping("listPage")
	public String list(FaqVo faqVo, Model model, HttpServletRequest request) {
		String pageStr = request.getParameter("page");
		String pageSizeStr = request.getParameter("pageSize");
		//현재 페이지
		if(pageStr != null) {
			pageStr = request.getParameter("page");
			faqVo.setPage(Integer.parseInt(pageStr));
		}
		//페이지 사이즈
		if(pageSizeStr !=null) {
			pageSizeStr = request.getParameter("pageSize");
			faqVo.setPageSize(Integer.parseInt(pageSizeStr));
		}
		
		//페이징
		model.addAttribute("faqList", faqService.selectPerPageS(faqVo));
		FaqPageMaker fpm = new FaqPageMaker();
		fpm.setFaqVo(faqVo);
		fpm.setTotalCount(faqService.selectCountS());
		
		model.addAttribute("fpm", fpm);
		model.addAttribute("faqVo", faqVo);
		
		return "faq/faqList";
	}
	
	@GetMapping("faqInput")
	public String faqInput() {
		return "faq/faqInput";
	}
	
	@PostMapping("faqInput.do")
	public String faqInput(Faq faq) {
		faqService.insertS(faq);
		return "redirect:listPage";
	}
	
	@GetMapping("faqUpdate")
	public ModelAndView faqUpdate(long fseq) {
		Faq faq = faqService.selectBySeqS(fseq); 
		ModelAndView mv = new ModelAndView("faq/faqUpdate", "faq", faq);
		return mv;
	}
	
	@PostMapping("faqUpdate")
	public String faqUpdate(Faq faq) {
		faqService.updateS(faq);
		return "redirect:listPage"; 
	}
	@GetMapping("faqDelete")
	public String faqDelete(long fseq) {
		faqService.deleteS(fseq);
		return "redirect:listPage";
	}
	
	//검색기능
	@PostMapping("faqWithSearch")
	public String faqListBySearch(FaqVo faqVo, Model model, HttpServletRequest request) {
		System.out.println("faqVo222: " + faqVo);
		model.addAttribute("faqList", faqService.selectPerPageS(faqVo));
		
		String pageStr = request.getParameter("page");
		String pageSizeStr = request.getParameter("pageSize");
		String faqSearch = request.getParameter("faqSearch");
		//현재 페이지
		if(pageStr != null) {
			pageStr = request.getParameter("page");
			faqVo.setPage(Integer.parseInt(pageStr));
		}
		//페이지 사이즈
		if(pageSizeStr != null) {
			pageSizeStr = request.getParameter("pageSize");
			faqVo.setPageSize(Integer.parseInt(pageSizeStr));
		}
		if(pageSizeStr != null) {
			faqSearch = request.getParameter("faqSearch");
			System.out.println("faqSearch: " + faqSearch);
		}
		FaqPageMaker fpm = new FaqPageMaker();
		fpm.setFaqVo(faqVo);
		fpm.setTotalCount(faqService.selectCountS());
		
		model.addAttribute("fpm", fpm);
		model.addAttribute("faqVo", faqVo);
		
		return "faq/faqList";
	}
	
	@ResponseBody
	@GetMapping("listRest")
	public List<Faq> listRest(String option, String faqSearch, int page, int pageSize){
		System.out.println("listRest안 option: "+option+" faqSearch: " + faqSearch +" page: "+page+" pagesize: "+pageSize);
		
		Map<String, String> map = new HashMap<String, String>();
		FaqVo faqVo = new FaqVo(page, pageSize);
		map.put("option", option);
		map.put("faqSearch", faqSearch);
		map.put("startRow", String.valueOf(faqVo.getStartRow()));
		map.put("endRow", String.valueOf(faqVo.getEndRow()));
		return faqService.selectBySearchS(map);
	}
}
