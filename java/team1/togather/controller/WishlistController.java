package team1.togather.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team1.togather.domain.GroupTab;
import team1.togather.domain.Member;
import team1.togather.domain.WishList;
import team1.togather.service.GroupTabService;
import team1.togather.service.WishListService;

@Controller
@RequestMapping("/wishTab")
public class WishlistController {
	@Autowired
	private GroupTabService groupservice;
	@Autowired
	private WishListService wishservice;
	
	@GetMapping("/wishList")
	public ModelAndView wishList(Long mnum) {
		System.out.println("mnum: "+ mnum);
		System.out.println("위시리스트안");
		List<WishList> wishList = wishservice.getWishLists(mnum);
		List<GroupTab> groupList = new ArrayList<>();
		List<Member> namelist = new ArrayList<>();
		for(WishList wli: wishList) {
			groupList.add(groupservice.selectByGSeqS(wli.getGseq()));
			System.out.println(wli.getGseq());
			if(wishList.size()>=9) {
				wishList.remove(8);
			}
		}
		for(GroupTab gli: groupList) {
			namelist.add(groupservice.groupInfoMemberName(gli.getGseq()));
			if(groupList.size()>=9) {
				groupList.remove(8);
			}
		}
		ModelAndView mv = new ModelAndView("wishTab/wishList","groupList",groupList);
		mv.addObject("namelist", namelist);
		return mv;
	}
}
