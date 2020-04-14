package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.Lane;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@Service
public class MatchingListServiceImpl implements MatchingBoardService {
	
	@Autowired
	public MatchingBoardDao dao;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if(loginUser==null) return "redirect:login";
		
		String rPage = request.getParameter("page");
		String tier=request.getParameter("tier");
		String lane=request.getParameter("lane");
		
		if(lane==null) lane = "NONE";		
		if(tier==null) tier = loginUser.getTier().toString();
		rPage = rPage==null ? "1" : rPage;
		
		System.out.println(tier);
		System.out.println(lane);
		System.out.println(rPage);
		
		HashMap<String,Object> param=new HashMap<String,Object>();
		param.put("page",rPage);
		param.put("tier",Tier.valueOf(tier));
		
		param.put("lane",Lane.valueOf(lane));

		
		int page=Integer.parseInt(rPage);
		
		int lastPage=((dao.countBoard(tier))/15)+1;	
		int pageStart;
		
		if(page%5==0) {
			pageStart=page-4;
		}else {
			pageStart = (page/5)*5+1;			
		}
		
		int pageEnd = pageStart+4;
		pageEnd = (pageEnd > lastPage) ? lastPage : pageEnd;
		
		
		List<MatchingBoardVO> boards = dao.list(param);		
		
		request.setAttribute("boards", boards);
		request.setAttribute("page", page);				
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("tier", tier);
		request.setAttribute("lane", lane);
		
		return "matchingBoard";
	}

}
