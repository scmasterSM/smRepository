package com.scmaster.gittest;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.scmaster.gittest.dao.ReviewDao;
import com.scmaster.gittest.dao.ScheduleDAO;
import com.scmaster.gittest.util.PageNavigator;
import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;
import com.scmaster.gittest.vo.Schedule;






@Controller
public class HomeController {
	
	
	final int countPerPage = 5;	//페이지 당 글 수
	final int pagePerGrop=10;		//페이지 이동 그룹 당 표시할 페이지수
	
	
	@Autowired
	private ReviewDao dao;
	
	@Autowired
	private ScheduleDAO scd_dao;
	
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
	public String SC_07place(Review review,String CONTENT_TYPE_ID,Model model,@RequestParam
			(value="page",defaultValue="1")	int page){ 
		int count =dao.tCount(review.getCONTENT_ID());
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);  
		ArrayList<HashMap<String, Object>>rList=dao.readReview(navi.getStartRecord(),navi.getCountPerPage(),review);
		model.addAttribute("rList",rList);
		model.addAttribute("contentid",review.getCONTENT_ID());
		model.addAttribute("contypeid",CONTENT_TYPE_ID);
		model.addAttribute("count", count);
		model.addAttribute("navi", navi);
		return "SC_07place";
	}
	
	@RequestMapping(value="SC_08",method=RequestMethod.GET)
	public String SC_08(Review review, Model model,@RequestParam
			(value="page",defaultValue="1")	int page){ 
		int count =dao.tCount(review.getCONTENT_ID());
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);  
		ArrayList<HashMap<String, Object>>rList=dao.readReview(navi.getStartRecord(),navi.getCountPerPage(),review);
		model.addAttribute("rList",rList);
		model.addAttribute("contentid",review.getCONTENT_ID()); 
		model.addAttribute("count", count);
		model.addAttribute("navi", navi);
		return "SC_08";
	}
	
	@RequestMapping(value="SC_12",method=RequestMethod.GET)
	public String SC_12(int scd_sq,Model model){
		model.addAttribute("scd_sq", scd_sq);
		Schedule schedule = scd_dao.select_scd(scd_sq);
		String[] date = schedule.getStart_ymd().split(" ");
		schedule.setStart_ymd(date[0]);
		model.addAttribute("schedule", schedule);
		List<HashMap<String, Object>> sharedList = scd_dao.get_shared_users(scd_sq);
		model.addAttribute("sharedList", sharedList);
		return "SC_12";
	}
	
	@RequestMapping(value="sc_05",method=RequestMethod.GET)
	public String sc_05(String areacode, String sigungucode, String city_nm, Model model){
			model.addAttribute("areacode",areacode);
			model.addAttribute("sigungucode",sigungucode);
			model.addAttribute("city_nm", city_nm);
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
	
	@RequestMapping(value="SC_11",method=RequestMethod.GET)
	public String SC_11(){
		
		return "SC_11";
	}
	
	@RequestMapping(value="home",method=RequestMethod.GET)
	public String home(){
		
		return "home";
	}
	
	
}
