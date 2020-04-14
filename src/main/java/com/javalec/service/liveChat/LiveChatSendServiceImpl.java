package com.javalec.service.liveChat;


import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.LiveChatDao;
import com.javalec.vo.LiveChatContentVO;
import com.javalec.vo.MemberVO;

@Service
public class LiveChatSendServiceImpl implements LiveChatService{

	@Autowired
	LiveChatDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
			String idString = request.getParameter("chatId");
			String content = request.getParameter("content");
			MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
			
			System.out.println(idString);
			
			if(loginUser==null||idString == null || content == null) return null;
			int chatId = Integer.parseInt(idString);
			
			String email = loginUser.getEmail();
			
			//content deserialize
			LiveChatContentVO chatContent = new LiveChatContentVO();
			chatContent.setChatId(chatId);
			chatContent.setContent(content);
			chatContent.setSendDate(new Date());
			chatContent.setSender(email);
			System.out.println(chatContent.toString());
			
			dao.insertChatContent(chatContent);
			
		return null;
	}
}