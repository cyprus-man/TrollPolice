package com.javalec.service.discussionReply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.vo.DiscussionReplyVO;

public interface DiscReplyService {
	//TODO AJAX 를 위한 인터페이스
	public void execute(HttpServletRequest request,HttpServletResponse response,DiscussionReplyVO reply)
		throws ServletException,IOException;
}
