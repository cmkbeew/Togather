package team1.togather.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team1.togather.domain.Board;
import team1.togather.domain.BoardCriteria;
import team1.togather.domain.Member;
import team1.togather.domain.PageMaker;
import team1.togather.domain.Reply;
import team1.togather.service.BoardService;
import team1.togather.service.ReplyService;
//보석 git 테스트
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private ReplyService replyservice;
	
	@ResponseBody
	@GetMapping("listRest")
	public List<Board> listRest(String option, String boardSearch, Integer page, Integer pageSize){
		System.out.println("listRest안 option: "+option+" boardSearch: "+boardSearch+" page: "+page+" pagesize: "+pageSize);
		
		Map<String, String> map = new HashMap<String, String>();
		BoardCriteria cri = new BoardCriteria(page, pageSize);
		map.put("option", option);
		map.put("boardSearch", boardSearch);
		map.put("startRow", String.valueOf(cri.getStartRow()));
		map.put("endRow", String.valueOf(cri.getEndRow()));
		return service.getBoardBySearch(map);
	}
	@ResponseBody
	@PostMapping("addReply")
	public List<Reply> replyRest(@RequestBody Reply reply){
		replyservice.insert(reply);
		return replyservice.getReply(reply.getBnum());
	}
	@GetMapping("/listCri")
	public void listCriGET(Model model, BoardCriteria cri) {
		model.addAttribute("boardList", service.listCri(cri));
	}
	@ResponseBody
	@PostMapping("setR_like")
	public Long setR_like(@RequestBody Reply reply) {
		System.out.println("보컨 setRlike mnum: "+ reply.getMnum());
		System.out.println("보드컨트롤러setR_like rseq: "+reply.getRseq());
		Map<String, Object> map = new HashMap<>();
		map.put("rseq", reply.getRseq());
		map.put("mnum", reply.getMnum());
		if(replyservice.checkRLIKE(map)==null) {
			replyservice.insertRLIKE(map);
			replyservice.addLike(reply);
		}else if(replyservice.checkRLIKE(map)==1) {
			replyservice.deleteRLIKE(map);
			replyservice.cancelLike(reply);
		}
		return replyservice.getR_like(reply.getRseq());
	}
	
	@GetMapping("listPage")
	public String boardList(BoardCriteria cri, Model model, HttpServletRequest request) {
		System.out.println("board컨트롤러안 listpageGET: cri값: " +cri);
		model.addAttribute("boardList", service.listCri(cri)); // =listPageCri()
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
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(service.pageCount()); //calcDate()실행
		
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		return "board/boardMain";
	}
	@PostMapping("boardWithSearch")
	public String boardListWithSearch(BoardCriteria cri, Model model, HttpServletRequest request) {
		System.out.println("board컨트롤러안 listpageGET: cri값: " +cri);
		model.addAttribute("boardList", service.listCri(cri)); // =listPageCri()
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
		if(request.getParameter("boardSearch")!=null) {
			String boardSearch = request.getParameter("boardSearch");
			System.out.println("현재 boardSearch: "+boardSearch);

		}
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(service.pageCount()); //calcDate()실행
		
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		return "board/boardMain";
	}
	@GetMapping("boardInput")
	public String boardInputPage() {
		return "board/boardInput";
	}
	@PostMapping("boardInsert")
	public String boardInsert(Board board) {
		service.insert(board);
		return "redirect:listPage";
	}
	@GetMapping("boardContent")
	public ModelAndView boardContent(Long bnum, HttpServletRequest request) {
		service.updateBView(bnum);
		Board board = service.getBoardContent(bnum);
		ArrayList<Reply> reply = replyservice.getReply(bnum);
		ModelAndView mv = new ModelAndView("board/boardMainContent","board",board);
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			System.out.println("현재 페이지: "+pageAt);
			mv.addObject("page", pageAt);
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			System.out.println("현재 페이지사이즈: "+pageSize);
			mv.addObject("pageSize", pageSize);
		}
		mv.addObject("bnum", bnum);
		mv.addObject("reply", reply);
		mv.addObject("totalReply", reply.size());
		return mv;
	}
	@GetMapping("boardDelete")
	public String boardDelete(Long bnum) {
		service.delete(bnum);
		return "redirect:listPage";
	}
	@GetMapping("boardUpdate")
	public ModelAndView boardUpdatePage(Long bnum) {
		Board board = service.getBoardContent(bnum);
		ModelAndView mv = new ModelAndView("board/updatePage", "board", board);
		return mv;
	}
	@PostMapping("boardUpdate")
	public ModelAndView commitBoardUpdate(Board board) {
		System.out.println("commit~안 board의 bnum: "+ board.getBnum());
		service.update(board);
		ModelAndView mv = new ModelAndView("redirect:listPage");
		return mv;
	}
}
