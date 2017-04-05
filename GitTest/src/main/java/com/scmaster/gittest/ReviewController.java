package com.scmaster.gittest;

import java.util.ArrayList;
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
import com.scmaster.gittest.vo.Review;



@Controller
public class ReviewController {
	
	@Autowired
	private ReviewDao dao;
	
	
	@ResponseBody
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public List<Review> writeReview(Review review, HttpSession session){
		String id= "1111";
		review.setUSER_ID(id);
		dao.writeReview(review); 
		List<Review>rList=dao.readReview(review.getPLACE_NM());
		System.out.println(rList+"30");
		return rList;
	}
	
	@ResponseBody
	@RequestMapping(value="clipBoard", method=RequestMethod.POST)
	public Clip clipBoard(Clip clip, HttpSession session){
		String id= "1111";
		clip.setUSER_ID(id);
		dao.insertClip(clip);
		return clip;
	}
	
/*	@RequestMapping(value="" , method=RequestMethod.GET)
	public String replyRead(Model model){
		
		List<Review> rList=dao.readReview();
		System.out.println(rList+"42");
		model.addAttribute("rList", rList);
		
		return "SC_07place";
		
	}*/
}
