package com.scmaster.gittest.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

@Repository
public class ScheduleDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//메인 스케줄 저장
	public int insert_scd(Schedule schedule){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.insert_scd(schedule);	
		
		int scd_sq = mapper.getScd_Sq(schedule.getUser_id());
		return scd_sq;
	}
	
	//일차 스케줄 저장
	public void insert_daily(Daily_Scd daily){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.insert_daily(daily);
		int daily_sq = mapper.getDaily(daily);
		daily.setDaily_sq(daily_sq);
		if(daily.getArea_code() != null){
			mapper.insert_city(daily);
		}
	}
	
	//일차 스케줄 리스트 가져오기
	public List<HashMap<String, Object>> getDailyList(int scd_sq){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		List<HashMap<String, Object>> dailyList = mapper.getDailyList(scd_sq);
		return dailyList;
	}
	
	//추가한 장소 저장
	public int insert_dtl(Dtl_Scd dtl_scd){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Daily_Scd daily = new Daily_Scd();
		daily.setScd_sq(dtl_scd.getScd_sq());
		daily.setDaily_ord(dtl_scd.getDaily_sq());
		int daily_sq = mapper.getDaily(daily);
		dtl_scd.setDaily_sq(daily_sq);
		mapper.insert_dtl(dtl_scd);
		int dtl_sq = mapper.getDtlsq(dtl_scd);
		return dtl_sq;
	}
	
	//일차별 장소 리스트 가져오기
	public List<HashMap<String, Object>> getDtlList(Dtl_Scd dtl_scd){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Daily_Scd daily = new Daily_Scd();
		daily.setScd_sq(dtl_scd.getScd_sq());
		daily.setDaily_ord(dtl_scd.getDaily_sq());
		int daily_sq = mapper.getDaily(daily);
		dtl_scd.setDaily_sq(daily_sq);
		List<HashMap<String, Object>> dtlList = mapper.getDtlList(dtl_scd);
		return dtlList;
	}
	
	//장소 순서 변경
	public void sort_change(Dtl_Scd dtl_scd){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.sort_change(dtl_scd);
	}
	
	//장소 삭제
	public void delete_place(int dtl_sq){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.delete_place(dtl_sq);
	}
}
