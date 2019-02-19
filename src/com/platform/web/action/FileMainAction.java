package com.platform.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.FileMain;
import com.platform.domain.TeachVideo;
import com.platform.domain.User;
import com.platform.service.FileService;
import com.platform.service.TeachVideoService;

public class FileMainAction extends ActionSupport implements ModelDriven<FileMain> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1271056983654217503L;

	private FileMain fileMain = new FileMain();

	@Override
	public FileMain getModel() {
		return fileMain;
	}

	private TeachVideoService teachVideoService;

	public TeachVideoService getTeachVideoService() {
		return teachVideoService;
	}

	public void setTeachVideoService(TeachVideoService teachVideoService) {
		this.teachVideoService = teachVideoService;
	}

	private FileService fileService;

	public FileService getFileService() {
		return fileService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}

	private Map<String, Object> dataMap;

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String upload() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			System.out.println(fileMain);
			// 1.获取文件的保存路径
			TeachVideo teachVideo1 = (TeachVideo) ActionContext.getContext().getSession().get("findVideoMain");
			User user = (User) ActionContext.getContext().getSession().get("user");
			String basePath = ServletActionContext.getServletContext().getRealPath("/file");

			String newbase = basePath + teachVideo1.getVideo_path() + "\\courseware";
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
	        fileMain.setFileFileName("(" + df.format(new Date()) + ")" + fileMain.getFileFileName());
			String GUIDFileName = fileMain.getFileFileName();
			System.out.println(GUIDFileName);
			// 4.保存文件
			// 复制：临时文件还在，浪费服务器磁盘空间
			// FileUtils.copyFile(visitFile, new File(file,GUIDFileName));
			// 剪切：把临时文件重命名到指定位置（比较好）
			fileMain.getFile().renameTo(new File(file, GUIDFileName));

			// 5.设置文件的路径和文件名称
			// visit.setVisitFilePath(datePath);
			// visit.setVisitFileName(GUIDFileName);

			// 保存操作
			// saleVisitService.saveSaleVisit(visit);

			fileMain.setFile_path(teachVideo1.getVideo_path());
			System.out.println(fileMain);
			teachVideo1.setFileFileName(GUIDFileName);
			fileMain.setUser(user);
			fileMain.setTeachVideo(teachVideo1);
			user.getFileMains().add(fileMain);
			teachVideo1.getFileMains().add(fileMain);
			ActionContext.getContext().getSession().put("user", user);
			fileService.save(fileMain);
			dataMap = new HashMap<String, Object>();
			dataMap.clear();
			dataMap.put("code", 200);

			return SUCCESS;
		} else {
			return "login";
		}
	}

	public String deleteCourseware() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			fileMain = fileService.find(fileMain);
			if (fileMain != null) {
				String basePath=ServletActionContext.getServletContext().getRealPath("/file");
				File file=new File(basePath + File.separator + fileMain.getFile_path() + "\\courseware\\" + fileMain.getFileFileName());
				if(file.exists()&&file.isFile()) {
		             file.delete();
				}
				fileService.delete(fileMain);
				TeachVideo teachVideo = (TeachVideo) ActionContext.getContext().getSession().get("findVideoMain");
				teachVideo = teachVideoService.findVideoMain(teachVideo);
				System.out.println(teachVideo);
				ActionContext.getContext().getSession().put("findVideoMain", teachVideo);
			}
			return "deleteCourseware";
		} else {
			return "login";
		}
	}
	
	public String deleteHomework() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			fileMain = fileService.find(fileMain);
			if (fileMain != null) {
				String basePath=ServletActionContext.getServletContext().getRealPath("/file");
				File file=new File(basePath + File.separator + fileMain.getFile_path() + "\\courseware\\" + fileMain.getFileFileName());
				if(file.exists()&&file.isFile()) {
		             file.delete();
				}
				fileService.delete(fileMain);
				TeachVideo teachVideo = (TeachVideo) ActionContext.getContext().getSession().get("findVideoMain");
				teachVideo = teachVideoService.findVideoMain(teachVideo);
				System.out.println(teachVideo);
				ActionContext.getContext().getSession().put("findVideoMain", teachVideo);
			}
			return "deleteHomework";
		} else {
			return "login";
		}
	}

	public String download() throws Exception {

		try {
			fileMain = fileService.find(fileMain);

			String basePath = ServletActionContext.getServletContext().getRealPath("/file");

			// 2.获取字节输入流：基本路径+日期+文件名称
			InputStream inputStream = new FileInputStream(basePath + File.separator + fileMain.getFile_path()
					+ "\\courseware\\" + fileMain.getFileFileName());

			// 3.字节输出流
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = response.getOutputStream();

			// 4.设置响应消息头
			// 响应正文的MIME类型
			// response.setHeader("Content-Type", "application/octet-stream");
			// 告知浏览器以下载方式
			response.setHeader("Content-Disposition",
					"attachment;filename=" + java.net.URLEncoder.encode(fileMain.getFileFileName(), "UTF-8"));

			// 5.流的操作
			int len = 0;
			byte[] by = new byte[1024];
			while ((len = inputStream.read(by)) != -1) {
				os.write(by, 0, len);
			}

			inputStream.close();
			return NONE;

		} catch (Exception e) {
			return SUCCESS;
		}
	}
	
	private List<FileMain> fileMains;

	public List<FileMain> getFileMains() {
		return fileMains;
	}

	public void setFileMains(List<FileMain> fileMains) {
		this.fileMains = fileMains;
	}

	public String addScore() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			for (FileMain fileMain : fileMains) {
				FileMain fileMain1 = new FileMain();
				System.out.println(fileMain);
				fileMain1.setFile_id(fileMain.getFile_id());
				fileMain1 = fileService.find(fileMain1);
				if ( !fileMain.getFile_score().equals("")) {
					fileMain1.setFile_score(fileMain.getFile_score());
				}
				if ( !fileMain.getFile_assess().equals("")) {
					
					fileMain1.setFile_assess(fileMain.getFile_assess());
				}
				fileService.update(fileMain1);
			}
			
			TeachVideo teachVideo = (TeachVideo) ActionContext.getContext().getSession().get("findVideoMain");
			teachVideo = teachVideoService.findVideoMain(teachVideo);
			System.out.println(teachVideo);
			ActionContext.getContext().getSession().put("findVideoMain", teachVideo);
			return "addScore";
		} else {
			return "login";
		}
	}
	
}
