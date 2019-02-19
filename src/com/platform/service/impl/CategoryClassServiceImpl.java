package com.platform.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.platform.DAO.CategoryClassDAO;
import com.platform.domain.CategoryClass;
import com.platform.service.CategoryClassService;
@Transactional
public class CategoryClassServiceImpl implements CategoryClassService {

	
	private CategoryClassDAO categoryClassDAO;
	
	
	
	public void setCategoryClassDAO(CategoryClassDAO categoryClassDAO) {
		this.categoryClassDAO = categoryClassDAO;
	}


	@Override
	public List<CategoryClass> findCategoryClass(CategoryClass categoryClass) {
		return categoryClassDAO.findCategoryClass(categoryClass);
	}
	
	@Override
	public List<CategoryClass> search(String condition) {
		return categoryClassDAO.search(condition);
	}


	@Override
	public CategoryClass collect(CategoryClass categoryClass) {
		return categoryClassDAO.collect(categoryClass);
	}


	@Override
	public void addClass(CategoryClass categoryClass) {
		categoryClassDAO.addClass(categoryClass);
	}


	@Override
	public void deleteClass(CategoryClass categoryClass) {
		categoryClassDAO.deleteClass(categoryClass);
		
	}

}
