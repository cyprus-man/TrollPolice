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

@Service
public class UpVoteImpl implements ReplyVoteService{

	@Autowired
	DiscReplyVoteDao voteDao;
	@Autowired 
	DiscussionReplyDao replyDao;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, DiscReplyVoteVO replyVote)
			throws ServletException, IOException {
		// TODO insertVote
		if(request.getParameter("upCount")==null || replyVote.getEmail()==null)
			return;
		int upCount = Integer.parseInt(request.getParameter("upCount"));
		
		Map<String,Integer> upMap = new HashMap<String,Integer>();
		
		switch(replyVote.getUp()) {
		case 0 :
			
			upMap.put("up", upCount-1);
			upMap.put("replyId", replyVote.getReplyId());
			
			System.out.println("cancel"+upMap.toString());
			
			voteDao.deleteVote(replyVote);
			replyDao.updateUp(upMap);
			break;
			
		case 1 :
			
			//upVote
			upMap.put("up", upCount+1);
			upMap.put("replyId", replyVote.getReplyId());
			
			System.out.println(upMap.toString());
			voteDao.insertVote(replyVote);
			replyDao.updateUp(upMap);
			break;	
		
		default:
			System.out.println("에러..."+replyVote.getUp());
			
			break;
		}
	}
	
}
