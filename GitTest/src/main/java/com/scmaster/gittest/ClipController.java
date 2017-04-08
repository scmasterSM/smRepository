package com.scmaster.gittest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ReviewDao;
import com.scmaster.gittest.vo.Clip;

@Controller
public class ClipController {

	@Autowired
	private ReviewDao dao;
	
	
	@ResponseBody
	@RequestMapping(value="clipBoard", method=RequestMethod.POST)
	public Clip clipBoard(Clip clip, HttpSession session){
		String id= "1111";
		clip.setUSER_ID(id);
		dao.insertClip(clip);
		return clip;
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
