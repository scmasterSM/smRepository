package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ShareMapper {
	
	public int addShareAuthority(HashMap<String, Object> map);
	public ArrayList<Integer> getSharedScdSq(String userId);
}
