package team1.togather.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.WishList;
import team1.togather.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService {
	@Autowired
	private WishListMapper wishmapper;
	
	@Override
	public List<WishList> getWishLists(Long mnum) {
		return wishmapper.getWishLists(mnum);
	}

	@Override
	public void insertWishList(Long usermnum, Long gseq) {
		Map<String, Object> wishMap = new HashMap<String, Object>();
		wishMap.put("mnum", usermnum);
		wishMap.put("gseq", gseq);
		wishmapper.insertWishList(wishMap);
	}

	@Override
	public void deleteWishList(Long usermnum, Long gseq) {
		Map<String, Object> wishMap = new HashMap<String, Object>();
		wishMap.put("mnum", usermnum);
		wishMap.put("gseq", gseq);
		wishmapper.deleteWishList(wishMap);
	}
	@Override
	public Integer wishListFlagCheck(Map<String,Long> map) {
		return wishmapper.wishListFlagCheck(map);
	}

}
