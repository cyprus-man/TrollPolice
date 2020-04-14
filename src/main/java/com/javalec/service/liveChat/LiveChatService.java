package com.javalec.service.liveChat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.vo.DiscussionReplyVO;

public interface LiveChatService {
	
	public String execute(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException;

}
