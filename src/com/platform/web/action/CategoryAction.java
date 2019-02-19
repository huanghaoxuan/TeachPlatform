package com.platform.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.Category;
import com.platform.service.CategoryService;

public class CategoryAction extends ActionSupport implements ModelDriven<Category> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7649135851594674049L;
	private Category category = new Category();

	@Override
	public Category getModel() {
		return category;
	}
	
	private CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	
}
