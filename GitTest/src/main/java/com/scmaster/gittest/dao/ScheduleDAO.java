package com.scmaster.gittest.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;
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

	// 메인 스케줄  수정
	public void update_scd_info(Schedule schedule) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.update_scd_info(schedule);
	}

	// 메인 스케줄  삭제
	public void delete_scd(int scd_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.delete_scd(scd_sq);
	}


	// 메인 스케줄 가져오기
	public Schedule select_scd(int scd_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		Schedule schedule = mapper.select_scd(scd_sq);
		return schedule;
	}

	// 메인 스케줄 타이틀 수정
	public void update_scd(Schedule schedule) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.update_scd(schedule);
	}

	// 메인 스케줄 시작일 수정
	public void edit_start_ymd(Schedule schedule) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.edit_start_ymd(schedule);
	}

	// 일차 스케줄 저장
	public void insert_daily(Daily_Scd daily) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		mapper.insert_daily(daily);
		//System.out.println(daily);
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
		if (budget != null) {
			if (budget.getDtl_budget() == null)
				budget.setDtl_budget("");
			if (budget.getDtl_memo() == null)
				budget.setDtl_memo("");
		}
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
		if (budget.getDtl_memo() != null)
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

	// 일차 도시 리스트 가져오기
	public List<HashMap<String, Object>> get_city_list(int daily_sq) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		List<HashMap<String, Object>> citylist = mapper.get_city_listAll(daily_sq);
		return citylist;
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

	// 클립 리스트 가져오기
	public List<HashMap<String, Object>> get_cliplist(String user_id) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		List<HashMap<String, Object>> cliplist = mapper.get_cliplist(user_id);
		return cliplist;
	}

	// 일정 복사하여 추가하기
	public void copy_schedule(int scd_sq, String user_id) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		
		//메인 스케쥴 가져와서 id바꾸어 저장
		Schedule schedule = mapper.select_scd(scd_sq);
		schedule.setUser_id(user_id);
		String start_ymd = schedule.getStart_ymd();
		String[] array = start_ymd.split(" ");
		schedule.setStart_ymd(array[0]);
		mapper.insert_scd(schedule);
		int my_scd_sq = mapper.getScd_Sq(user_id);
		
		//모든 일차 스케쥴 가져와서 for문으로 일차, 일차도시, 일차상세장소 테이블 복사하여 저장
		List<HashMap<String, Object>> dailyList = mapper.get_daily_list(scd_sq);
		for(HashMap<String, Object> daily : dailyList){
			//scd_sq 바꾸어 일차 테이블 저장
			String d_sq = String.valueOf(daily.get("DAILY_SQ"));
			int daily_sq = Integer.parseInt(d_sq);
			String d_ord = String.valueOf(daily.get("DAILY_ORD"));
			int daily_ord = Integer.parseInt(d_ord);
			String daily_ymd = String.valueOf(daily.get("DAILY_YMD"));
			Daily_Scd my_daily = new Daily_Scd(0, my_scd_sq, daily_ord, daily_ymd, null, null, 0, null);
			mapper.insert_daily(my_daily);
			int my_daily_sq = mapper.getDaily(my_daily);
			
			//일차에 해당하는 일차도시 테이블 복사하여 저장
			List<HashMap<String, Object>> cityList = mapper.get_city_listAll(daily_sq);
			for(HashMap<String, Object> city : cityList){
				String c_ord = String.valueOf(city.get("CITY_ORD"));
				int city_ord = Integer.parseInt(c_ord);
				String area_code = String.valueOf(city.get("AREA_CODE"));
				String sigungu_code = String.valueOf(city.get("SIGUNGU_CODE"));
				String city_nm = String.valueOf(city.get("CITY_NM"));
				my_daily.setDaily_sq(my_daily_sq);
				my_daily.setArea_code(area_code);
				my_daily.setSigungu_code(sigungu_code);
				my_daily.setCity_ord(city_ord);
				my_daily.setCity_nm(city_nm);
				mapper.insert_city(my_daily);
			}
			
			//일차에 해당하는 일차상세장소 테이블 복사하여 저장
			Dtl_Scd dtl_scd = new Dtl_Scd(0, scd_sq, daily_sq, 0, null, null, null, null, null, null, null, null, null);
			List<HashMap<String, Object>> dtlList = mapper.getDtlList(dtl_scd);
			for(HashMap<String, Object> dtl : dtlList){
				String dt_ord = String.valueOf(dtl.get("DTL_ORD"));
				int dtl_ord = Integer.parseInt(dt_ord);
				String dtl_content_id = String.valueOf(dtl.get("DTL_CONTENT_ID"));
				String memo = String.valueOf(dtl.get("MEMO"));
				String place_nm = String.valueOf(dtl.get("PLACE_NM"));
				String dtl_image = String.valueOf(dtl.get("DTL_IMAGE"));
				String area_code = String.valueOf(dtl.get("AREA_CODE"));
				String sigungu_code = String.valueOf(dtl.get("SIGUNGU_CODE"));
				String city_nm = String.valueOf(dtl.get("CITY_NM"));
				String map_x = String.valueOf(dtl.get("MAP_X"));
				String map_y = String.valueOf(dtl.get("MAP_Y"));
				Dtl_Scd my_dtl = new Dtl_Scd(0, my_scd_sq, my_daily_sq, dtl_ord, dtl_content_id, memo, place_nm, dtl_image, area_code, sigungu_code, city_nm, map_x, map_y);
				mapper.insert_dtl(my_dtl);
			}
		}
	}
}
