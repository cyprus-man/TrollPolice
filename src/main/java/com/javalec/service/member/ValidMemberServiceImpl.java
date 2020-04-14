package com.javalec.service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.vo.MemberVO;

@Service
public class ValidMemberServiceImpl implements MemberService{
	@Autowired
	MemberDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1. dao 로 동일한지 확인
		String validKey = request.getParameter("validKey");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		System.out.println(member.toString());
		
		if(validKey==null||member==null) return "main";
		
		if(member.getValidation().equals(validKey)) {
			
			member.setValidation("Y");
			dao.updateMember(member);
			System.out.println(member.toString());
			session.setAttribute("loginUser", member);
			request.setAttribute("message", "인증되었습니다.");
			return "main";
		}
		
		request.setAttribute("message","인증키를 확인해주세요 .");
		return "main";
	}

}
