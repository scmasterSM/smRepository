package com.scmaster.gittest.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Clip;

@Repository
public class ClipDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insertClip(Clip clip){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		int result;
		result = mapper.insertClip(clip);
		return result;
	}
	
	public List<Clip> readCLip(String USER_ID){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		List<Clip>cList=mapper.readCLip(USER_ID);
		return cList;
	}
	
}