package team1.togather.mapper;

import java.util.List;
import java.util.Map;

import team1.togather.domain.WishList;

public interface WishListMapper {
	public List<WishList> getWishLists(Long usermnum);
	public void insertWishList(Map<String,Object> map);
	public void deleteWishList(Map<String,Object> map);
	public Integer wishListFlagCheck(Map<String,Long> map);
}
