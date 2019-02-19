package com.platform.DAO.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.platform.DAO.TeachVideoDAO;
import com.platform.domain.Course;
import com.platform.domain.TeachVideo;

public class TeachVideoDAOImpl extends HibernateDaoSupport implements TeachVideoDAO {

	@Override
	public Course findTeachVideo(Course course) {
		Course course2 = (Course)this.getHibernateTemplate().get(Course.class,course.getCourse_id());	
				return course2;
	}

	@Override
	public TeachVideo findVideoMain(TeachVideo teachVideo) {
		return (TeachVideo)this.getHibernateTemplate().get(TeachVideo.class,teachVideo.getVideo_id());
	}

	@Override
	public void save(TeachVideo teachVideo) {
		this.getHibernateTemplate().save(teachVideo);
	}

	@Override
	public void update(TeachVideo teachVideo) {
		this.getHibernateTemplate().update(teachVideo);
		
	}

	@Override
	public void delete(TeachVideo teachVideo) {
		this.getHibernateTemplate().delete(teachVideo);
		
	}

}
