package team1.togather.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.GBReply;
import team1.togather.domain.GBoard;
import team1.togather.service.GBReplyService;
import team1.togather.service.GBoardService;

@AllArgsConstructor
@Controller
@RequestMapping("gbreply")
public class GBReplyController {
	private GBReplyService gbreplyService;
	private GBoardService gboardService;
	
	@GetMapping("gbrupdate.do")
	public ModelAndView gbrupdate(long gbnum, long gbrseq, String gbrcontent) {
		GBoard gboard = gboardService.getGBoard(gbnum);
		ArrayList<GBReply> gbrlist = gbreplyService.gbrlistS(gbnum);
		GBReply gbreply = gbreplyService.getGBReply(gbrseq);
		ModelAndView mv = new ModelAndView("gbreply/gbrupdate", "gboard", gboard);
		mv.addObject("gbrlist", gbrlist);
		mv.addObject("gbrseq", gbrseq);
		mv.addObject("gbnum", gbnum);
		mv.addObject("gbrcontent", gbrcontent);
		
		return mv;
	}
	
	@PostMapping("gbrupdate.do")
	public String gbrupdate(GBReply gbreply, HttpServletRequest request, HttpServletResponse response) {
		gbreplyService.gbrupdateS(gbreply); 
		long gbnum = Long.parseLong(request.getParameter("gbnum"));
		long gbrseq = Long.parseLong(request.getParameter("gbrseq"));
		System.out.println("gbrseq= " + gbrseq);
		System.out.println("gbnum= " + gbnum);
		return "redirect:../gboard/gbcontent.do?gbnum="+gbnum+"";
		
	}
	@GetMapping("gbrdel.do")
	public String gbdelete(long gbrseq, HttpServletRequest request, HttpServletResponse response) {
		gbreplyService.gbrdeleteS(gbrseq);
		long gbnum = Long.parseLong(request.getParameter("gbnum"));
		return "redirect:../gboard/gbcontent.do?gbnum="+gbnum+"";
	}
	
}
