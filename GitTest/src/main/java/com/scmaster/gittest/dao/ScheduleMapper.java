package com.scmaster.gittest.dao;

import java.util.HashMap;
import java.util.List;

import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

public interface ScheduleMapper {
	public void insert_scd(Schedule schedule);
	public int getScd_Sq(String user_id);
	public void insert_daily(Daily_Scd daily);
	public int getDaily(Daily_Scd daily);
	public void insert_city(Daily_Scd new_daily);
	public List<HashMap<String, Object>> getDailyList(int scd_sq);
	public int insert_dtl(Dtl_Scd dtl_scd);
	public int getDtlsq(Dtl_Scd dtl_scd);
	public List<HashMap<String, Object>> getDtlList(Dtl_Scd dtl_scd);
	public void sort_change(Dtl_Scd dtl_scd);
	public void delete_place(int dtl_sq);
}