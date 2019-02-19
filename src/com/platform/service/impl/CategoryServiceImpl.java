package com.platform.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.platform.DAO.CategoryDAO;
import com.platform.domain.Category;
import com.platform.service.CategoryService;
@Transactional
public class CategoryServiceImpl implements CategoryService {

	private CategoryDAO categoryDAO;
	
	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	@Override
	public List<Category> findAll(Category category) {
		return categoryDAO.findAll(category);
	}

}
