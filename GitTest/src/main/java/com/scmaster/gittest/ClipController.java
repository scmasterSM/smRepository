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

import com.scmaster.gittest.dao.ClipDao;
import com.scmaster.gittest.dao.ReviewDao;
import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Schedule;

@Controller
public class ClipController {

	@Autowired
	private ClipDao dao;
	
	
	@ResponseBody
	@RequestMapping(value="clipBoard", method=RequestMethod.POST)
	public int clipBoard(Clip clip, HttpSession session){
		String user_id=(String)session.getAttribute("user_id");
		clip.setUSER_ID(user_id);
		int result=0;
			
		result=dao.deleteClip(clip);		
		if(result == 1){
			result=0;	
		}else{
			result=dao.insertClip(clip);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="readClip",method=RequestMethod.GET)
	public List<Clip> readClip(HttpSession session, Model model){
		String user_id=(String)session.getAttribute("user_id"); 
		List<Clip>cList = dao.readCLip(user_id); 
		return cList;
	}	 
}
