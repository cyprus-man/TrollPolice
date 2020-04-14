package com.javalec.service.liveChat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.LiveChatDao;
import com.javalec.vo.LiveChatContentVO;
import com.javalec.vo.MemberVO;

@Service
public class LiveChatContentListImpl implements LiveChatService {

	@Autowired
	LiveChatDao dao;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idString = request.getParameter("chatId");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		
		if (idString == null||loginUser==null){
			return null;
		}
		
		int chatId = Integer.parseInt(idString);
		session.setAttribute("chatId", chatId);
		
		List<LiveChatContentVO> contents = dao.getContentList(chatId);

		//TO CONFIRM RECEIVE MESSAGE
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("email",loginUser.getEmail());
		map.put("chatId",chatId);
		dao.updateConfirm(map);
		
		System.out.println(contents.toString());
		
		
		PrintWriter pw = null;
		JsonWriter jw = null;
		Gson gson = new Gson();
		
		pw = response.getWriter();
		jw = gson.newJsonWriter(pw);
		jw.jsonValue(gson.toJson(contents));
		
		if(jw!=null) {
			jw.close();
		}
		if(pw!=null) {
			pw.close();
		}
		
		return null;
	}

}
