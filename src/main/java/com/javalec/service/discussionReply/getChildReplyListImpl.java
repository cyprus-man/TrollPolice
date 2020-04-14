package com.javalec.service.discussionReply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.DiscReplyVoteDao;
import com.javalec.dao.DiscussionReplyDao;
import com.javalec.vo.DiscussionReplyVO;
import com.javalec.vo.MemberVO;

@Service
public class getChildReplyListImpl implements DiscReplyService{
		@Autowired
		DiscussionReplyDao dao;
		@Autowired
		DiscReplyVoteDao voteDao;
		
		@Override
		public void execute(HttpServletRequest request,HttpServletResponse response ,DiscussionReplyVO reply) throws ServletException, IOException {
			// TODO reply list paging 
			Map<String,Integer> replyPair = new HashMap<String,Integer>();
			int page = request.getParameter("answerPage")!=null ? Integer.parseInt(request.getParameter("answerPage")) : 1;
			replyPair.put("discBoardId",reply.getDiscBoardId());
			replyPair.put("parentId",reply.getReplyId());
			replyPair.put("page",page);
			
			System.out.println("[childReplyServiceImpl : "+replyPair.toString()+"]");
			List<DiscussionReplyVO> replyList;
			replyList = dao.getReplyByDisc(replyPair);
			
			HttpSession session = request.getSession();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
			
			Map<String,String> voteMap = new HashMap<String,String>();
			//get voted to show voted
			if(loginUser!=null && replyList!=null) {
				voteMap.put("email", loginUser.getEmail());
				voteMap.put("replyId","-1");
				System.out.println("loginUser"+loginUser.toString());
				for(int i=0;i<replyList.size();i++)
				{
					voteMap.replace("replyId",Integer.toString(replyList.get(i).getReplyId()));
					replyList.get(i).setIsVote(voteDao.isVoted(voteMap));
				}
			}
			
			Gson gson = new Gson();
			String replyString = gson.toJson(replyList);
			System.out.println(replyString);
			PrintWriter pw =  response.getWriter();
			
			JsonWriter jw = gson.newJsonWriter(pw);
			jw.jsonValue(replyString);
			if(jw!=null) jw.close();
			if(pw!=null) pw.close();
		}
		
		//TODO get child recursive ... -> PL/SQL recursive function 

}
