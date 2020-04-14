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
public class DownVoteImpl implements ReplyVoteService{
	@Autowired
	DiscussionReplyDao replyDao;
	@Autowired
	DiscReplyVoteDao voteDao;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, DiscReplyVoteVO replyVote)
			throws ServletException, IOException {
		System.out.println(replyVote.toString());
		
		if(request.getParameter("downCount")==null || replyVote.getEmail()==null)
			return;
		
		int downCount = Integer.parseInt(request.getParameter("downCount"));
		
		Map<String,Integer> upMap = new HashMap<String,Integer>();
		
		switch(replyVote.getUp()) {
		case 0 :
			
			upMap.put("down", downCount-1);
			upMap.put("replyId", replyVote.getReplyId());
			
			System.out.println("cancel"+upMap.toString());
			
			voteDao.deleteVote(replyVote);
			replyDao.updateDown(upMap);
			break;
			
		case -1 :
			
			//downVote
			upMap.put("down", downCount+1);
			upMap.put("replyId", replyVote.getReplyId());
			
			System.out.println(upMap.toString());
			voteDao.insertVote(replyVote);
			replyDao.updateDown(upMap);
			break;
		
		default:
			System.out.println("에러..."+replyVote.getUp());
			break;
		}
	}
	
}
