package team1.togather.service;

import java.util.List;
import java.util.Map;

import team1.togather.domain.WishList;

public interface WishListService {
	public List<WishList> getWishLists(Long mnum);
	public void insertWishList(Long usermnum, Long gseq);
	public void deleteWishList(Long usermnum, Long gseq);
	public Integer wishListFlagCheck(Map<String,Long> map);
}
