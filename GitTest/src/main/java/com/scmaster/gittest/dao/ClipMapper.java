package com.scmaster.gittest.dao;

import java.util.List;

import com.scmaster.gittest.vo.Clip;

public interface ClipMapper {

	public int insertClip(Clip clip);
	
	public List<Clip> readCLip(String USER_ID);
	
}
