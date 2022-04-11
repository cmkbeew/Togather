package team1.togather.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.Faq;
import team1.togather.service.FaqService;

@Controller
@AllArgsConstructor
@RequestMapping("faq")
public class FaqController {
	private FaqService faqService;

	@GetMapping("faqList")
	public ModelAndView list() {
		List<Faq> list = faqService.listS();
		ModelAndView mv = new ModelAndView("faq/faqList", "list", list);
		return mv;
	}

	@GetMapping("faqInput")
	public String faqInput() {
		return "faq/faqInput";
	}

	@PostMapping("faqInput.do")
	public String faqInput(Faq faq) {
		faqService.insertS(faq);
		return "redirect:faqList";
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
		return "redirect:faqList";
	}
	@GetMapping("faqDelete")
	public String faqDelete(long fseq) {
		faqService.deleteS(fseq);
		return "redirect:faqList";
	}
}
