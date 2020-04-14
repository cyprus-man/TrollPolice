package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.vo.DiscussionBoardVO;

@Service
public class ListServiceImpl implements DiscussionBoardService {
	
	@Autowired
	public DiscussionBoardDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rPage = request.getParameter("page");
		System.out.println("[ "+this.getClass().getName()+" ]");
		//
		rPage = rPage== null ? "1" : rPage;
		int page=Integer.parseInt(rPage);
		int lastPage=((dao.countBoard())/10)+1;
		int pageStart;
		
		if(page%5==0) {
			pageStart = page-4;
		}else {
			pageStart = (page/5)*5+1;		
		}
		
		
		int pageEnd = pageStart+4;
		pageEnd = (pageEnd > lastPage) ? lastPage : pageEnd;
		
		List<DiscussionBoardVO> boards = dao.list(page);
		
		request.setAttribute("boards", boards);
		request.setAttribute("page",page);				
		request.setAttribute("pageStart",pageStart);
		request.setAttribute("pageEnd", pageEnd);
		request.setAttribute("lastPage",lastPage);
		
		if(boards.size()==0) return "discussionBoard";
		//TODO 작성된 글이 없음을 알려줌
		
	return "discussionBoard";
	
	}
}
