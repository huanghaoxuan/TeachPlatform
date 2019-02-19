package com.platform.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6776445632278257440L;
	private Integer user_id;
	private String user_name;
	private String user_password;
	private String user_mail;
	private String user_useName;
	private Integer user_flag;
	private Set<FileMain> fileMains = new HashSet<FileMain>();
	private Set<CategoryClass> categoryClasses = new HashSet<CategoryClass>();
	private Set<CategoryClass> categoryClasses2 = new HashSet<CategoryClass>();

	public Set<CategoryClass> getCategoryClasses2() {
		return categoryClasses2;
	}

	public void setCategoryClasses2(Set<CategoryClass> categoryClasses2) {
		this.categoryClasses2 = categoryClasses2;
	}

	public Set<CategoryClass> getCategoryClasses() {
		return categoryClasses;
	}

	public void setCategoryClasses(Set<CategoryClass> categoryClasses) {
		this.categoryClasses = categoryClasses;
	}

	public void setFileMains(Set<FileMain> fileMains) {
		this.fileMains = fileMains;
	}

	public Set<FileMain> getFileMains() {
		return fileMains;
	}

	public Integer getUser_flag() {
		return user_flag;
	}

	public void setUser_flag(Integer user_flag) {
		this.user_flag = user_flag;
	}

	public String getUser_useName() {
		return user_useName;
	}

	public void setUser_useName(String user_useName) {
		this.user_useName = user_useName;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_mail=" + user_mail + ", user_useName=" + user_useName + ", user_flag=" + user_flag
				+ ", fileMains=" + fileMains + ", categoryClasses=" + categoryClasses + ", categoryClasses2="
				+ categoryClasses2 + "]";
	}



}
