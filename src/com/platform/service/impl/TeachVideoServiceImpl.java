package com.platform.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.platform.DAO.TeachVideoDAO;
import com.platform.domain.Course;
import com.platform.domain.TeachVideo;
import com.platform.service.TeachVideoService;
@Transactional
public class TeachVideoServiceImpl implements TeachVideoService {

	private TeachVideoDAO teachVideoDAO;
	
	
	
	public TeachVideoDAO getTeachVideoDAO() {
		return teachVideoDAO;
	}



	public void setTeachVideoDAO(TeachVideoDAO teachVideoDAO) {
		this.teachVideoDAO = teachVideoDAO;
	}



	@Override
	public Course findTeachVideo(Course course) {
		return teachVideoDAO.findTeachVideo(course);
	}



	@Override
	public TeachVideo findVideoMain(TeachVideo teachVideo) {
		return teachVideoDAO.findVideoMain(teachVideo);
	}



	@Override
	public void save(TeachVideo teachVideo) {
		teachVideoDAO.save(teachVideo);
	}



	@Override
	public void update(TeachVideo teachVideo) {
		teachVideoDAO.update(teachVideo);
		
	}



	@Override
	public void delete(TeachVideo teachVideo) {
		teachVideoDAO.delete(teachVideo);
		
	}
	

}
