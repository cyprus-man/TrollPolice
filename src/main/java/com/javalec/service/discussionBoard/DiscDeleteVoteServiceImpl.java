package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscJudgeDao;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.DiscJudgeVO;
import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MemberVO;

@Service
public class DiscDeleteVoteServiceImpl implements DiscussionBoardService{
	@Autowired
	DiscussionBoardDao boardDao;
	@Autowired
	DiscJudgeDao judgeDao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------"+this.getClass().getName()+"-------");
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		PrintWriter pw = response.getWriter();
		
		if(loginUser==null) {
			pw.write("notLogin");
			return null;
		}
		
		String email = loginUser.getEmail();
		int discBoardId = Integer.parseInt(request.getParameter("discBoardId"));
		int decision = Integer.parseInt(request.getParameter("decision"));
		System.out.println("decision : "+decision);
		DiscussionBoardVO discussionBoard = boardDao.getDiscBoardById(discBoardId);
		
		DiscJudgeVO judge = new DiscJudgeVO();
		judge.setDiscBoardId(discBoardId);
		judge.setEmail(email);
		
		if(decision == 1) {
			discussionBoard.setUp(discussionBoard.getUp()-1);
		}else if(decision == -1) {
			discussionBoard.setDown(discussionBoard.getDown()-1);
		}
		
		boardDao.updateDiscBoard(discussionBoard);
		judgeDao.deleteJudge(judge);
		pw.write("success");
		
		if(pw!=null) pw.close();
		return null;
	}

}
