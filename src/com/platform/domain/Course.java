package com.platform.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Course implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3138081145894268742L;
	private Integer course_id;
	private Integer course_categoryClass_id;
	private String course_name;
	private String course_category;
	private String course_introduce;
	private Set<TeachVideo> teachVideos = new HashSet<TeachVideo>();
	private CategoryClass categoryClass = new CategoryClass();

	public Integer getCourse_categoryClass_id() {
		return course_categoryClass_id;
	}

	public void setCourse_categoryClass_id(Integer course_categoryClass_id) {
		this.course_categoryClass_id = course_categoryClass_id;
	}

	public CategoryClass getCategoryClass() {
		return categoryClass;
	}

	public void setCategoryClass(CategoryClass categoryClass) {
		this.categoryClass = categoryClass;
	}

	public Set<TeachVideo> getTeachVideos() {
		return teachVideos;
	}

	public void setTeachVideos(Set<TeachVideo> teachVideos) {
		this.teachVideos = teachVideos;
	}

	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getCourse_category() {
		return course_category;
	}

	public void setCourse_category(String course_category) {
		this.course_category = course_category;
	}

	public String getCourse_introduce() {
		return course_introduce;
	}

	public void setCourse_introduce(String course_introduce) {
		this.course_introduce = course_introduce;
	}

	@Override
	public String toString() {
		return "Course [course_id=" + course_id + ", course_name=" + course_name + ", course_category="
				+ course_category + ", course_introduce=" + course_introduce + ", teachVideos=" + teachVideos + "]";
	}

}
