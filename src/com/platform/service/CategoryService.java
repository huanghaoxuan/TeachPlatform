package com.platform.service;

import java.util.List;

import com.platform.domain.Category;

public interface CategoryService {

	public List<Category> findAll(Category category);
}
