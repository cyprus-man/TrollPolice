package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.LiveChatDao;
import com.javalec.vo.MemberVO;

@Service
public class ValidDuoServiceImpl implements MatchingBoardService{

	@Autowired
	LiveChatDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		PrintWriter pw = response.getWriter();
		
		if(loginUser==null) {
			pw.write("FAIL");
			if(pw!=null) pw.close();
			return null;
		}
		
		int chatCount = dao.countMyChat(loginUser.getEmail());
		System.out.println("chatCount : "+chatCount);
		if(chatCount>2) {
			pw.write("EXCEED");
		}else {
			pw.write("PASS");
			if(pw!=null) pw.close();
			return null;
		}
		
		if(pw!=null) pw.close();
		return null;
	}
	
}
