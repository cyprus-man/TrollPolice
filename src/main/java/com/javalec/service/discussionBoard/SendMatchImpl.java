package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.MatchVO;
import com.javalec.vo.ParticipantVO;

@Service
public class SendMatchImpl implements DiscussionBoardService {

	@Autowired
	DiscussionBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String discIdString = request.getParameter("discId");
		int discId = Integer.parseInt(discIdString);
		long matchId = dao.getMatchIdByDisc(discId);
		MatchVO match = dao.getMatchById(matchId);
		
		ParticipantVO.sortByLane(match.getParticipantsVOList());
		
		Gson gson = new Gson();
		String matchJson = gson.toJson(match);
		
		
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		
		jw.jsonValue(matchJson);
		if(jw!=null) jw.close();
		if(pw!=null) pw.close();
		
		return null;
	}

}
