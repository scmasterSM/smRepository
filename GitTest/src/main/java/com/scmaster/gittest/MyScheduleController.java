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
	public ArrayList<HashMap<String, Object>> read_scd(HttpSession session, Model model){
		/*String id=session.getAttribute('USER_ID');*/
		String user_id= "1"; 
		ArrayList<HashMap<String, Object>>scdList = dao.read_scd(user_id); 
		return scdList;
	}
	
	@ResponseBody
	@RequestMapping(value="read_scd_info",method=RequestMethod.POST)
	public ArrayList<HashMap<String, Object>> read_scd_info(HttpSession session, Model model,int scd_sq){
		//String id=session.getAttribute('USER_ID');
		String user_id= "1"; 
		ArrayList<HashMap<String, Object>>daily_List = dao.scd_daily_ymd(scd_sq);
		
		
		System.out.println(daily_List);
		return daily_List; 
	}
	@ResponseBody
	@RequestMapping(value="scd_info",method=RequestMethod.POST)
	public ArrayList<Dtl_Scd> scd_info(HttpSession session, Model model,int scd_sq){		
		ArrayList<Dtl_Scd> d_scdList = dao.scd_info(scd_sq);
		System.out.println(d_scdList);
		return d_scdList; 
	}
	
	
	/*@ResponseBody
	@RequestMapping(value="scd_daily_ymd",method=RequestMethod.POST)
	public ArrayList<Daily_Scd> scd_daily_ymd(HttpSession session, Model model,int scd_sq){		
		ArrayList<Daily_Scd> d_scdList = dao.scd_daily_ymd(scd_sq); 
		return d_scdList; 
	}*/
	
	/*@RequestMapping(value="read_scd_info",method=RequestMethod.GET)
	public String read_scd_info(int scd_sq,Model model){
		ArrayList<HashMap<String, Object>>daily_List=dao.scd_daily_ymd(scd_sq);
		int day_cnt=dao.day_cnt(scd_sq);
		System.out.println(daily_List);
		model.addAttribute("day_cnt", day_cnt);
		model.addAttribute("daily_List", daily_List);
		return "SC_12";
	}*/
	
	
}
