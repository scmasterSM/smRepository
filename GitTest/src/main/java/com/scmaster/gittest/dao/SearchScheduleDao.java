package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchScheduleDao {

	@Autowired
	private SqlSession sqlsession;
	
	public ArrayList<HashMap<String, Object>> filtering(HashMap<String, Object> map,int startRecord, int countPerPage){
		SearchScheduleMapper mapper =sqlsession.getMapper(SearchScheduleMapper.class);
		RowBounds rb= new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, Object>> filter_List=mapper.filtering(map,rb);
		return filter_List;
	}
	
	public int fCount(HashMap<String, Object> map){
		SearchScheduleMapper mapper =sqlsession.getMapper(SearchScheduleMapper.class);
		int result=mapper.fCount(map);
		return result;
	}
	
	public int tCount(){
		SearchScheduleMapper mapper =sqlsession.getMapper(SearchScheduleMapper.class);
		int result=mapper.tCount();
		return result;
	}
	
	public ArrayList<HashMap<String,Object>> all_scd_read(int startRecord, int countPerPage){
		SearchScheduleMapper mapper =sqlsession.getMapper(SearchScheduleMapper.class);
		RowBounds rb= new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, Object>> all_scd_List=mapper.all_scd_read(rb);
		return all_scd_List;
	}
}
