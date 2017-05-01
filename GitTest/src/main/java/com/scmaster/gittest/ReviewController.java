package com.scmaster.gittest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ReviewDao;
import com.scmaster.gittest.dao.ReviewMapper;
import com.scmaster.gittest.util.PageNavigator;
import com.scmaster.gittest.vo.Clip;
import com.scmaster.gittest.vo.Review;



@Controller
public class ReviewController {
	
	final int countPerPage = 5;	//페이지 당 글 수
	final int pagePerGrop=5;
	
	@Autowired
	private ReviewDao dao;
	
	 
	@ResponseBody
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public HashMap<String, Object> writeReview(Review review, HttpSession session,@RequestParam
			(value="page",defaultValue="1")	int page){
		String user_id=(String)session.getAttribute("user_id");
		review.setUSER_ID(user_id);
		dao.writeReview(review); 
		int count =dao.tCount(review.getCONTENT_ID()); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>rList=dao.readReview(navi.getStartRecord(),navi.getCountPerPage(),review);
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("rList", rList);
		hList.put("navi", navi);
		 
		return hList;
	}
	
	@ResponseBody
	@RequestMapping(value="updateReview", method=RequestMethod.POST)
	public ArrayList<HashMap<String, Object>> updateReview(Review review,HttpSession session){
		String user_id=(String)session.getAttribute("user_id");
		review.setUSER_ID(user_id);
		dao.updateReview(review);
		ArrayList<HashMap<String, Object>>rList=dao.readReview(review);
		return rList; 
	}
	
	@ResponseBody
	@RequestMapping(value="read_Review", method=RequestMethod.POST)
	public HashMap<String, Object> read_Review(Review review,@RequestParam
			(value="page",defaultValue="1")	int page){ 
		int count =dao.tCount(review.getCONTENT_ID()); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>rList=dao.readReview(navi.getStartRecord(),navi.getCountPerPage(),review);
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("rList", rList);
		hList.put("navi", navi);
		return hList; 
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteReview", method=RequestMethod.POST)
	public HashMap<String, Object> deleteReview(Review review, HttpSession session,@RequestParam
			(value="page",defaultValue="1")	int page){
		String user_id=(String)session.getAttribute("user_id");
		review.setUSER_ID(user_id);
		dao.deleteReview(review);
		int count =dao.tCount(review.getCONTENT_ID()); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>rList=dao.readReview(navi.getStartRecord(),navi.getCountPerPage(),review);
		 
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("rList", rList);
		hList.put("navi", navi);
		return hList; 
	}
	
	@ResponseBody
	@RequestMapping(value="readReview_all", method=RequestMethod.GET)
	public ArrayList<Review> readReview_all(){
		//System.out.println("여기 들어왔나 ");
		ArrayList<Review> rList = new ArrayList<>();
		rList = dao.readReview_all();
		//System.out.println(rList);
		ArrayList<Review> tList = new ArrayList<>();
		Collections.shuffle(rList);
		for (int i = 1; i <= 4; i++) {
			tList.add(rList.get(i));
		}
		//System.out.println(tList);
		return tList;
	}
}