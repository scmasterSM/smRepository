package com.scmaster.gittest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ClipDao;
import com.scmaster.gittest.dao.SearchScheduleDao; 
import com.scmaster.gittest.util.PageNavigator;
import com.scmaster.gittest.vo.Liked;
import com.scmaster.gittest.vo.Schedule;

@Controller
public class SearchScheduleController {

	final int countPerPage = 10;	//페이지 당 글 수
	final int pagePerGrop=10;
	
	@Autowired
	private SearchScheduleDao dao;
	
	@Autowired
	private ClipDao cdao;
	
	@ResponseBody
	@RequestMapping(value="filtering",method=RequestMethod.GET)
	public HashMap<String, Object> filtering(Schedule schedule, String area_code,
			@RequestParam(value="page",defaultValue="1")int page){
		HashMap<String,Object>map=new HashMap<>();
		map.put("schedule", schedule);
		map.put("area_code", area_code);
		int count =dao.fCount(map);
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		List<Liked>l_List=cdao.readLiked();
		ArrayList<HashMap<String, Object>>filter_List= dao.filtering(map,navi.getStartRecord(),navi.getCountPerPage());
		HashMap<String, Object> fList = new HashMap<String, Object>();
		fList.put("filter_List", filter_List);
		fList.put("navi", navi);
		fList.put("l_List", l_List);
		return fList;
	}
	
	@ResponseBody
	@RequestMapping(value="all_scd_read",method=RequestMethod.GET)
	public HashMap<String, Object>  all_scd_read(@RequestParam(value="page",defaultValue="1")int page){ 
		int count =dao.tCount(); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>all_scd_List= dao.all_scd_read(navi.getStartRecord(),navi.getCountPerPage());
		List<Liked>l_List=cdao.readLiked();
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("all_scd_List", all_scd_List);
		hList.put("navi", navi);
		hList.put("l_List", l_List);
		return hList;
	}
	
}
