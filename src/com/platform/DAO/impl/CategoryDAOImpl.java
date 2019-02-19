package com.platform.DAO.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.platform.DAO.CategoryDAO;
import com.platform.domain.Category;

public class CategoryDAOImpl extends HibernateDaoSupport implements CategoryDAO {

	@Override
	public List<Category> findAll(Category category) {
		List<Category> list = (List<Category>) this.getHibernateTemplate().findByExample(category);
		return list;
	}

}
