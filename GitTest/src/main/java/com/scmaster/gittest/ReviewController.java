package com.scmaster.gittest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ReviewDao;
import com.scmaster.gittest.util.PageNavigator;
import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;



@Controller
public class ReviewController {
	
	final int countPerPage = 10;	//페이지 당 글 수
	final int pagePerGrop=5;
	
	@Autowired
	private ReviewDao dao;
	
	
	@ResponseBody
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public List<Review> writeReview(Review review, HttpSession session,Model model,@RequestParam
			(value="page",defaultValue="1")	int page){
		String id= "1111";
		int count =dao.tCount(); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		review.setUSER_ID(id);
		dao.writeReview(review); 
		List<Review>rList=dao.readReview(navi.getStartRecord(),navi.getCountPerPage(),review.getCONTENT_ID());
		System.out.println(rList+"30");
		return rList;
	}
	


}
