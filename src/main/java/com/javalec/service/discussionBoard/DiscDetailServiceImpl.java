package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscJudgeDao;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.dao.NoticeDao;
import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MemberVO;

@Service
public class DiscDetailServiceImpl implements DiscussionBoardService {
	
	@Autowired
	private DiscussionBoardDao dao;
	@Autowired
	private DiscJudgeDao judgeDao;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("discBoardId");
		id = id==null ? id = Integer.toString(dao.maxId()-1) : id;
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		
		int discBoardId = Integer.parseInt(id);
		
		DiscussionBoardVO board = dao.getDiscBoardById(discBoardId);
		board.setReadcount(board.getReadcount()+1);
		
		if(loginUser!=null) {
			Map<String,String> judgeMap = new HashMap<String,String>();
			judgeMap.put("email", loginUser.getEmail());
			judgeMap.put("discBoardId",id);
			
			board.setIsVote(judgeDao.getDecision(judgeMap));
			
			//login increase ReadCount
			dao.upRC(board);
			
			if(loginUser.getNickname().equals(board.getTroller())) {
				NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("targetId", board.getDiscBoardId());
				param.put("type","disc");
				dao.confirmNotice(param);
			}
		}else {
			board.setIsVote(0);
		}
		
		request.setAttribute("board", board);
		System.out.println(board.getIsVote());
		
		return "discDetail";
	}

}
