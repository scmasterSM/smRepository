package com.scmaster.gittest.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Daily_City;
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
	//HOME 화면 인기 도시 
		public ArrayList<Daily_City> bestcity(){
			UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			
			return mapper.bestcity();
		}
		
		//SC_05 화면 디테일 도시
		public Daily_City detail_city(String city_nm){
			UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			
			return mapper.detail_city(city_nm);
		}
	
}
