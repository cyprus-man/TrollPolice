package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MemberVO;

@Service
public class SearchMyTrollImpl implements DiscussionBoardService{
	@Autowired
	private DiscussionBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//protocol : (type:troll/report,nickname,page)
		
		
		String type = request.getParameter("type");
		String nickname = request.getParameter("nickname");
		String page = request.getParameter("page");
		page = page==null ? "1" : page;
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if(nickname == null|| loginUser == null) {
			return null;
		}
		
		
		Map<String,String> searchMap = new HashMap<String,String>();
		List<DiscussionBoardVO> boards = null;
		int count = 0;
		
		// 1. get count (*) from where nickname =? searchCondition =?
		// 2. getList By troll AND nickname OR getList by nickname AND troll 
		if("troll".equals(type)) {
			searchMap.put("nickname",nickname);
			searchMap.put("troller",loginUser.getNickname());
			count = dao.countMySearch(searchMap);
			
			searchMap.put("page",page);
			boards = dao.getMyReportListByTroller(searchMap);
			
		}else if("report".equals(type)) {
			searchMap.put("nickname",loginUser.getNickname());
			searchMap.put("troller",nickname);
			
			count = dao.countMySearch(searchMap);
			searchMap.put("page",page);
			
			boards = dao.getMyReportListByTroller(searchMap);
		}
		
		
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		int lastPage = count / 10;
		lastPage += count % 10 > 0 ? 1 : 0;
		
		int nowPage = Integer.parseInt(page);
		nowPage = nowPage > lastPage ? lastPage : nowPage;
		
		int pageStart = (nowPage/5)*5+1;
		int pageEnd = nowPage+4;
		
		
		pageEnd = pageEnd > lastPage ? lastPage : pageEnd;
		
		jsonMap.put("page", nowPage);
		jsonMap.put("pageStart",pageStart);
		jsonMap.put("pageEnd", pageEnd);
		jsonMap.put("lastPage", lastPage);
		jsonMap.put("boardList", boards);
		
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(jsonMap);
		
		PrintWriter pw = response.getWriter();
		JsonWriter  jw = gson.newJsonWriter(pw);
		jw.jsonValue(jsonString);
		
		
		if(jw!=null) jw.close();
		if(pw!=null) pw.close();
		
		return null;
	}
	
}
