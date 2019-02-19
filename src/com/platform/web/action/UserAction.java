package com.platform.web.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.platform.domain.User;
import com.platform.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3451866575089247919L;

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private User user = new User();

	@Override
	public User getModel() {
		return user;
	}

	//用于首页跳转
	public String newlogin() {
		return "login";
	}
	/**
	 * 验证用户名密码是否正确 在session中传入参数 "login_err" 用于判断登录是否失败 用于login.jsp界面的登录失败的弹窗
	 * false为用户名密码验证成功 true为用户名密码验证失败
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		if (user.getUser_name() != null) {

			List<User> users = userService.validate(user);
			if (!users.isEmpty()) {
				ActionContext.getContext().getSession().put("login_err", false);
				for (User user : users) {
					ActionContext.getContext().getSession().put("user", user);
					System.out.println(user);
				}
				return SUCCESS;
			} else {
				ActionContext.getContext().getSession().put("login_err", true);
				return "login";
			}
		} else if (user1 != null) {
			List<User> users = userService.validate(user1);
			if (!users.isEmpty()) {
				ActionContext.getContext().getSession().put("login_err", false);
				for (User user : users) {
					ActionContext.getContext().getSession().put("user", user);
				}
				return SUCCESS;
			} else {
				ActionContext.getContext().getSession().put("login_err", true);
				return "login";
			}
		}

		else {
			return "login";
		}
	}

	/**
	 * 注册
	 * 
	 * @return
	 * @throws Exception
	 */
	public String register() throws Exception {
		// 接受参数
		userService.register(user);
		return "login";
	}
	
	
	public String personSpace() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
		return "personSpace";
		} else {
			return "login";
		}
	}
	public String homePage() {
		if (ActionContext.getContext().getSession().get("login_err") != null) {
			return SUCCESS;
		} else {
			return "login";
		}
	}

	/**
	 * 验证注册时的用户名密码是否被占用 用于判断用户名是否可用 用于login.jsp界面的注册用户名时的验证 false为用户名未被占用
	 * true为用户名被占用
	 * 
	 * @return
	 * @throws Exception
	 */
	public void register_name_validate() throws Exception {
		// 接受参数
		ActionContext ac = ActionContext.getContext();
		HttpServletResponse response = (HttpServletResponse) ac.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=utf-8");
		if (!userService.validate(user).isEmpty()) {

			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
}
