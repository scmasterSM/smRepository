package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

public interface SearchScheduleMapper {
	
	public ArrayList<HashMap<String,Object>> filtering(HashMap<String, Object> map,RowBounds rb);
	
	public int fCount(HashMap<String, Object> map);
	
	public int tCount();
	
	public ArrayList<HashMap<String,Object>> all_scd_read(RowBounds rb);
}
