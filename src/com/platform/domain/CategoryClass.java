package com.platform.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class CategoryClass implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1869334445585429949L;
	private Integer categoryClass_id;
	private Integer categoryClass_icon;
	private String categoryClass_category;
	private String categoryClass_name;
	private String categoryClass_introduce;
	private String categoryClass_teacher;
	private User user = new User();
	private Set<User> users2 = new HashSet<User>();
	private Set<Course> courses = new HashSet<Course>();
	
	public Integer getCategoryClass_icon() {
		return categoryClass_icon;
	}

	public void setCategoryClass_icon(Integer categoryClass_icon) {
		this.categoryClass_icon = categoryClass_icon;
	}

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	public Set<User> getUsers2() {
		return users2;
	}

	public void setUsers2(Set<User> users2) {
		this.users2 = users2;
	}

	public String getCategoryClass_teacher() {
		return categoryClass_teacher;
	}

	public void setCategoryClass_teacher(String categoryClass_teacher) {
		this.categoryClass_teacher = categoryClass_teacher;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getCategoryClass_id() {
		return categoryClass_id;
	}

	public void setCategoryClass_id(Integer categoryClass_id) {
		this.categoryClass_id = categoryClass_id;
	}

	public String getCategoryClass_category() {
		return categoryClass_category;
	}

	public void setCategoryClass_category(String categoryClass_category) {
		this.categoryClass_category = categoryClass_category;
	}

	public String getCategoryClass_name() {
		return categoryClass_name;
	}

	public void setCategoryClass_name(String categoryClass_name) {
		this.categoryClass_name = categoryClass_name;
	}

	public String getCategoryClass_introduce() {
		return categoryClass_introduce;
	}

	public void setCategoryClass_introduce(String categoryClass_introduce) {
		this.categoryClass_introduce = categoryClass_introduce;
	}

	@Override
	public String toString() {
		return "CategoryClass [categoryClass_id=" + categoryClass_id + ", categoryClass_category="
				+ categoryClass_category + ", categoryClass_name=" + categoryClass_name + ", categoryClass_introduce="
				+ categoryClass_introduce + ", categoryClass_teacher=" + categoryClass_teacher + "]";
	}

	
	



}
