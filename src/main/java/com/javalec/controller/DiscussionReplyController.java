package com.javalec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.service.discussionReply.DiscReplyListServiceImpl;
import com.javalec.service.discussionReply.DiscReplyService;
import com.javalec.service.discussionReply.DiscReplyUpdateServiceImpl;
import com.javalec.service.discussionReply.ReplyDeleteServiceImpl;
import com.javalec.service.discussionReply.ReplyInsertServiceImpl;
import com.javalec.service.discussionReply.getChildReplyListImpl;
import com.javalec.service.replyVote.DownVoteImpl;
import com.javalec.service.replyVote.ReplyVoteService;
import com.javalec.service.replyVote.UpVoteImpl;
import com.javalec.service.replyVote.UpdateVoteImpl;
import com.javalec.vo.DiscReplyVoteVO;
import com.javalec.vo.DiscussionReplyVO;

@Controller
public class DiscussionReplyController {

	@Autowired
	ApplicationContext ctx;
	
	DiscReplyService service;
	ReplyVoteService voteService;
	
	@RequestMapping(value ="/getReplyList", method = RequestMethod.GET)
	public void getReplyList(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		service = ctx.getBean(DiscReplyListServiceImpl.class);
		service.execute(request,response, null);
	}
	
	@RequestMapping("/insertReply")
	public void insertReply(HttpServletRequest request,HttpServletResponse response,DiscussionReplyVO reply) 
			throws ServletException,IOException 
	{
		service = ctx.getBean(ReplyInsertServiceImpl.class);
		service.execute(request, response, reply);
	}
		
	@RequestMapping("/updateReply")
	public void updateReply(HttpServletRequest request,HttpServletResponse response,DiscussionReplyVO reply) 
			throws ServletException,IOException {
		service = ctx.getBean(DiscReplyUpdateServiceImpl.class);
		service.execute(request,response,reply);
		
	}
	@RequestMapping("/getChildReply")
	public void getChildReply(HttpServletRequest request,HttpServletResponse response,DiscussionReplyVO reply) 
			throws ServletException,IOException{
		service = ctx.getBean(getChildReplyListImpl.class);
		service.execute(request, response, reply);
	}
	
	
	/*replyVote Mapping*/
	@RequestMapping("/discReplyUpVote")
	public void upVote(HttpServletRequest request,HttpServletResponse response,DiscReplyVoteVO replyVote) 
			throws ServletException,IOException{
		voteService = ctx.getBean(UpVoteImpl.class);
		voteService.execute(request, response, replyVote);
	}
	@RequestMapping("/discReplyDownVote")
	public void downVote(HttpServletRequest request,HttpServletResponse response,DiscReplyVoteVO replyVote) 
			throws ServletException,IOException{
		voteService = ctx.getBean(DownVoteImpl.class);
		voteService.execute(request, response, replyVote);
	}
	@RequestMapping("/updateVote")
	public void updateVote(HttpServletRequest request,HttpServletResponse response,DiscReplyVoteVO replyVote)
			throws ServletException,IOException{
		voteService = ctx.getBean(UpdateVoteImpl.class);
		voteService.execute(request, response, replyVote);
	}
	
	/*20190319*/
	@RequestMapping("/discReplyDelete")
	public void deleteReply(HttpServletRequest request,HttpServletResponse response,DiscussionReplyVO reply) throws ServletException, IOException {
		service = ctx.getBean(ReplyDeleteServiceImpl.class);
		service.execute(request, response, reply);
	}
}
