package com.scmaster.gittest.dao;

import com.scmaster.gittest.vo.User;

public interface UserMapper {

	public User login_User(String user_id);
	
	public int join_User(User user);
	
	public int edit_User(User user);
}
