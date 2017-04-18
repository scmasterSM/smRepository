package com.scmaster.gittest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.UserDAO;
import com.scmaster.gittest.vo.User;


@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	@ResponseBody
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String user_id,String password,Model model, HttpSession session){
		
		User user2 = dao.login_User(user_id);
		
		//System.out.println(user2);
		
		if(user2 != null){
				
				if(user2.getPassword().equals(password)){
					session.setAttribute("user_id", user2.getUser_id());
					return "success";
				}else{
					model.addAttribute("loginErr", "비밀번호가 일치 하지 않습니다.");
					return "fail";
				}
			}else{
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
	
	
}
