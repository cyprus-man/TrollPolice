package com.javalec.service.replyVote;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscReplyVoteDao;
import com.javalec.dao.DiscussionReplyDao;
import com.javalec.vo.DiscReplyVoteVO;
import com.javalec.vo.DiscussionReplyVO;

@Service
public class UpdateVoteImpl implements ReplyVoteService{
	@Autowired
	DiscReplyVoteDao voteDao;
	@Autowired
	DiscussionReplyDao replyDao;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, DiscReplyVoteVO replyVote)
			throws ServletException, IOException {
		System.out.println("updateVote");
		System.out.println(replyVote);
		
		if(		replyVote==null||
				request.getParameter("up")==null||
				request.getParameter("upCount")==null||
				request.getParameter("downCount")==null) 
		{		
			System.out.println("UpdateVoteImpl--nullException");
			return ;
		}
		
		Integer up = Integer.parseInt(request.getParameter("up"));
		Integer downCount = Integer.parseInt(request.getParameter("downCount")); 
		Integer upCount = Integer.parseInt(request.getParameter("upCount"));
		Integer replyId = Integer.parseInt(request.getParameter("replyId"));
		
		Map<String, Integer> upDownMap = new HashMap<String,Integer>();
		upDownMap.put("replyId",replyId);
		System.out.println("upMap : "+upDownMap.toString());
		
		if(up==-1) {
			upCount -= 1;
			downCount += 1;
		}
		else if(up==1) {
			upCount += 1;
			downCount -=1;
		}
		upDownMap.put("down",downCount);
		upDownMap.put("up",upCount);
		replyDao.updateReply(upDownMap);
		voteDao.updateVote(replyVote);
	}
	
}
