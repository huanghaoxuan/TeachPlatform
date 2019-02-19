package com.platform.service;

import java.util.List;

import com.platform.domain.CategoryClass;

public interface CategoryClassService {

	
	
	public CategoryClass collect(CategoryClass categoryClass);
	public List<CategoryClass> search(String condition);
	public List<CategoryClass> findCategoryClass(CategoryClass categoryClass);
	public void addClass(CategoryClass categoryClass);
	public void deleteClass(CategoryClass categoryClass);
}
