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
import com.javalec.vo.MatchingReplyVO;

@Service
public class MatchingReplyListImpl implements MatchingBoardService {
	@Autowired
	MatchingBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idStr = request.getParameter("matchingBoardId");
		if(idStr==null) return null;
		int id = Integer.parseInt(idStr);
		List<MatchingReplyVO> replys = dao.getMatchingReplyById(id);
		System.out.println(replys.toString());
		Gson gson = new Gson();
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		
		jw.jsonValue(gson.toJson(replys));
		
		if(pw!=null) pw.close();
		if(jw!=null) jw.close();
		return null;
	}

}
