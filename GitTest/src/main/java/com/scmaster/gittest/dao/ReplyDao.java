package com.scmaster.gittest.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Reply;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int writeReply(Reply reply){
		ReplyMapper mapper=sqlsession.getMapper(ReplyMapper.class);
		int result=mapper.writeReply(reply);
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> readReply(int startRecord, int countPerPage,Reply reply){
		ReplyMapper mapper=sqlsession.getMapper(ReplyMapper.class);
		RowBounds rb= new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, Object>>rList=mapper.readReply(rb,reply);
		return rList;
	}
	
	public ArrayList<HashMap<String, Object>> readReply(Reply reply){
		ReplyMapper mapper=sqlsession.getMapper(ReplyMapper.class);		
		ArrayList<HashMap<String, Object>>rList=mapper.readReply(reply);
		return rList;
	}
	 
	public int tCount(int scd_sq){
		ReplyMapper mapper =sqlsession.getMapper(ReplyMapper.class);
		int result =mapper.tCount(scd_sq);
		return result;
	}
	
	public int updateReply(Reply reply){
		ReplyMapper mapper = sqlsession.getMapper(ReplyMapper.class);
		int result = mapper.updateReply(reply);
		return result;
	}
	
	public int deleteReply(Reply reply){
		ReplyMapper mapper =sqlsession.getMapper(ReplyMapper.class);
		int result =mapper.deleteReply(reply);
		return result;
	}
}
