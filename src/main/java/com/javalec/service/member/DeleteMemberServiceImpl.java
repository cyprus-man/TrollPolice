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
public class DeleteMemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO DeleteMember
		HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter();
		MemberVO  loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser == null) {
			pw.write("ERROR");
			return null;
		}
		String outPw = request.getParameter("outPw");
		
		System.out.println("--------회원 탈퇴--------");
		System.out.println("회원탈퇴 입력 Pwd ="+outPw);
		System.out.println("----------------------");
		
		
		if(loginUser.getPwd().equals(outPw)) {
			// pw.write("pass");
			pw.write("pass");
			dao.deleteMember(loginUser);
			session.invalidate();
			System.out.println("탈퇴처리Ok");
		} else {
			// pw.write("wrong");
			pw.write("wrong");
			System.out.println("비밀번호틀림");
		}
		
		return null;
	}
}
