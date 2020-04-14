package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MatchingReplyVO;
@Service
public class MatchingReplyListServiceImpl implements MatchingBoardService {
	@Autowired
	public MatchingBoardDao dao;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MatchingReplyListServiceImpl");	
		int matchingBoardId=Integer.parseInt(request.getParameter("parentId"));
		MatchingBoardVO board = dao.getMatchingBoardById(matchingBoardId);
		List <MatchingReplyVO> replies= dao.getMatchingReplyById(matchingBoardId);
		
		Gson gson = new Gson();
		String json = gson.toJson(replies);
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		
		jw.jsonValue(json);
		
		jw.close();
		pw.close(); 

		return null;
	}

}
