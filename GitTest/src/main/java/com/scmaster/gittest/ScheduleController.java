package com.scmaster.gittest;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ScheduleDAO;
import com.scmaster.gittest.dao.ScheduleMapper;
import com.scmaster.gittest.vo.Budget;
import com.scmaster.gittest.vo.Daily_City;
import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleDAO dao;

	// 새로운 일정 만들기
	@RequestMapping(value = "new_schedule", method = RequestMethod.GET)
	public String new_schedule() {
		return "make_schedule";
	}

	// 일정 만들기에서 입력 받은 도시들을 담는 리스트
	ArrayList<Daily_Scd> dailyList = new ArrayList<>();

	@ResponseBody
	@RequestMapping(value = "set_citylist", method = RequestMethod.POST)
	public void set_citylist(Daily_Scd scd) {
		if (scd.getSigungu_code().equals("0")) {
			scd.setSigungu_code(null);
		}
		dailyList.add(scd);
	}

	// 일정 만들기에서 받아온 정보들을 db에 저장하고 13번 화면으로 이동
	@RequestMapping(value = "create_schedule", method = RequestMethod.POST)
	public String create_schedule(Schedule schedule) {
		int scd_sq = dao.insert_scd(schedule);
		for (int i = 0; i < dailyList.size(); i++) {
			dailyList.get(i).setScd_sq(scd_sq);
			dailyList.get(i).setCity_ord(1);
			dao.insert_daily(dailyList.get(i));
		}
		dailyList.clear();
		return "redirect:edit_schedule?scd_sq=" + scd_sq;
	}

	// 지도에서 검색
	@RequestMapping(value = "edit_schedule", method = RequestMethod.GET)
	public String edit_schedule(int scd_sq, HttpSession session) {
		session.setAttribute("scd_sq", scd_sq);
		return "SC13";
	}

	// 지도에서 검색
	@RequestMapping(value = "mapSearch", method = RequestMethod.GET)
	public String map() {

		return "mapSearch";
	}

	// 지도에서 검색 후 일정 만들기(선택된 하나의 도시정보 가지고 이동)
	@RequestMapping(value = "make_schedule", method = RequestMethod.POST)
	public String make_schedule(Model model, int areaCode, int sigunguCode, float lat, float lng, String name) {
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("sigunguCode", sigunguCode);
		if (sigunguCode == 0)
			model.addAttribute("sigunguCode", "");
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		model.addAttribute("name", name);
		return "make_schedule";
	}

	// 일정에 추가한 장소 db저장, dtl_sq 리턴
	@ResponseBody
	@RequestMapping(value = "detail_place", method = RequestMethod.POST)
	public int detail_place(Dtl_Scd dtl_scd) {
		int dtl_sq = dao.insert_dtl(dtl_scd);
		return dtl_sq;
	}

	// 일차에 해당하는 모든 저장된 장소 리스트로 가져옴
	@ResponseBody
	@RequestMapping(value = "get_places", method = RequestMethod.POST)
	public List<HashMap<String, Object>> get_places(Dtl_Scd dtl_scd) {
		List<HashMap<String, Object>> dtlList = dao.getDtlList(dtl_scd);
		return dtlList;
	}

	// 일차 추가
	@ResponseBody
	@RequestMapping(value = "add_day", method = RequestMethod.POST)
	public void add_day(Daily_Scd daily_scd) {
		dao.insert_daily(daily_scd);
	}

	// 장소 순서 변경
	@ResponseBody
	@RequestMapping(value = "sort_change", method = RequestMethod.POST)
	public void sort_change(Dtl_Scd dtl_scd) {
		dao.sort_change(dtl_scd);
	}

	// 장소 삭제
	@ResponseBody
	@RequestMapping(value = "delete_place", method = RequestMethod.POST)
	public void delete_place(int dtl_sq) {
		dao.delete_place(dtl_sq);
	}

	// 일차별 도시 업데이트
	@ResponseBody
	@RequestMapping(value = "update_cities", method = RequestMethod.POST)
	public void update_cities(Daily_City city) {
		dao.update_cities(city);
	}

	// 장소 예산 및 메모 가져오기
	@ResponseBody
	@RequestMapping(value = "get_budget_memo", method = RequestMethod.POST)
	public Budget get_budget_memo(int dtl_sq) {
		Budget budget = dao.getBudgetMemo(dtl_sq);
		return budget;
	}

	// 장소 예산 및 메모 업데이트
	@ResponseBody
	@RequestMapping(value = "update_bgt", method = RequestMethod.POST)
	public void update_bgt(Budget budget) {
		dao.update_bgt(budget);
	}

	// 일차별 예산 가져오기
	@ResponseBody
	@RequestMapping(value = "get_daily_budget", method = RequestMethod.POST)
	public Budget get_daily_budget(Budget budget) {
		Budget result = dao.get_daily_budget(budget);
		return result;
	}

	// 일정 총 예산 가져오기
	@ResponseBody
	@RequestMapping(value = "get_budget_total", method = RequestMethod.POST)
	public Budget get_budget_total(Budget budget) {
		Budget result = dao.get_budget_total(budget);
		return result;
	}

	// 삭제용 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "get_daily_list", method = RequestMethod.POST)
	public List<HashMap<String, Object>> get_daily_list(int scd_sq) {
		List<HashMap<String, Object>> dailyList = dao.get_daily_list(scd_sq);
		return dailyList;
	}

	// 일자 삭제
	@ResponseBody
	@RequestMapping(value = "delete_day", method = RequestMethod.POST)
	public void delete_day(int daily_sq) {
		dao.delete_day(daily_sq);
	}

	// 일차 순서 변경
	@ResponseBody
	@RequestMapping(value = "day_sort_change", method = RequestMethod.POST)
	public void day_sort_change(Daily_Scd daily) {
		dao.day_sort_change(daily);
	}

	// 일차 날짜 변경
	@ResponseBody
	@RequestMapping(value = "updateDates", method = RequestMethod.POST)
	public void updateDates(Daily_Scd daily) {
		dao.day_change(daily);
	}

	// 클립 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "get_cliplist", method = RequestMethod.POST)
	public List<HashMap<String, Object>> get_cliplist(String user_id) {
		List<HashMap<String, Object>> cliplist = dao.get_cliplist(user_id);
		return cliplist;
	}
}
