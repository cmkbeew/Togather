package team1.togather.mapper;

import java.util.List;

import team1.togather.domain.Category;
import team1.togather.domain.GroupTab;

public interface CategoryMapper {
	List<Category> getCategoryByOutCatogory(String int_out);
	List<GroupTab> getGroupsByCategory(String category);
}
