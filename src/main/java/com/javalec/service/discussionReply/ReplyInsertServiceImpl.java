package com.javalec.service.discussionReply;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscussionReplyDao;
import com.javalec.vo.DiscussionReplyVO;

@Service
public class ReplyInsertServiceImpl implements DiscReplyService {

	@Autowired
	DiscussionReplyDao dao;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, DiscussionReplyVO reply)
			throws ServletException, IOException {
		//TODO if reply.getEmail== null : DO NOT INSERT
		//if(reply.getEmail()==null) return;
		reply.setWriteDate(new Date());
		reply.setReplyId(dao.getMax(reply.getDiscBoardId()));
		System.out.println(reply.toString());
		dao.insertReply(reply);
	}
}
