package com.javalec.service.liveChat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.LiveChatDao;
@Service
public class ChatRoomOutServiceImpl implements LiveChatService {
	@Autowired
	public LiveChatDao dao;
	@Autowired
	LiveChatRoomListServiceImpl list;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ChatRoomOutServiceImpl");
		String chatIdString = request.getParameter("chatId");
		int chatId=Integer.parseInt(chatIdString);
		System.out.println(chatId);
		
		
		dao.deleteChatContent(chatId);
		
		Map<String,Object> chatIdAndConfirmExit = new HashMap<String,Object>();
		
		chatIdAndConfirmExit.put("chatId",chatId);
		chatIdAndConfirmExit.put("confirmExit",0);
		dao.expireChatRoom(chatIdAndConfirmExit);
		
		return null;
	}

}
