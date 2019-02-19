package com.platform.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.Category;
import com.platform.domain.CategoryClass;
import com.platform.domain.Course;
import com.platform.service.CategoryClassService;
import com.platform.service.CategoryService;
import com.platform.service.CourseService;
import com.platform.service.TeachVideoService;

public class CourseAction extends ActionSupport implements ModelDriven<Course> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3292642806555688533L;
	private CourseService courseService;

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	private TeachVideoService teachVideoService;

	public void setTeachVideoService(TeachVideoService teachVideoService) {
		this.teachVideoService = teachVideoService;
	}

	private CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	private CategoryClassService categoryClassService;

	public void setCategoryClassService(CategoryClassService categoryClassService) {
		this.categoryClassService = categoryClassService;
	}
	
	private Course course = new Course();

	@Override
	public Course getModel() {
		return course;
	}
	

	public String search() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			System.out.println(course.getCourse_name());
			List<Course> search_courses = courseService.search(course.getCourse_name());
			ActionContext.getContext().getSession().put("search_courses", search_courses);
			return SUCCESS;
		} else {
			return "login";
		}
	}

	public String video() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			List<Category> categorys = categoryService.findAll(new Category());
			ActionContext.getContext().getSession().put("categorys", categorys);
			List<CategoryClass> findCategoryClass = categoryClassService.findCategoryClass(new CategoryClass());
			ActionContext.getContext().getSession().put("findCategoryClass", findCategoryClass);
			return "video";
		} else {
			return "login";
		}
	}

	public String teachVideo() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			System.out.println("1");
			System.out.println(course);
			Course Videos = teachVideoService.findTeachVideo(course);
			System.out.println("2");
			System.out.println(Videos);
			ActionContext.getContext().getSession().put("Videos", Videos);
			return "teachVideo";
			}
		else {
			return "login";
		}
	}
	
	
	
	public String addCatalog() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			CategoryClass newCatalog_categoryClass = (CategoryClass) ActionContext.getContext().getSession().get("newCatalog_categoryClass");
			course.setCourse_category(newCatalog_categoryClass.getCategoryClass_name());
			CategoryClass categoryClass2 = categoryClassService.collect(newCatalog_categoryClass);
			categoryClass2.getCourses().add(course);
			course.setCategoryClass(categoryClass2);
			System.out.println(course);
			courseService.save(course);
			return "newCatalog";
		}
		else {
			return "login";
		}
	}
	
	
	public String deleteCatalog() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			course = courseService.find(course);
			System.out.println(course);
			courseService.delete(course);
			return "deleteCatalog";
		}
		else {
			return "login";
		}
	}
}
