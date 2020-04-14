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

@Service
public class GoRoomListImpl implements LiveChatService{
	@Autowired
	private LiveChatDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//PROTOCOL : chatId,chatId,chatId
		HttpSession session = request.getSession();
		
		session.removeAttribute("chatId");
		Gson gson = new Gson();
		
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		
		String idStr = request.getParameter("chatId");
		String email = request.getParameter("email");
		if(idStr==null||email==null) 
			jw.jsonValue("{\"message\":\"failed\"}");
		
		Map<String,String> confirmMap = new HashMap<String,String>();
		confirmMap.put("chatId", idStr);
		confirmMap.put("email", email);

		
		jw.jsonValue("{\"chatId\":"+idStr+",\"count\":"+dao.getConfirmCount(confirmMap)+"}");
		
		if(jw!=null) jw.close();
		if(pw!=null) pw.close();
		
		return null;
	}
	
}
