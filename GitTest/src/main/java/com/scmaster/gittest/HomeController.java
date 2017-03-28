package com.scmaster.gittest;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	 
	@RequestMapping(value="tourapi",method=RequestMethod.GET)
	public String tourapi(){
		
		return "tourapi";
	}
	
	@RequestMapping(value="bootstrap",method=RequestMethod.GET)
	public String bootstrap(){
		
		return "bootstrap";
	}
	
	@RequestMapping(value="map",method=RequestMethod.GET)
	public String map(){
		
		return "map";
	}
	
	@RequestMapping(value="tourapi2",method=RequestMethod.GET)
	public String tourapi2(){
		
		return "tourapi2";
	}
	
	@RequestMapping(value="sc_05",method=RequestMethod.GET)
	public String sc_05(){
		
		return "sc_05";
	}
	
	
	@RequestMapping(value="practice",method=RequestMethod.GET)
	public String practice(){
		
		return "practice";
	}
	
	
	@RequestMapping(value="apipractice",method=RequestMethod.GET)
	public String apipractice(){
		
		return "apipractice";
	}
	
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(){
		
		return "login";
	}
	
	@RequestMapping(value="design",method=RequestMethod.GET)
	public String design(){
		
		return "design";
	}
	
	@RequestMapping(value="home3",method=RequestMethod.GET)
	public String home3(){
		
		return "home3";
	}
	
}
