package com.platform.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.platform.DAO.UserDAO;
import com.platform.domain.User;
import com.platform.service.UserService;
import com.platform.web.action.UserAction;


@Transactional
@SuppressWarnings("unused")
public class UserServiceImpl implements UserService {

	private UserDAO userDAO;

	

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	/**
	 * 验证用户名密码是否正确
	 */
	@Override
	public List<User> validate(User user) {
		return userDAO.validate(user);

	}

	/**
	 * 注册
	 */
	@Override
	public void register(User user) {
		userDAO.register(user);

	}
	public void collect(User user) {
		userDAO.collect(user);
		
	}

	@Override
	public User findUser(User user) {
		return userDAO.findUser(user);
	}

}
