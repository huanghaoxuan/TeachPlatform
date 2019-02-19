package com.platform.DAO;

import java.util.List;

import com.platform.domain.Course;

public interface CourseDAO {

	public List<Course> findAll(Course course);
	
	public List<Course> search(String condition);
	
	public void save(Course course);

	public Course find(Course course);

	public void delete(Course course);
}
