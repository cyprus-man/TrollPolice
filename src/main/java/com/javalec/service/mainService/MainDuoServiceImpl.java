package com.javalec.service.mainService;

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
import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.Lane;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.Tier;

@Service
public class MainDuoServiceImpl implements MainService{
	@Autowired
	MatchingBoardDao dao;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String tierStr = request.getParameter("tier");
		if(tierStr==null) tierStr = "GOLD";
		
		Tier tier = Tier.valueOf(tierStr);
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("tier",tier);
		param.put("lane",Lane.NONE);
		param.put("page",1);
		List<MatchingBoardVO>boards =  dao.list(param);
		long now = new java.util.Date().getTime();
		
		
		for(int i=0;i<boards.size();i++) {
			if(boards.get(i).getExpired() <= now) {
				boards.remove(i);
				i = -1;
			}
		}
		
		Gson gson = new Gson();
		System.out.println(boards.toString());
		String matchingJson = gson.toJson(boards);
		
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		
		jw.jsonValue(matchingJson);
		if(jw!=null) jw.close();
		if(pw!=null) pw.close();
	}
	
}
