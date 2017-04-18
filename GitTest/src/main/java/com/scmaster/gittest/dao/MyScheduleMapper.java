package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

public interface MyScheduleMapper {

	
	public ArrayList<HashMap<String, Object>> read_scd(String user_id);
	public ArrayList<HashMap<String, Object>> read_scd_info(int scd_sq);
	public ArrayList<HashMap<String, Object>> scd_daily_ymd(int scd_sq);
	public ArrayList<Dtl_Scd> scd_info(int scd_sq);
	
}
