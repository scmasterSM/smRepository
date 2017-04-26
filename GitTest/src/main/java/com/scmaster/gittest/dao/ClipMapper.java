package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Schedule;

public interface ClipMapper {

	public int insertClip(Clip clip);
	
	public List<Clip> readCLip(String user_id);
	
	public int deleteClip(Clip clip); 
}
