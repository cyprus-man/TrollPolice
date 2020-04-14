package com.javalec.service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.mailUtil.TrollMailSender;
import com.javalec.vo.MemberVO;

@Service
public class ResendValidationImpl implements MemberService{
	@Autowired
	MemberDao dao;
	@Autowired
	TrollMailSender tms;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		loginUser.setValidation(RandomizedChar.excuteGenerate());
		
		dao.updateMember(loginUser);
		session.setAttribute("loginUser", loginUser);
		String title = "안녕하세요 트롤폴리스입니다. 이메일 인증번호를 확인해 주세요.";
		
		StringBuilder contentBuilder = new StringBuilder("경찰단원 [ "+loginUser.getNickname()+" ] 님 인증을 위한 인증번호입니다.\r\n");
		contentBuilder.append("회원님의 정식 경찰단원이 되기 위한 인증키는 [ "+loginUser.getValidation()+" ] 입니다.\r\n");
		contentBuilder.append("추가로 기존의 인증번호는 모두 만료 되었음을 알려드립니다.\r\r");
		contentBuilder.append("앞으로도 트롤경찰청의 많은 이용 부탁드립니다.\r\n");
		contentBuilder.append("----트롤경찰청 일동----");
		
		
		tms.sendRandomChar(title, loginUser.getEmail(), contentBuilder.toString()); 
		return "redirect:main";
	}
	
}
