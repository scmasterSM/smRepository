package com.scmaster.gittest.dao;

import java.util.ArrayList;

import com.scmaster.gittest.vo.Daily_City;
import com.scmaster.gittest.vo.User;

public interface UserMapper {

	public User login_User(String user_id);
	
	public int join_User(User user);
	
	public int edit_User(User user);
	
	public ArrayList<Daily_City> bestcity();  // 6개의 도시 불러오는 메소드
	
	public Daily_City detail_city(String city_nm); //SC_05 디테일 도시 
}
