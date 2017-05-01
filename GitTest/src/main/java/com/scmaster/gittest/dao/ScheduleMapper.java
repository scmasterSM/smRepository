package com.scmaster.gittest.dao;

import java.util.HashMap;
import java.util.List;

import com.scmaster.gittest.vo.Budget;
import com.scmaster.gittest.vo.Daily_City;
import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

public interface ScheduleMapper {
	public void insert_scd(Schedule schedule);
	public void update_scd_info(Schedule schedule);
	public void edit_start_ymd(Schedule schedule);
	public int getScd_Sq(String user_id);
	public Schedule select_scd(int scd_sq);
	public void delete_scd(int scd_sq);
	public void update_scd(Schedule schedule);
	public void insert_daily(Daily_Scd daily);
	public int getDaily(Daily_Scd daily);
	public List<HashMap<String, Object>> get_shared_users(int scd_sq);
	public void insert_city(Daily_Scd new_daily);
	public List<HashMap<String, Object>> getDailyList(int scd_sq);
	public int insert_dtl(Dtl_Scd dtl_scd);
	public int getDtlsq(Dtl_Scd dtl_scd);
	public List<HashMap<String, Object>> getDtlList(Dtl_Scd dtl_scd);
	public void sort_change(Dtl_Scd dtl_scd);
	public void delete_place(int dtl_sq);
	public void update_dcity(Daily_City city);
	public int getDcitycnt(Daily_City city);
	public void delete_dcity(Daily_City city);
	public void insert_dcity(Daily_City city);
	public int getMaxCityord(Daily_City city);
	public int getDcityCnt(Daily_City city);
	public int getDailySq(Daily_City city);
	public Budget getBudgetMemo(int dtl_sq);
	public int getBgtUpdateCheck(Budget budget);
	public void insert_bgt(Budget budget);
	public void update_bgt(Budget budget);
	public void update_memo(Budget budget);
	public Budget get_daily_budget(Budget budget);
	public Budget get_budget_total(Budget budget);
	public List<HashMap<String, Object>> get_daily_list(int scd_sq);
	public List<HashMap<String, Object>> get_city_list(int daily_sq);
	public List<HashMap<String, Object>> get_city_listAll(int daily_sq);
	public void delete_day(int daily_sq);
	public void day_sort_change(Daily_Scd daily);
	public void day_change(Daily_Scd daily);
	public List<HashMap<String, Object>> get_cliplist(String user_id);
}
