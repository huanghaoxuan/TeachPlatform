package com.platform.DAO;

import java.util.List;

import com.platform.domain.Category;

public interface CategoryDAO {

	public List<Category> findAll(Category category);
}
