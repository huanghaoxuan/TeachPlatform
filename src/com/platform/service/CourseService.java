package com.platform.service;

import java.util.List;

import com.platform.domain.Course;

public interface CourseService {

	public List<Course> findAll(Course course);
	public Course find(Course course);
	
	public List<Course> search(String condition);
	
	public void save(Course course);
	public void delete(Course course);
}
