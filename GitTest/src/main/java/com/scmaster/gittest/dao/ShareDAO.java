package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShareDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int addShareAuthority(HashMap<String, Object> map){
		ShareMapper mapper = sqlSession.getMapper(ShareMapper.class);
		return mapper.addShareAuthority(map);
	}
	
	public ArrayList<Integer> getSharedScdSq(String userId){
		ShareMapper mapper = sqlSession.getMapper(ShareMapper.class);
		return mapper.getSharedScdSq(userId);
	}

}
