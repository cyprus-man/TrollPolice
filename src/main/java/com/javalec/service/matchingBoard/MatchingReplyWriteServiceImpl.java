package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.dao.NoticeDao;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@Service
public class MatchingReplyWriteServiceImpl implements MatchingBoardService {
	@Autowired
	public MatchingBoardDao dao;
	@Autowired
	SqlSession sqlSession;
	@Autowired
	public MatchingDetailServiceImpl detail;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String email = member.getEmail();
		String nickname = member.getNickname();
		Tier tier = member.getTier();
		String content = request.getParameter("content");
		int parentId = Integer.parseInt(request.getParameter("matchingBoardId"));
		String lane = request.getParameter("lane");
		
		int replyId=dao.maxReplyId()+1;
	    
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("email", email);
		param.put("nickname", nickname);
		param.put("tier", tier.toString());
		param.put("content", content);
		param.put("parentId", parentId);
		param.put("lane", lane);
		
		// notice에 insert
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		Map<String, Object> param2 = new HashMap<String, Object>();
		param2.put("type", "reply");
		param2.put("targetId", replyId);
		
		
		noticeDao.insertNotice(param2);
		dao.insertReply(param);
		
		

		return null;
	}

}
