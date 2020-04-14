package com.javalec.service.member;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.mailUtil.TrollMailSender;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@Service
public class SignupServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	@Autowired
	TrollMailSender tms;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberVO member = new MemberVO();
		String randomChar = RandomizedChar.excuteGenerate();
		// TODO post 요청이 새로고침시 두번 날라온다...//그말은 즉 두번 회원가입이 처리된다 ..//이 부분을 수정해야한다 .
		// TODO My solution is next:Create form, add method 'post'
		//TODO  Create temp page, which receives values from form.

		//TODO  2.1 Store this value in session

		//TODO  2.2 After this, redirect to another page



		String encrypedID = request.getParameter("encrypedID");
		String tier = request.getParameter("tier");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String nameId = request.getParameter("nameId");
		
		member.setEmail(email);
		member.setEncrypedID(encrypedID);
		member.setNickname(nickname);
		member.setPwd(pwd);
		member.setTier(Tier.valueOf(tier));
		member.setValidation(randomChar);
		member.setNameId(nameId);
		
		dao.insertMember(member);
		
		String title = "안녕하세요 트롤폴리스입니다. 트롤 경찰단원이 되신것을 환영합니다.";
		StringBuilder contentBuilder = new StringBuilder("신규 경찰단원 [ "+nickname+" ] 님 진심으로 환영합니다.\r\n");
		contentBuilder.append("회원님의 정식 경찰단원이 되기 위한 인증키는 [ "+randomChar+" ] 입니다.\r\n");
		contentBuilder.append("앞으로도 트롤경찰청의 많은 이용 부탁드립니다.\r\n");
		contentBuilder.append("----트롤경찰청 일동----");
		
		String content = contentBuilder.toString();
		System.out.println(content);
		tms.sendRandomChar(title, email, content);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", member);
		
		return "redirect:main";
	}
}

