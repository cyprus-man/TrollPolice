package com.javalec.service.member;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.vo.MemberVO;

@Service
public class UpdatePwServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO loginUser  =(MemberVO) session.getAttribute("loginUser");
		String nowPwd = request.getParameter("nowPw");
		String newPwd = request.getParameter("newPw");
		
		System.out.println(loginUser);
		System.out.println("--------비밀번호 변경--------");
		System.out.println("pwd :" + nowPwd);
		System.out.println("-------------------------");
		
		PrintWriter pw = response.getWriter();
		if(nowPwd!=null&&loginUser!=null)
		{
			if(loginUser.getPwd().equals(nowPwd)) {
				pw.write("pass");
				loginUser.setPwd(newPwd);
				dao.updateMember(loginUser);
				session.invalidate();
				return null;
			}else {
				pw.write("wrong");
				return null;
			}
			
		}
		/*
		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("leegy5@naver.com");
		loginUser.setEncrypedID("12341234a");
		loginUser.setNickname("송대호");
		loginUser.setTier(Tier.BRONZE);
		loginUser.setValidation("Y");
		*/
		
		return "information";
	}
}
