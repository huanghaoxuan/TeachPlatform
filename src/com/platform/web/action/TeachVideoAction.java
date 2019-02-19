package com.platform.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.CategoryClass;
import com.platform.domain.Course;
import com.platform.domain.TeachVideo;
import com.platform.domain.User;
import com.platform.service.CourseService;
import com.platform.service.TeachVideoService;
import com.platform.util.ConvertVideo;

public class TeachVideoAction extends ActionSupport implements ModelDriven<TeachVideo> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7843466863683410560L;

	private TeachVideoService teachVideoService;

	public void setTeachVideoService(TeachVideoService teachVideoService) {
		this.teachVideoService = teachVideoService;
	}

	private CourseService courseService;

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	private TeachVideo teachVideo = new TeachVideo();

	@Override
	public TeachVideo getModel() {
		return teachVideo;
	}

	public String videoMain() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			System.out.println(teachVideo);
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			System.out.println(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			User user = findVideoMain.getCourse().getCategoryClass().getUser();
			ActionContext.getContext().getSession().put("videoMainUser", user);
			return SUCCESS;
		} else {
			return "login";
		}
	}
	
	
	public String courseware() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			System.out.println(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			User user = findVideoMain.getCourse().getCategoryClass().getUser();
			ActionContext.getContext().getSession().put("videoMainUser", user);
			System.out.println(user);
			return "courseware";
		} else {
			return "login";
		}
	}
	
	
	public String homework() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			System.out.println(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			User user = findVideoMain.getCourse().getCategoryClass().getUser();
			ActionContext.getContext().getSession().put("videoMainUser", user);
			System.out.println(user);
			return "homework";
		} else {
			return "login";
		}
	}
	
	public String uploadCourseware() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			System.out.println(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			User user = findVideoMain.getCourse().getCategoryClass().getUser();
			ActionContext.getContext().getSession().put("videoMainUser", user);
			return "uploadCourseware";
		} else {
			return "login";
		}
	}
	
	public String uploadHomework() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			System.out.println(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			User user = findVideoMain.getCourse().getCategoryClass().getUser();
			ActionContext.getContext().getSession().put("videoMainUser", user);
			return "uploadHomework";
		} else {
			return "login";
		}
	}
	public String addScore() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			System.out.println(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			return "addScore";
		} else {
			return "login";
		}
	}
	
	public String uploadVideo() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {

			return "uploadVideo";
		} else {
			return "login";
		}
	}
	
	public String deleteVideo() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			TeachVideo findVideoMain = teachVideoService.findVideoMain(teachVideo);
			String basePath=ServletActionContext.getServletContext().getRealPath("/file");
			
			//2.获取 基本路径+日期+文件名称
			File file=new File(basePath + File.separator + findVideoMain.getVideo_path() + "\\video\\" + findVideoMain.getFileFileName());
			if(file.exists()&&file.isFile()) {
	             file.delete();
			}
			if(findVideoMain.getFileFileName()!=null){
				File file1=new File(basePath + File.separator + findVideoMain.getVideo_path() + "\\video\\" + "2" + findVideoMain.getFileFileName().substring(0,findVideoMain.getFileFileName().lastIndexOf(".")) + ".mp4");
				if(file1.exists()&&file1.isFile()) {
					file1.delete();
				}
			}
			String fString = null;
			findVideoMain.setFileFileName(fString);
			teachVideoService.update(findVideoMain);
			ActionContext.getContext().getSession().put("findVideoMain", findVideoMain);
			
			return SUCCESS;
		} else {
			return "login";
		}
	}

	public String download() throws Exception {

		try {
			
		teachVideo = teachVideoService.findVideoMain(teachVideo);
		String basePath=ServletActionContext.getServletContext().getRealPath("/file");
		
		//2.获取字节输入流：基本路径+日期+文件名称
		InputStream inputStream = new FileInputStream(basePath+File.separator+teachVideo.getVideo_path()+"\\video\\"+teachVideo.getFileFileName());
		
		//3.字节输出流
		HttpServletResponse response=ServletActionContext.getResponse();
		OutputStream os=response.getOutputStream();
		
		//4.设置响应消息头
		//响应正文的MIME类型
		//response.setHeader("Content-Type", "application/octet-stream");
		//告知浏览器以下载方式
		response.setHeader("Content-Disposition", "attachment;filename="+java.net.URLEncoder.encode(teachVideo.getFileFileName(),"UTF-8"));
		
		//5.流的操作
		int len=0;
		byte[] by=new byte[1024];
		while ((len=inputStream.read(by))!=-1){
			os.write(by,0,len);
		}

		inputStream.close();
		return NONE;

		} catch (Exception e) {
			return SUCCESS;
		}
	}


	public String upload() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {

			CategoryClass newContent_categoryClass = (CategoryClass) ActionContext.getContext().getSession()
					.get("newContent_categoryClass");
			Course course = new Course();
			course.setCourse_id(teachVideo.getVideo_course_id());
			course = courseService.find(course);
			course.getTeachVideos().add(teachVideo);
			teachVideo.setCourse(course);
			String newbase2 = "\\" + newContent_categoryClass.getCategoryClass_category() + "\\"
					+ newContent_categoryClass.getCategoryClass_name() + "\\" + course.getCourse_name();
			// 2.创建日期目录
			teachVideo.setVideo_path(newbase2);
			String GUIDFileName = teachVideo.getFileFileName();
			System.out.println(GUIDFileName);
			System.out.println(teachVideo);
			teachVideo.setCoursewareHiden(1);
			teachVideoService.save(teachVideo);



			return "uploadSuccess";



			
		} else {
			return "login";
		}
		
		
	}

	public String addContent() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {

			return "newContent";
		} else {
			return "login";
		}
	}

	public String hidenCourseware() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			teachVideo = teachVideoService.findVideoMain(teachVideo);
			if (teachVideo.getCoursewareHiden() == 1) {
				teachVideo.setCoursewareHiden(2);
			}
			else if (teachVideo.getCoursewareHiden() == 2) {
				teachVideo.setCoursewareHiden(1);
			}
			teachVideoService.update(teachVideo);
			teachVideo = teachVideoService.findVideoMain(teachVideo);
			ActionContext.getContext().getSession().put("findVideoMain", teachVideo);
			return SUCCESS;
		} else {
			return "login";
		}
	}
	
	
	public String deleteContent() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			System.out.println(teachVideo);
			teachVideo = teachVideoService.findVideoMain(teachVideo);
			teachVideoService.delete(teachVideo);
			return "deleteContent";
		} else {
			return "login";
		}
	}
	

	private Map<String,Object> dataMap;
	
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String upload2() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			// 1.获取文件的保存路径
			TeachVideo teachVideo1 = (TeachVideo)ActionContext.getContext().getSession().get("findVideoMain");

			String basePath = ServletActionContext.getServletContext().getRealPath("/file");
			

			String newbase = basePath + teachVideo1.getVideo_path() + "\\video";
			System.out.println(newbase);
			// 判断日期是否存在，如果不存在就创建文件目录
			File file = new File(newbase);
			if (!file.exists()) {
				file.mkdirs();
			}

			// 3.把文件名UUID
			//文件名加上上传时间
	        SimpleDateFormat df = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");//设置日期格式
	        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			teachVideo.setFileFileName("(" + df.format(new Date()) + ")" + teachVideo.getFileFileName());
			String GUIDFileName = teachVideo.getFileFileName();
			System.out.println(GUIDFileName);
			// 4.保存文件
			// 复制：临时文件还在，浪费服务器磁盘空间
			// FileUtils.copyFile(visitFile, new File(file,GUIDFileName));
			// 剪切：把临时文件重命名到指定位置（比较好）
			teachVideo.getFile().renameTo(new File(file, GUIDFileName));
			//转码
			
			int code = ConvertVideo.getPath(ServletActionContext.getServletContext().getRealPath("/ffmpeg")+ "\\",newbase+ "\\" + GUIDFileName,newbase + "\\","2" + teachVideo.getFileFileName().substring(0,teachVideo.getFileFileName().lastIndexOf(".")) + ".mp4");
			// 5.设置文件的路径和文件名称
			// visit.setVisitFilePath(datePath);
			// visit.setVisitFileName(GUIDFileName);

			// 保存操作
			// saleVisitService.saveSaleVisit(visit);
			System.out.println(teachVideo);
			teachVideo1.setFileFileName(GUIDFileName);
			teachVideoService.update(teachVideo1);
			dataMap = new HashMap<String,Object>();
			dataMap.clear();  
			dataMap.put("code", code);

			return SUCCESS;
		} else {
			return "login";
		}
		}
	}
