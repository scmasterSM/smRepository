package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Liked;
import com.scmaster.gittest.vo.Schedule;

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
	
	public List<Clip> readCLip(String user_id){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		List<Clip>cList=mapper.readCLip(user_id);
		return cList;
	}
	
	public int deleteClip(Clip clip){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		int result;
		result = mapper.deleteClip(clip);
		return result;
	}
	
	public int insertLiked(Liked liked){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		int result;
		result = mapper.insertLiked(liked);
		return result;
	}
	public List<Liked> readLiked(){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		List<Liked>l_List=mapper.readLiked();
		return l_List;
	}
	public int deleteLiked(Liked liked){
		ClipMapper mapper =sqlsession.getMapper(ClipMapper.class);
		int result=mapper.deleteLiked(liked);
		return result; 
	}
	
}
