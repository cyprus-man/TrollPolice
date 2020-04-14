package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.dao.MemberDao;
import com.javalec.dao.NoticeDao;
import com.javalec.rest.APIConnection;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MemberVO;

@Service
public class MatchingDetailServiceImpl implements MatchingBoardService {
	
	@Autowired
	public MatchingBoardDao dao;
	@Autowired 
	public MemberDao memberDao;
	@Autowired
	SqlSession sqlSession;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		HttpSession session = request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		 
		if(loginUser==null) return "login";
		
		String id = request.getParameter("id");		
		if(id==null) return "matchingBoard";
		
		int matchingBoardId=Integer.parseInt(id);
		MatchingBoardVO board = dao.getMatchingBoardById(matchingBoardId);
		MemberVO writer = memberDao.getMemberByEmail(board.getEmail());
			
		if(loginUser.getNickname().equals(board.getNickname())) {
			NoticeDao dao = sqlSession.getMapper(NoticeDao.class);			
			dao.confirmNoticeForReply(board.getMatchingBoardId());
		}
		
		Map<String,Object> writerInfo = APIConnection.getMostChampByName(writer.getNameId(), writer.getEncrypedID());
		
		request.setAttribute("board", board);
		request.setAttribute("writerInfo", writerInfo);
		
		return "matchingDetail";
	}	

}
