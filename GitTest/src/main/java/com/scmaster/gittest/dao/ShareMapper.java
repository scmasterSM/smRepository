package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Shared_Scd;

public interface ShareMapper {
	
	public int addShareAuthority(HashMap<String, Object> map);
	public ArrayList<Integer> getSharedScdSq(String userId);
	public Shared_Scd authorityDupChk(HashMap<String, Object> map);
	public Daily_Scd get_Dtl_Scd(int dtl_sq);
	public int get_daily_ord(int daily_sq);
}
