package com.javalec.service.replyVote;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.vo.DiscReplyVoteVO;

public interface ReplyVoteService {
	public void execute(HttpServletRequest request,HttpServletResponse response, DiscReplyVoteVO replyVote) 
			throws ServletException, IOException;
}
