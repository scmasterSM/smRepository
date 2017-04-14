package com.scmaster.gittest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
    public User login_User(String user_id){
    	UserMapper mapper = sqlSession.getMapper(UserMapper.class);
    	User user2 = mapper.login_User(user_id);
    	return user2;
    }
	
	public int join_User(User user){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		try{
			result = mapper.join_User(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int edit_User(User user){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		try{
			result = mapper.edit_User(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
}
