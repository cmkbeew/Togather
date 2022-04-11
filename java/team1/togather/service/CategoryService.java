package team1.togather.service;

import java.util.List;

import team1.togather.domain.Category;
import team1.togather.domain.GroupTab;

public interface CategoryService {
	List<Category> getCategoryByOutCatogory(String int_out);
	List<GroupTab> getGroupsByCategory(String category);
}
