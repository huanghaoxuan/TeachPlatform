package com.platform.service;

import com.platform.domain.Course;
import com.platform.domain.TeachVideo;

public interface TeachVideoService {

	public Course findTeachVideo(Course course);
	
	public TeachVideo findVideoMain(TeachVideo teachVideo);
	public void save(TeachVideo teachVideo);

	public void update(TeachVideo teachVideo);

	public void delete(TeachVideo teachVideo);
}
