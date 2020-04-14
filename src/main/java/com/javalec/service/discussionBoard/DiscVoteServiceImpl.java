package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscJudgeDao;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.DiscJudgeVO;
import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MemberVO;

@Service
public class DiscVoteServiceImpl implements DiscussionBoardService{

	@Autowired
	DiscJudgeDao judgeDao;
	@Autowired
	DiscussionBoardDao boardDao;
	// up and down  -> table to join
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		System.out.println("--------"+this.getClass().getName()+"-------");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser==null) {
			pw.write("notLogin");
			return null;
		}
		
		//nullException
		int decision = Integer.parseInt(request.getParameter("decision"));
		int discBoardId = Integer.parseInt(request.getParameter("discBoardId"));
		DiscussionBoardVO discussionBoard = boardDao.getDiscBoardById(discBoardId);
		
		
		if(decision==1) {
			discussionBoard.setUp(discussionBoard.getUp()+1);
		}else if(decision==-1) {
			discussionBoard.setDown(discussionBoard.getDown()+1);
		}
		
		// Front End 에서 막는다.
		DiscJudgeVO judge = new DiscJudgeVO();
		judge.setDecision(decision);
		judge.setDiscBoardId(discBoardId);
		judge.setEmail(loginUser.getEmail());
		
		
		boardDao.updateDiscBoard(discussionBoard);
		judgeDao.insertJudge(judge);
		if(pw!=null) pw.close();
		
		return null;
	}
	
}
