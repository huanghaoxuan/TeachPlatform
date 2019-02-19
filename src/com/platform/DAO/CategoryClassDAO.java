package com.platform.DAO;

import java.util.List;

import com.platform.domain.CategoryClass;

public interface CategoryClassDAO {

	public List<CategoryClass> search(String condition);
	public List<CategoryClass> findCategoryClass(CategoryClass categoryClass);
	public CategoryClass collect(CategoryClass categoryClass);
	public void addClass(CategoryClass categoryClass);
	public void deleteClass(CategoryClass categoryClass);
}
