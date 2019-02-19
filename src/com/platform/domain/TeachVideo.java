package com.platform.domain;

import java.io.File;
import java.io.Serializable;
import java.util.Set;

public class TeachVideo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7127540219113312765L;
	private Integer video_id;
	private Integer video_course_id;

	public Integer getVideo_course_id() {
		return video_course_id;
	}

	public void setVideo_course_id(Integer video_course_id) {
		this.video_course_id = video_course_id;
	}

	private String video_contentName;
	private String video_path;
	private String video_introduce;
	private Course course = new Course();

	// 上传视频
	public File file;// io包中的file
	private String fileFileName;// 文件的MIME的类型
	private String fileContentType;
	private String token;
	private Integer code;
	private Integer coursewareHiden;
	private Set<FileMain> fileMains;

	public Integer getCoursewareHiden() {
		return coursewareHiden;
	}

	public void setCoursewareHiden(Integer coursewareHiden) {
		this.coursewareHiden = coursewareHiden;
	}

	public Set<FileMain> getFileMains() {
		return fileMains;
	}

	public void setFileMains(Set<FileMain> fileMains) {
		this.fileMains = fileMains;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
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

	public String getVideo_contentName() {
		return video_contentName;
	}

	public void setVideo_contentName(String video_contentName) {
		this.video_contentName = video_contentName;
	}

	public Integer getVideo_id() {
		return video_id;
	}

	public void setVideo_id(Integer video_id) {
		this.video_id = video_id;
	}

	public String getVideo_introduce() {
		return video_introduce;
	}

	public void setVideo_introduce(String video_introduce) {
		this.video_introduce = video_introduce;
	}

	public String getVideo_path() {
		return video_path;
	}

	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "TeachVideo [video_id=" + video_id + ", video_contentName=" + video_contentName + ", video_path="
				+ video_path + ", video_introduce=" + video_introduce + ", fileFileName=" + fileFileName
				+ ", coursewareHiden=" + coursewareHiden + ", fileMains=" + fileMains + "]";
	}

}
