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
public class MyTrollListImpl implements DiscussionBoardService {

	@Autowired
	private DiscussionBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		if(loginUser==null)  {
			return "redirect:login";
		}
		
		String nickname = loginUser.getNickname();
		System.out.println("nickname"+nickname);
		System.out.println("----");
		int reportCount= dao.countByTroller(nickname);
		System.out.println("----");
		int lastPage = reportCount / 10;
		
		
		String reportPage = request.getParameter("reportPage");
		int pageStart;
		int pageEnd;
		
		reportPage = reportPage == null ? "1" : reportPage;
		
		lastPage += reportCount % 10 > 0 ? 1 : 0;
		pageStart = (Integer.parseInt(reportPage) / 5) * 5 + 1;
		pageEnd = pageStart + 4;
		pageEnd = pageEnd > lastPage ? lastPage : pageEnd;
		
		
		Map<String, String> nickMap = new HashMap<String,String>(); 
		nickMap.put("page",reportPage);
		nickMap.put("troller", nickname);
		
		List<DiscussionBoardVO> reportList =  dao.getListByTroll(nickMap);
		
		
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		jsonMap.put("page",reportPage);
		jsonMap.put("pageStart",pageStart);
		jsonMap.put("pageEnd", pageEnd);
		jsonMap.put("lastPage", lastPage);
		jsonMap.put("boardList", reportList);
		
		Gson gson = new Gson();
		String jsonValue = gson.toJson(jsonMap);
		
		PrintWriter pw = response.getWriter();
		JsonWriter jw =gson.newJsonWriter(pw);
		
		System.out.println("--------------");
		System.out.println(jsonValue);
		jw.jsonValue(jsonValue);
		System.out.println("--------------");
		
		if(pw!=null) pw.close();
		if(jw!=null) jw.close();
		
		return null;
	}

}
