package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;



@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int writeReview(Review review){
		ReviewMapper mapper =sqlsession.getMapper(ReviewMapper.class);
		int result;
		result = mapper.writeReview(review);
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> readReview(int startRecord, int countPerPage,Review review){
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		RowBounds rb= new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, Object>>rList=mapper.readReview(rb,review); 
		return rList;
	}
	
	public ArrayList<HashMap<String, Object>> readReview(Review review){
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		ArrayList<HashMap<String, Object>>rList=mapper.readReview(review); 
		return rList;

	}
	
	public int updateReview(Review review){
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		int result = mapper.updateReview(review);
		return result;
	}
	
	public int deleteReview(Review review){
		ReviewMapper mapper =sqlsession.getMapper(ReviewMapper.class);
		int result =mapper.deleteReview(review);
		return result;
	}
	

	
	public int tCount(String CONTENT_ID){
		ReviewMapper mapper =sqlsession.getMapper(ReviewMapper.class);
		int result =mapper.tCount(CONTENT_ID);
		return result;
	}
	
	
	
}
