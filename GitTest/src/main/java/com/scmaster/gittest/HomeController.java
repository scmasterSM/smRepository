package com.scmaster.gittest;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ReviewDao;
import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;






@Controller
public class HomeController {
	
	@Autowired
	private ReviewDao dao;
	
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
	
	@RequestMapping(value="map",method=RequestMethod.GET)
	public String map(){
		
		return "map";
	}
	@RequestMapping(value="tourapi",method=RequestMethod.GET)
	public String tourapi(){
		
		return "tourapi";
	}
	
	@RequestMapping(value="SC_07place",method=RequestMethod.GET)
	public String SC_07place(String PLACE_NM,String conType,Model model){ 
		
		List<Review>rList=dao.readReview(PLACE_NM);
		model.addAttribute("rList",rList);
		model.addAttribute("contentid",PLACE_NM);
		model.addAttribute("conType",conType);
		return "SC_07place";
	}
	
	@RequestMapping(value="SC_08",method=RequestMethod.GET)
	public String SC_08(){
		
		return "SC_08";
	}
	@RequestMapping(value="sc_05",method=RequestMethod.GET)
	public String sc_05(String areacode,Model model){
		model.addAttribute("areacode",areacode);
		
		return "sc_05";
	}
	@RequestMapping(value="SC_10",method=RequestMethod.GET)
	public String SC_10(HttpSession session, Model model){
		/*String id=session.getAttribute('USER_ID');*/
		/*String USER_ID= "1111";
		List<Clip>cList = dao.readCLip(USER_ID);
		model.addAttribute("cList", cList);*/
		return "sc_10";
	}
	
	@ResponseBody
	@RequestMapping(value="readClip",method=RequestMethod.GET)
	public List<Clip> readClip(HttpSession session, Model model){
		/*String id=session.getAttribute('USER_ID');*/
		String USER_ID= "1111";
		List<Clip>cList = dao.readCLip(USER_ID);
		model.addAttribute("cList", cList); 
		System.out.println(cList);
		return cList;
	}
	
	
}
