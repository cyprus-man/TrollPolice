package com.javalec.service.discussionReply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscussionReplyDao;
import com.javalec.vo.DiscussionReplyVO;

@Service
public class ReplyDeleteServiceImpl implements DiscReplyService {

	@Autowired
	DiscussionReplyDao dao;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, DiscussionReplyVO reply)
			throws ServletException, IOException {
		
		dao.deleteReply(Integer.parseInt(request.getParameter("replyId")));
	}

}
