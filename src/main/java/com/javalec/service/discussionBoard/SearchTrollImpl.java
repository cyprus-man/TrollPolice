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

import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.DiscussionBoardVO;

@Service
public class SearchTrollImpl implements DiscussionBoardService{

	@Autowired
	DiscussionBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String troller = request.getParameter("troller");
		if(troller == null) return "searchTroll";
		String page  = request.getParameter("page");
		
		page = page==null  ? "1" : page;
		
		//TODO paging count where troller
		int pageStart;
		
		pageStart = (Integer.parseInt(page)/5)*5+1;
		
		int lastPage;
		int rnum = dao.countByTroller(troller);
		
		lastPage = rnum%15 > 0 ? rnum/15+1 : rnum/15 ;
		
		int pageEnd = pageStart+4;
		pageEnd = pageEnd > lastPage ? lastPage:pageEnd;
		
		Map<String,String> trollMap = new HashMap<String,String>();
		trollMap.put("troller", troller);
		trollMap.put("page", page);
		List<DiscussionBoardVO> boards = dao.getListByTroll(trollMap);
		
		request.setAttribute("boards", boards);
		request.setAttribute("troller", troller);
		request.setAttribute("page", page);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		request.setAttribute("lastPage", lastPage);
		
		
		
		return "searchTroll";
	}
	
}
