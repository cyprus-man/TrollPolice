package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MatchingReplyVO;
import com.javalec.vo.MemberVO;
@Service
public class MatchingUpdateActionServiceImpl implements MatchingBoardService {
	@Autowired
	public MatchingBoardDao dao;
	@Autowired
	MatchingDetailServiceImpl detail;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int boardId=Integer.parseInt(request.getParameter("id"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
	
		HashMap <String,Object> param= new HashMap<String,Object>();
		param.put("boardId",boardId);
		param.put("title",title);
		param.put("content", content);		
		dao.updateBoard(param);

		return detail.execute(request, response);
	}

}
