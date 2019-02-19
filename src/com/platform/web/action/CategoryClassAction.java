package com.platform.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.CategoryClass;
import com.platform.domain.User;
import com.platform.service.CategoryClassService;
import com.platform.service.UserService;

public class CategoryClassAction extends ActionSupport implements ModelDriven<CategoryClass> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2744535381949129521L;
	private CategoryClass categoryClass = new CategoryClass();

	@Override
	public CategoryClass getModel() {
		return categoryClass;
	}

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	private CategoryClassService categoryClassService;

	public void setCategoryClassService(CategoryClassService categoryClassService) {
		this.categoryClassService = categoryClassService;
	}

//	public String findCategoryClass() {
//		if (ActionContext.getContext().getSession().get("login_err") != null) {
//			List<CategoryClass> findCategoryClass = categoryClassService.findCategoryClass(categoryClass);
//			ActionContext.getContext().getSession().put("findCategoryClass", findCategoryClass);
//			return "teachVideo";
//		} else {
//			return "login";
//		}
//	}
	
	public String search() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			List<CategoryClass> search_categoryClasses = categoryClassService.search(categoryClass.getCategoryClass_name());
			ActionContext.getContext().getSession().put("search_categoryClasses", search_categoryClasses);
			return SUCCESS;
		} else {
			return "login";
		}
	}
	
	public String collect() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			try {	
			System.out.println(categoryClass.getCategoryClass_id());
			categoryClass = categoryClassService.collect(categoryClass);
			System.out.println(categoryClass);
			User user = (User) ActionContext.getContext().getSession().get("user");
			user.getCategoryClasses2().add(categoryClass);
			categoryClass.getUsers2().add(user);
			userService.collect(user);	
			return "video";
			} catch (Exception e) {
				return "video";
			}
		} else {
			return "login";
		}
	}
	
	
	public String addClass() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			User user = (User) ActionContext.getContext().getSession().get("user");
			user.getCategoryClasses().add(categoryClass);
			categoryClass.setUser(user);
			ActionContext.getContext().getSession().clear();
			categoryClassService.addClass(categoryClass);
			user = userService.findUser(user);
			ActionContext.getContext().getSession().put("user", user);
			ActionContext.getContext().getSession().put("login_err", false);
			return "newClass";
		} else {
			return "login";
		}
	}
	
	public String deleteClass() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			User user = (User) ActionContext.getContext().getSession().get("user");
			CategoryClass categoryClass2 = categoryClassService.collect(categoryClass);
			
			ActionContext.getContext().getSession().clear();
			categoryClassService.deleteClass(categoryClass2);
			user = userService.findUser(user);
			System.out.println(user);
			ActionContext.getContext().getSession().put("user", user);
			ActionContext.getContext().getSession().put("login_err", false);
			return "newClass";
		} else {
			return "login";
		}
	}
	
	
	public String newCatalog() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			CategoryClass categoryClass2 = categoryClassService.collect(categoryClass);
			ActionContext.getContext().getSession().put("newCatalog_categoryClass", categoryClass2);
			System.out.println(categoryClass2);
			return "newCatalog";
		}
		else {
			return "login";
		}
	}
	
	public String deleteCatalog() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			CategoryClass categoryClass2 = categoryClassService.collect(categoryClass);
			ActionContext.getContext().getSession().put("deleteCatalog_categoryClass", categoryClass2);
			System.out.println(categoryClass2);
			return "deleteCatalog";
		}
		else {
			return "login";
		}
	}
	
	public String newContent() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			CategoryClass categoryClass2 = categoryClassService.collect(categoryClass);
			ActionContext.getContext().getSession().put("newContent_categoryClass", categoryClass2);
			System.out.println(categoryClass2);
			return "newContent";
		}
		else {
			return "login";
		}
	}
	
	public String deleteContent() {
		if(ActionContext.getContext().getSession().get("login_err") != null) {
			CategoryClass categoryClass2 = categoryClassService.collect(categoryClass);
			ActionContext.getContext().getSession().put("deleteContent_categoryClass", categoryClass2);
			System.out.println(categoryClass2);
			return "deleteContent";
		}
		else {
			return "login";
		}
	}
	
	public String findAll() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			categoryClass = categoryClassService.collect(categoryClass);
			ActionContext.getContext().getSession().put("course_categoryClass", categoryClass);
			return "video2";
		} else {
			return "login";
		}
		
	}

}
