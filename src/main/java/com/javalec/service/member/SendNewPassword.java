package com.javalec.service.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.mailUtil.TrollMailSender;
import com.javalec.vo.MemberVO;
@Service
public class SendNewPassword implements MemberService {

	@Autowired
	MemberDao dao;
	@Autowired
	TrollMailSender tms;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
		MemberVO user = dao.getMemberByEmail(email);
		if(user.getNickname().equals(nickname)) {
			pw.write("success");
			String title = "[트롤폴리스] 회원님의 새로운 비밀번호 입니다.";
			String random = RandomizedChar.excuteGenerate();
			String content = "["+nickname+"]님의 신규 비밀번호는 [ "+random+" ]입니다.";
			
			
			user.setPwd(random);
			dao.updateMember(user);
			tms.sendRandomChar(title, email, content);
		}
		else {
			pw.write("fail");
		}
		
		if(pw!=null) pw.close();
		return null;
	}

}
