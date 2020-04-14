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

@Service
public class SearchTrollAJAX implements DiscussionBoardService{
	
	@Autowired
	DiscussionBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String troller = request.getParameter("troller");
		String page = "1";
		
		if(troller == null) return null;
		
		Map<String,String> trollMap = new HashMap<String,String>();
		trollMap.put("troller", troller);
		trollMap.put("page", page);
		
		List<DiscussionBoardVO> boards = dao.getListByTroll(trollMap);
		
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		String json = gson.toJson(boards);
		JsonWriter jw = gson.newJsonWriter(pw);
		jw.jsonValue(json);
		
		return null;
	}
	
}
