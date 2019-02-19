package com.platform.DAO.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.platform.DAO.CategoryClassDAO;
import com.platform.domain.CategoryClass;

public class CategoryClassDAOImpl extends HibernateDaoSupport implements CategoryClassDAO {

	@Override
	public List<CategoryClass> findCategoryClass(CategoryClass categoryClass) {
		List<CategoryClass> list = (List<CategoryClass>) this.getHibernateTemplate().findByExample(categoryClass);
		return list;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<CategoryClass> search(String condition) {
		List<CategoryClass> search_categoryClass = (List<CategoryClass>) this.getHibernateTemplate()
				.find("from CategoryClass c where c.categoryClass_name like '%" + condition
						+ "%' or c.categoryClass_teacher like '%" + condition + "%' ");
		return search_categoryClass;
	}

	@Override
	public CategoryClass collect(CategoryClass categoryClass) {
		CategoryClass categoryClass1 = (CategoryClass) this.getHibernateTemplate().get(CategoryClass.class,
				categoryClass.getCategoryClass_id());
		return categoryClass1;
	}

	@Override
	public void addClass(CategoryClass categoryClass) {

		this.getHibernateTemplate().save(categoryClass);

	}

	@Override
	public void deleteClass(CategoryClass categoryClass) {
		this.getHibernateTemplate().delete(categoryClass);		
	}
}
