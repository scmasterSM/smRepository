package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.List;

import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;




public interface ReviewMapper {
	
	public int writeReview(Review review);
	
	public List<Review> readReview(String PLACE_NM);
	
	public int insertClip(Clip clip);
	
	public List<Clip> readCLip(String USER_ID);
}
