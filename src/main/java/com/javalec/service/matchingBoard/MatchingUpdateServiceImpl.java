package com.javalec.service.matchingBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MemberVO;
@Service
public class MatchingUpdateServiceImpl implements MatchingBoardService {
	@Autowired
	public MatchingBoardDao dao;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = (HttpSession)request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		int boardId=Integer.parseInt(request.getParameter("id"));
		MatchingBoardVO board = dao.getMatchingBoardById(boardId);		
		
		if(loginUser!=null && !board.getEmail().equals(loginUser.getEmail())) {
			request.setAttribute("message", "본인이 작성한 글만 수정가능합니다.");
			return "matchingBoard";
		}
		
		request.setAttribute("board", board);
		
		
		return "matchingUpdate";
	}

}
