package com.scmaster.gittest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.gittest.dao.UserDAO;
import com.scmaster.gittest.vo.User;


@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String user_id, String password,Model model, HttpSession session){
		//System.out.println("유저컨트롤러 진입");
		
		User user = dao.login_User(user_id);
		//System.out.println(user);
		if(user == null){
			model.addAttribute("loginErr", "로그인 정보가 틀렸습니다.");
			//System.out.println("유저 아이디가 없습니다");
			return "redirect:/";
		}else{
			if(user.getPassword().equals(password)){
				
				session.setAttribute("user_id", user.getUser_id());
				return "redirect:/";
			}else{
				model.addAttribute("loginErr", "로그인 정보가 틀렸습니다.");
				//System.out.println("비밀번호가 틀렸습니다요");
				return "redirect:/";
			}
		}
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(User user , Model model){
		System.out.println("join 진입 ");
		System.out.println(user);
		
		int result = dao.join_User(user);
		System.out.println(result);
		
		if(result == 1){
			model.addAttribute("success", "가입 성공");
			return "redirect:/";
		}else{
			model.addAttribute("errMsg", "가입 실패");
			return "redirect:/";
		}
	}
	
	
}
