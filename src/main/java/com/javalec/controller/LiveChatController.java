package com.javalec.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.service.liveChat.ChatRoomOutServiceImpl;
import com.javalec.service.liveChat.GoRoomListImpl;
import com.javalec.service.liveChat.LiveChatContentListImpl;
import com.javalec.service.liveChat.LiveChatRoomListServiceImpl;
import com.javalec.service.liveChat.LiveChatSendServiceImpl;
import com.javalec.service.liveChat.LiveChatService;




@Controller
public class LiveChatController {
	
	@Autowired
	ApplicationContext context;
	
	LiveChatService service;
	
	@RequestMapping("/liveChat")
	public String liveChat(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		service = context.getBean(LiveChatRoomListServiceImpl.class);
		return service.execute(request, response);
	}
	@RequestMapping(value = "/chatSendMsg")
	public void chatSendMsg(HttpServletRequest request,HttpServletResponse response) throws Exception{
		service = context.getBean(LiveChatSendServiceImpl.class);
		service.execute(request, response);
	}
	@RequestMapping(value="/getChatMsg")
	public void getChatMsg(HttpServletRequest request,HttpServletResponse response) throws Exception{
		service = context.getBean(LiveChatContentListImpl.class);
		service.execute(request, response);
	}
	@RequestMapping("/goRoomList")
	public void goRoomList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		service = context.getBean(GoRoomListImpl.class);
		service.execute(request, response);
	}
	@RequestMapping("/exitRoom")
	public String chatRoomOutAction(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		service = context.getBean(ChatRoomOutServiceImpl.class);
		return service.execute(request, response);
	}

	
	

}
