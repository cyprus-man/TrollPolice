package com.javalec.service.matchingBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
@Service
public class MatchingDeleteServiceImpl implements MatchingBoardService {
	@Autowired
	public MatchingBoardDao dao;
	@Autowired
	public MatchingListServiceImpl list;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int boardId=Integer.parseInt(request.getParameter("id"));		
		System.out.println(boardId);
		dao.deleteBoard(boardId);		
		
		return list.execute(request, response);
	}

}
