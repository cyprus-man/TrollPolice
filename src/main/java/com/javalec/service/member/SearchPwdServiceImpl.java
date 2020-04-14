package com.javalec.service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.mailUtil.TrollMailSender;
import com.javalec.vo.MemberVO;

@Service
public class SearchPwdServiceImpl implements MemberService {
	 
	@Autowired
	private MemberDao dao;
	@Autowired
	private TrollMailSender tms;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO post 처리가 총 두번 요청될수 있따 새로고침시 .. 그 부분을 막아야함...

		//email입력이 안된경우 자바스크립트에서 block
		
//		String email = request.getParameter("email");
		String email = (String)request.getAttribute("email");
		System.out.println(email);
		MemberVO member = (MemberVO) dao.getMemberByEmail(email);

		if (member != null) {
			String title = "안녕하세요 트롤폴리스입니다. 회원님의 비밀번호 인증을 위한 암호키입니다.";
			StringBuilder contentBuilder =
							new StringBuilder("안녕하세요 ["+member.getNickname() +"] 소환사님 \r\n");
			String randomChar = RandomizedChar.excuteGenerate();
			contentBuilder.append("소환사님의 암호는 ["+randomChar+" ]로 변경되었습니다.\r\n");
			contentBuilder.append("앞으로도 많은 이용 부탁드립니다.");
			contentBuilder.append("-트롤폴리스 일동-");
			String content = contentBuilder.toString();
			member.setPwd(randomChar);
			dao.updateMember(member);
			tms.sendRandomChar(title, email ,content);
		}
		
		//등록된 이메일이 없는 경우에 처리할 함수 추가 
		
		return "main";
	}

}
