package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.gittest.vo.Reply;


public interface ReplyMapper {
	
	public int writeReply(Reply reply);
	
	public ArrayList<HashMap<String, Object>> readReply(RowBounds rb,Reply reply);
	 
	public int tCount(int scd_sq);
	
	public ArrayList<HashMap<String, Object>> readReply(Reply reply);
	
	public int updateReply(Reply reply);
	
	public int deleteReply(Reply reply);
 
}
