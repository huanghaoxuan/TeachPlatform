package com.platform.service;

import java.util.List;

import com.platform.domain.User;

public interface UserService {

	/**
	 * 验证用户名密码是否正确
	 * @param user
	 * @return
	 */
	public List<User> validate(User user);
	public User findUser(User user);
	
	/**
	 * 注册
	 * @param user
	 */
	public void register(User user);
	public void collect(User user);
}
