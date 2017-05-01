package com.scmaster.gittest;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.UserDAO;
import com.scmaster.gittest.vo.Daily_City;
import com.scmaster.gittest.vo.User;


@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String user_id,String password,Model model, HttpSession session){
		
		User user2 = dao.login_User(user_id);
		
		String user_sex = user2.getUser_sex();
		
		if(user_sex.equals("f")){
			session.setAttribute("user_sex", "여");
		}else if(user_sex.equals("m")){
			session.setAttribute("user_sex", "남");
		}else if(user_sex.equals("F")){
			session.setAttribute("user_sex", "여");
		}else if(user_sex.equals("M")){
			session.setAttribute("user_sex", "남");
		}
	
		//System.out.println(user2);
		
		if(user2 != null){
				
				if(user2.getPassword().equals(password)){
					session.setAttribute("user_id", user2.getUser_id());
					return "success";
				}else {
					model.addAttribute("loginErr", "비밀번호가 일치 하지 않습니다.");
					return "fail";
				}
			}else {
				model.addAttribute("loginErr", "로그인 정보가 틀렸습니다.");
				return "fail";
		}
		
	}

	
	//현재 로그아웃 시 홈화면으로 돌아가도록 처리되어있음 
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "logout2", method = RequestMethod.GET)
	public String logout2(HttpSession session) {
		session.invalidate();
		return "redirect:/sc_05";
	}
	
	@ResponseBody
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(User user , Model model){
		
		int result = dao.join_User(user);
		
		if(result == 1){
			model.addAttribute("success", "가입 성공");
			return "success";
		}else{
			model.addAttribute("errMsg", "가입 실패");
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="edit", method = RequestMethod.POST)
	public String edit_User(User user , Model model){
		
		int result = dao.edit_User(user);
		
		
		if(result == 1){
			model.addAttribute("success", "회원 정보 수정 성공");
			return "success";
		}else{
			model.addAttribute("errMsg", "수정 실패");
			return "fail";
		}
	}
	
	
	
	
	
	
	
	// 도시 순위 불러오는 함수
		@ResponseBody
		@RequestMapping(value = "bestcity", method = RequestMethod.GET)
		public ArrayList<Daily_City> bestlist() {
			//System.out.println("도시 순위 불러오는 함수");
			ArrayList<Daily_City> bList = new ArrayList<>();
			bList = dao.bestcity();
			System.out.println(bList);
			return bList;
		}
		
		//SC_05 도시 디테일 함수 
		@ResponseBody
		@RequestMapping(value = "detail_city", method = RequestMethod.GET)
		public Daily_City detail_city(String city_nm) {
			Daily_City dCity = new Daily_City();
			dCity = dao.detail_city(city_nm);
			return dCity;
		}
	
}
