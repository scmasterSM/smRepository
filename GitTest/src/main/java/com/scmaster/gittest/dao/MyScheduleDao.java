package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

@Repository
public class MyScheduleDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public ArrayList<HashMap<String, Object>> read_scd(String user_id){
		MyScheduleMapper mapper=sqlsession.getMapper(MyScheduleMapper.class);
		ArrayList<HashMap<String, Object>>scdList=mapper.read_scd(user_id);
		return scdList;
	}
	
	public ArrayList<HashMap<String, Object>> shared_read_scd(String user_id){
		MyScheduleMapper mapper=sqlsession.getMapper(MyScheduleMapper.class);
		ArrayList<HashMap<String, Object>>scdList=mapper.shared_read_scd(user_id);
		return scdList;
	}
	
	public ArrayList<HashMap<String, Object>> read_scd_info(int scd_sq){
		MyScheduleMapper mapper=sqlsession.getMapper(MyScheduleMapper.class);
		ArrayList<HashMap<String, Object>>rscdList=mapper.read_scd_info(scd_sq);
		return rscdList;
	}
	
	public ArrayList<HashMap<String, Object>> scd_daily_ymd(int scd_sq){
		MyScheduleMapper mapper=sqlsession.getMapper(MyScheduleMapper.class);
		ArrayList<HashMap<String, Object>> d_scdList=mapper.scd_daily_ymd(scd_sq);
		return d_scdList;
	}
	public ArrayList<Dtl_Scd> scd_info(int scd_sq){
		MyScheduleMapper mapper=sqlsession.getMapper(MyScheduleMapper.class);
		ArrayList<Dtl_Scd> info_List=mapper.scd_info(scd_sq);
		return info_List;
	}
	public Dtl_Scd get_citylatlng(Dtl_Scd areasigungu){
		MyScheduleMapper mapper=sqlsession.getMapper(MyScheduleMapper.class);
		Dtl_Scd latlng = mapper.get_citylatlng(areasigungu);
		return latlng;
	}
	
	
}
