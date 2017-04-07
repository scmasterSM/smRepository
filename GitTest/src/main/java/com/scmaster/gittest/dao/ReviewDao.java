package com.scmaster.gittest.dao;

import java.util.ArrayList;
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
	
	public List<Review> readReview(int startRecord, int countPerPage,String PLACE_NM){
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		RowBounds rb= new RowBounds(startRecord, countPerPage);
		List<Review>rList=mapper.readReview(rb,PLACE_NM); 
		return rList;
	}
	
	public int insertClip(Clip clip){
		ReviewMapper mapper =sqlsession.getMapper(ReviewMapper.class);
		int result;
		result = mapper.insertClip(clip);
		return result;
	}
	
	public List<Clip> readCLip(String USER_ID){
		ReviewMapper mapper =sqlsession.getMapper(ReviewMapper.class);
		List<Clip>cList=mapper.readCLip(USER_ID);
		return cList;
	}
	
	public int tCount(){
		ReviewMapper mapper =sqlsession.getMapper(ReviewMapper.class);
		int result =mapper.tCount();
		return result;
	}
	
}
