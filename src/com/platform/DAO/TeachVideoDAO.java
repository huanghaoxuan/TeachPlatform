package com.platform.DAO;

import com.platform.domain.Course;
import com.platform.domain.TeachVideo;

public interface TeachVideoDAO {

	public Course findTeachVideo(Course course);
	
	public TeachVideo findVideoMain(TeachVideo teachVideo);

	public void save(TeachVideo teachVideo);

	public void update(TeachVideo teachVideo);

	public void delete(TeachVideo teachVideo);
}
