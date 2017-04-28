package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;




public interface ReviewMapper { 
	
	public int writeReview(Review review);
	
	public ArrayList<HashMap<String, Object>> readReview(RowBounds rb,Review review);
	 
	public int tCount(String CONTENT_ID);
	
	public ArrayList<HashMap<String, Object>> readReview(Review review);
	
	public int updateReview(Review review);
	
	public int deleteReview(Review review);
	
	public ArrayList<Review> readReview_all();
	
}
