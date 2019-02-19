package com.platform.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.platform.DAO.CourseDAO;
import com.platform.domain.Course;
import com.platform.service.CourseService;

@Transactional
public class CourseServiceImpl implements CourseService {

	private CourseDAO courseDAO;
	
	
	public CourseDAO getCourseDAO() {
		return courseDAO;
	}


	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}


	@Override
	public List<Course> findAll(Course course) {
		return courseDAO.findAll(course);
	}

	@Override
	public List<Course> search(String condition) {
		return courseDAO.search(condition);
	}


	@Override
	public void save(Course course) {
		courseDAO.save(course);
		
	}


	@Override
	public Course find(Course course) {
		return courseDAO.find(course);
	}


	@Override
	public void delete(Course course) {
		courseDAO.delete(course);
	}
}
