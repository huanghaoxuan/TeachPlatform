package com.platform.DAO.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.platform.DAO.FileDAO;
import com.platform.domain.FileMain;

public class FileDAOImpl extends HibernateDaoSupport implements FileDAO {

	@Override
	public void save(FileMain fileMain) {
		this.getHibernateTemplate().merge(fileMain);

	}

	@Override
	public void delete(FileMain fileMain) {
		this.getHibernateTemplate().delete(fileMain);
	}

	@Override
	public FileMain find(FileMain fileMain) {
		return this.getHibernateTemplate().get(FileMain.class, fileMain.getFile_id());
	}

	@Override
	public void update(FileMain fileMain) {
		this.getHibernateTemplate().update(fileMain);
		
	}

}
