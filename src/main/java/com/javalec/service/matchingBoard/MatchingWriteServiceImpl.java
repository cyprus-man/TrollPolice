package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;
@Service
public class MatchingWriteServiceImpl implements MatchingBoardService {
	
	@Autowired
	public MatchingBoardDao dao;
	@Autowired
	public MatchingListServiceImpl list;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member=(MemberVO)session.getAttribute("loginUser");
		
		String email=member.getEmail();
		String nickname=member.getNickname();
		Tier tier=member.getTier();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String lane=request.getParameter("lane");
		
		System.out.println("matchingWrite 정보------------------------------");
		System.out.println(email);
		System.out.println(nickname);
		System.out.println(tier.toString());
		System.out.println(title);
		System.out.println(content);
		System.out.println(lane);
		
		long expiredTime = 1000 * 60 * 60 * 24 * 3;
		Date now = new Date();
		 
		
		HashMap<String,String> param=new HashMap<String,String>();
		param.put("email",email);
		param.put("nickname",nickname);
		param.put("tier",tier.toString());
		param.put("title",title);
		param.put("content",content);
		param.put("expired",Long.toString(now.getTime()+expiredTime));
		param.put("lane",lane);
		
		dao.insertBoard(param);
		
		
		return list.execute(request, response);
	}

}
