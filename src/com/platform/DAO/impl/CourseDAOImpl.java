package com.platform.DAO.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.platform.DAO.CourseDAO;
import com.platform.domain.Course;

public class CourseDAOImpl extends HibernateDaoSupport implements CourseDAO {

	public List<Course> findAll(Course course) {
		List<Course> courses = (List<Course>) this.getHibernateTemplate().findByExample(course);
		return courses;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Course> search(String condition) {
		List<Course> search_courses = (List<Course>) this.getHibernateTemplate().find("from Course c where c.course_name like '%"+condition+"%'");
		return search_courses;
	}

	@Override
	public void save(Course course) {
		this.getHibernateTemplate().save(course);
		
	}

	@Override
	public Course find(Course course) {
		return this.getHibernateTemplate().get(Course.class, course.getCourse_id());
	}

	@Override
	public void delete(Course course) {
		this.getHibernateTemplate().delete(course);	
	}
	
}
