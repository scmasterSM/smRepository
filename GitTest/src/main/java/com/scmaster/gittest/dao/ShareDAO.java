package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Shared_Scd;

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
	
	public Shared_Scd authorityDupChk(HashMap<String, Object> map){
		ShareMapper mapper = sqlSession.getMapper(ShareMapper.class);
		Shared_Scd shared_scd = mapper.authorityDupChk(map);
		return shared_scd;
	}
	
	public Daily_Scd get_Daily_Scd(int dtl_sq){
		ShareMapper mapper = sqlSession.getMapper(ShareMapper.class);
		Daily_Scd daily_Scd = mapper.get_Dtl_Scd(dtl_sq);
		return daily_Scd;
	}
	
	public int get_daily_ord(int daily_sq){
		ShareMapper mapper = sqlSession.getMapper(ShareMapper.class);
		int daily_ord = mapper.get_daily_ord(daily_sq);
		return daily_ord;
	}
	
}
