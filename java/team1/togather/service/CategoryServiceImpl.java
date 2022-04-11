package team1.togather.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.Category;
import team1.togather.domain.GroupTab;
import team1.togather.mapper.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper categorymapper;
	
	@Override
	public List<Category> getCategoryByOutCatogory(String int_out) {
		return categorymapper.getCategoryByOutCatogory(int_out);
	}
	@Override
	public List<GroupTab> getGroupsByCategory(String category){
		return categorymapper.getGroupsByCategory(category);
	}
}
