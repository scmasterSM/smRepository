package com.scmaster.gittest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.gittest.dao.ReplyDao;
import com.scmaster.gittest.util.PageNavigator;
import com.scmaster.gittest.vo.Reply;
import com.scmaster.gittest.vo.Review;

@Controller
public class ReplyController {

	final int countPerPage = 5;	//페이지 당 글 수
	final int pagePerGrop=5;
	
	@Autowired
	private ReplyDao dao;
	
	
	@ResponseBody
	@RequestMapping(value="writeReply", method=RequestMethod.POST)
	public HashMap<String, Object> writeReply(Reply reply, HttpSession session,@RequestParam
			(value="page",defaultValue="1")	int page){
		String user_id=(String)session.getAttribute("user_id");
		reply.setUSER_ID(user_id);
		dao.writeReply(reply); 
		int count =dao.tCount(reply.getSCD_SQ()); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>rList=dao.readReply(navi.getStartRecord(),navi.getCountPerPage(),reply);
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("rList", rList);
		hList.put("navi", navi);
		 
		return hList;
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public ArrayList<HashMap<String, Object>> updateReview(Reply reply,HttpSession session){
		String user_id=(String)session.getAttribute("user_id");
		reply.setUSER_ID(user_id);
		dao.updateReply(reply);
		ArrayList<HashMap<String, Object>>rList=dao.readReply(reply);
		return rList; 
	}
	
	@ResponseBody
	@RequestMapping(value="read_reply", method=RequestMethod.POST)
	public HashMap<String, Object> read_Review(Reply reply,@RequestParam
			(value="page",defaultValue="1")	int page){ 
		int count =dao.tCount(reply.getSCD_SQ()); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>rList=dao.readReply(navi.getStartRecord(),navi.getCountPerPage(),reply);
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("rList", rList);
		hList.put("navi", navi);
		return hList; 
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public HashMap<String, Object> deleteReview(Reply reply, HttpSession session,@RequestParam
			(value="page",defaultValue="1")	int page){
		String user_id=(String)session.getAttribute("user_id");
		reply.setUSER_ID(user_id);
		dao.deleteReply(reply);
		int count =dao.tCount(reply.getSCD_SQ()); 
		PageNavigator navi= new PageNavigator(
				countPerPage, pagePerGrop, page, count);
		ArrayList<HashMap<String, Object>>rList=dao.readReply(navi.getStartRecord(),navi.getCountPerPage(),reply);
		 
		HashMap<String, Object> hList = new HashMap<String, Object>();
		hList.put("rList", rList);
		hList.put("navi", navi);
		return hList; 
	}	
	
	
}
