package com.scmaster.gittest.dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.gittest.vo.Budget;
import com.scmaster.gittest.vo.Daily_City;
import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

@Repository
public class ScheduleDAO {

	@Autowired
	private SqlSession sqlSession;

	// 메인 스케줄 저장
	public int insert_scd(Schedule schedule) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.insert_scd(schedule);

		int scd_sq = mapper.getScd_Sq(schedule.getUser_id());
		return scd_sq;
	}

	// 일차 스케줄 저장
	public void insert_daily(Daily_Scd daily) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.insert_daily(daily);
		int daily_sq = mapper.getDaily(daily);
		daily.setDaily_sq(daily_sq);
		if (daily.getArea_code() != null) {
			mapper.insert_city(daily);
		}
	}

	// 일차 스케줄 리스트 가져오기
	public List<HashMap<String, Object>> getDailyList(int scd_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		List<HashMap<String, Object>> dailyList = mapper.getDailyList(scd_sq);
		return dailyList;
	}

	// 추가한 장소 저장
	public int insert_dtl(Dtl_Scd dtl_scd) {
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

	// 일차별 장소 리스트 가져오기
	public List<HashMap<String, Object>> getDtlList(Dtl_Scd dtl_scd) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Daily_Scd daily = new Daily_Scd();
		daily.setScd_sq(dtl_scd.getScd_sq());
		daily.setDaily_ord(dtl_scd.getDaily_sq());
		int daily_sq = mapper.getDaily(daily);
		dtl_scd.setDaily_sq(daily_sq);
		List<HashMap<String, Object>> dtlList = mapper.getDtlList(dtl_scd);
		return dtlList;
	}

	// 장소 순서 변경
	public void sort_change(Dtl_Scd dtl_scd) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.sort_change(dtl_scd);
	}

	// 장소 삭제
	public void delete_place(int dtl_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.delete_place(dtl_sq);
	}

	// 일차별 도시 업데이트
	public void update_cities(Daily_City city) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		int daily_sq = mapper.getDailySq(city);
		city.setDaily_sq(daily_sq);
		int city_cnt = mapper.getDcityCnt(city);
		if (city_cnt == 0) {
			mapper.insert_dcity(city);
			return;
		}
		if (city_cnt >= city.getCity_cnt()) {
			// delete
			int delete_cnt = city_cnt - city.getCity_cnt();
			for (int i = 0; i < delete_cnt; i++) {
				int max_ord = mapper.getMaxCityord(city);
				city.setMax_ord(max_ord);
				mapper.delete_dcity(city);
			}
			// update
			mapper.update_dcity(city);
		} else {
			if (city_cnt >= city.getCity_ord()) {
				// update
				mapper.update_dcity(city);
			} else {
				// insert
				mapper.insert_dcity(city);
			}
		}
	}

	// 예산 및 메모 가져오기
	public Budget getBudgetMemo(int dtl_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Budget budget = mapper.getBudgetMemo(dtl_sq);
		return budget;
	}

	// 예산 및 메모 업데이트
	public void update_bgt(Budget budget) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Daily_City daily = new Daily_City();
		daily.setScd_sq(budget.getScd_sq());
		daily.setDaily_sq(budget.getDaily_sq());
		int daily_sq = mapper.getDailySq(daily);
		budget.setDaily_sq(daily_sq);
		int bgt_sq = mapper.getBgtUpdateCheck(budget);
		if (bgt_sq == 0) {
			mapper.insert_bgt(budget);
		} else {
			mapper.update_bgt(budget);
		}
		mapper.update_memo(budget);
	}

	// 일차별 예산 가져오기
	public Budget get_daily_budget(Budget budget) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Daily_City daily = new Daily_City();
		daily.setScd_sq(budget.getScd_sq());
		daily.setDaily_sq(budget.getDaily_sq());
		int daily_sq = mapper.getDailySq(daily);
		budget.setDaily_sq(daily_sq);
		Budget result = mapper.get_daily_budget(budget);
		return result;
	}

	// 일정 총 예산 가져오기
	public Budget get_budget_total(Budget budget) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Budget result = mapper.get_budget_total(budget);
		return result;
	}

	// 삭제용 리스트 가져오기
	public List<HashMap<String, Object>> get_daily_list(int scd_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		List<HashMap<String, Object>> dailyList = mapper.getDailyList(scd_sq);
		List<HashMap<String, Object>> new_dailyList = new LinkedList<>();
		for (int i = 0; i < dailyList.size(); i++) {
			HashMap<String, Object> daily = dailyList.get(i);
			int daily_sq = Integer.parseInt(String.valueOf(daily.get("DAILY_SQ")));
			List<HashMap<String, Object>> cityList = mapper.get_city_list(daily_sq);
			String city_nm = "";
			for (int j = 0; j < cityList.size(); j++) {
				if (j == 0)
					city_nm += cityList.get(j).get("CITY_NM");
				else
					city_nm += ", " + cityList.get(j).get("CITY_NM");
			}
			daily.put("CITY_NM", city_nm);
			new_dailyList.add(daily);
		}
		return new_dailyList;
	}

	// 일자 삭제
	public void delete_day(int daily_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.delete_day(daily_sq);
	}

	// 일차 순서 변경
	public void day_sort_change(Daily_Scd daily) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.day_sort_change(daily);
	}

	// 일차 날짜 변경
	public void day_change(Daily_Scd daily) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.day_change(daily);
	}
}
