package com.platform.domain;

import java.io.File;
import java.io.Serializable;

public class FileMain implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8210400844579375338L;
	private Integer file_id;
	private Integer file_flag;
	private String file_score;
	private String file_assess;
	
	public File file;// io包中的file
	private String fileFileName;// 文件的MIME的类型
	private String fileContentType;
	private String file_path;
	private String token;
	private User user = new User();
	private TeachVideo teachVideo = new TeachVideo();

	public String getFile_score() {
		return file_score;
	}

	public void setFile_score(String file_score) {
		this.file_score = file_score;
	}

	public String getFile_assess() {
		return file_assess;
	}

	public void setFile_assess(String file_assess) {
		this.file_assess = file_assess;
	}

	public Integer getFile_flag() {
		return file_flag;
	}

	public void setFile_flag(Integer file_flag) {
		this.file_flag = file_flag;
	}

	public TeachVideo getTeachVideo() {
		return teachVideo;
	}

	public void setTeachVideo(TeachVideo teachVideo) {
		this.teachVideo = teachVideo;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public Integer getFile_id() {
		return file_id;
	}

	public void setFile_id(Integer file_id) {
		this.file_id = file_id;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "FileMain [file_id=" + file_id + ", file_flag=" + file_flag + ", file_score=" + file_score
				+ ", file_assess=" + file_assess + ", fileFileName=" + fileFileName + ", file_path=" + file_path + "]";
	}

	

	

}
