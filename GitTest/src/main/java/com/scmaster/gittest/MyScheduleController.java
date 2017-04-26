package com.scmaster.gittest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.MyScheduleDao;
import com.scmaster.gittest.vo.Daily_Scd;
import com.scmaster.gittest.vo.Dtl_Scd;
import com.scmaster.gittest.vo.Schedule;



@Controller
public class MyScheduleController {
	
	@Autowired
	MyScheduleDao dao;
	
	@ResponseBody
	@RequestMapping(value="read_scd",method=RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> read_scd(HttpSession session){
		String user_id=(String)session.getAttribute("user_id");  
		ArrayList<HashMap<String, Object>>scdList = dao.read_scd(user_id); 
		return scdList;
	}
	
	@ResponseBody
	@RequestMapping(value="read_scd_info",method=RequestMethod.POST)
	public ArrayList<HashMap<String, Object>> read_scd_info(HttpSession session,int scd_sq){
		/*String user_id=(String)session.getAttribute("user_id");
		schedule.setUser_id(user_id);*/
		ArrayList<HashMap<String, Object>>daily_List = dao.scd_daily_ymd(scd_sq); 
		System.out.println(daily_List);
		return daily_List; 
	}
	@ResponseBody
	@RequestMapping(value="scd_info",method=RequestMethod.POST)
	public ArrayList<Dtl_Scd> scd_info(HttpSession session,int scd_sq){
		/*String user_id=(String)session.getAttribute("user_id");
		schedule.setUser_id(user_id);*/
		ArrayList<Dtl_Scd> d_scdList = dao.scd_info(scd_sq);
		System.out.println(d_scdList);
		return d_scdList; 
	} 
	@ResponseBody
	@RequestMapping(value="shared_read_scd",method=RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> shared_read_scd(HttpSession session){
		String user_id=(String)session.getAttribute("user_id");  
		ArrayList<HashMap<String, Object>>scdList = dao.shared_read_scd(user_id); 
		return scdList;
	}
	@ResponseBody
	@RequestMapping(value="get_citylatlng",method=RequestMethod.POST)
	public Dtl_Scd get_citylatlng(Dtl_Scd areasigungu){
		Dtl_Scd latlng = dao.get_citylatlng(areasigungu);
		return latlng;
	}
	
}
