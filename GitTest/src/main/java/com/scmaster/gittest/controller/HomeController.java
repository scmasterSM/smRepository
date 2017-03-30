package com.scmaster.gittest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.gittest.vo.Schedule;
import com.scmaster.gittest.vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	 
	@RequestMapping(value="tourapi",method=RequestMethod.GET)
	public String tourapi(){
		
		return "tourapi";
	}
	
	@RequestMapping(value="new_schedule",method=RequestMethod.GET)
	public String new_schedule(){
		
		return "new_schedule";
	}
	 
	@RequestMapping(value="create_schedule",method=RequestMethod.POST)
	public String create_schedule(Model model, User user, Schedule schedule, String areaCode1){
		//System.out.println(user);
		//System.out.println(schedule);
		model.addAttribute("areaCode", areaCode1);
		return "SC13";
	}
	 
	@RequestMapping(value="SC13",method=RequestMethod.GET)
	public String SC13(){
		
		return "SC13";
	}
	
}
