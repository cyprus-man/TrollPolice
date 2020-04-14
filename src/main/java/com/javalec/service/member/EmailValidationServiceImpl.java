package com.javalec.service.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.vo.MemberVO;

@Service
public class EmailValidationServiceImpl implements MemberAjaxService{
	@Autowired
	MemberDao dao;
	
	@Override
	public void send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		System.out.println("email:" + email);
		MemberVO member = null;
		member = dao.getMemberByEmail(email);
		
		PrintWriter pw = response.getWriter();
		
		if(member==null) {
			pw.write("pass");
		}else {
			pw.write("overlap");
		}
		
		return;
	}

}
