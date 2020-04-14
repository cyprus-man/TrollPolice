package com.javalec.service.mainService;

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
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.DiscussionBoardVO;

@Service
public class MainDiscServiceImpl implements MainService {
	@Autowired
	DiscussionBoardDao dao;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<DiscussionBoardVO> boards= dao.hotDealList(1);
		Gson gson = new Gson();
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		//SERIALIZATION : 직렬화 -> 객체를 문자열로 변환
		String boardJson = gson.toJson(boards);
		jw.jsonValue(boardJson);
		if(jw!=null) jw.close();
		if(pw!=null) pw.close();
	}

}
