package com.platform.DAO.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.platform.DAO.UserDAO;
import com.platform.domain.User;

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO {

	/**
	 * 验证用户名密码是否正确
	 */
	@Override
	public List<User> validate(User user) {
		
		List<User> list = (List<User>) this.getHibernateTemplate().findByExample(user);
		return list;

	}

	/**
	 * 注册
	 */
	@Override
	public void register(User user) {
		this.getHibernateTemplate().save(user);
	}
	
	public void collect(User user) {
		this.getHibernateTemplate().update(user);		
	}

	@Override
	public User findUser(User user) {
		User user2 = (User) this.getHibernateTemplate().get(User.class,user.getUser_id());
		return user2;
	}

}
