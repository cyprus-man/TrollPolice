package com.javalec.service.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.dao.NoticeDao;
import com.javalec.rest.APIConnection;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@Service
public class LoginServiceImpl implements MemberService {
	@Autowired
	public MemberDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		MemberVO member = (MemberVO) dao.getMemberByEmailPw(email, pwd);
		SimpleDateFormat sdf = (SimpleDateFormat) SimpleDateFormat.getInstance();
		Date date = new Date();
		
		System.out.println("----------로그인 시도-------");
		System.out.println(sdf.format(date));
		System.out.println("email:" + email);
		System.out.println("pwd:" + pwd);
		System.out.println("------------------------");

		if (member == null) {
			request.setAttribute("message", "회원정보를 확인하세요.");
			return "login";
		} else {
			if (!member.getSuspensionType().equals("NONE")) {
				long now = new Date().getTime();
				if (now - member.getSuspensionExpired() > 0) {
					// 정지 끝
					member.setSuspensionType("NONE");
					dao.updateMember(member);

				} else {
					// 정지 중
					request.setAttribute("message",
							"[ 정지중입니다  (" + sdf.format(new Date(member.getSuspensionExpired())) + "까지)]");
					return "main";
				}
			}else {
				Map<String, String> renewedInfo = APIConnection.getRenewedInfoByEid(member.getEncrypedID());
				// TIER 갱신
				if (renewedInfo.get("nickname").equals(member.getNickname())) {
					Tier tier = null;
	
					// API ERROR NULL
					if (renewedInfo.get("tier") == null) {
						request.setAttribute("message","서버 오류입니다.");
						return "login";
					}
	
					tier = Tier.valueOf(renewedInfo.get("tier"));
					if (tier != null && member.getTier() != tier) {
						member.setTier(tier);
						dao.updateMember(member);
					}
				} else {
					Tier tier = null;
					
					// API ERROR NULL
					if (renewedInfo.get("tier") == null) {
						request.setAttribute("message","서버 오류입니다.");
						return "login";
					}
					member.setNickname(renewedInfo.get("nickname"));
					tier = Tier.valueOf(renewedInfo.get("tier"));
					member.setTier(tier);
					
					dao.updateMember(member);
				}
			}
			

			System.out.println(sdf.format(date) + " 에" + "[접속유저]" + member.getNickname() + " 로그인 했습니다");
			
			HttpSession session = request.getSession();
			System.out.println(member.toString());
			session.setAttribute("loginUser", member);
			System.out.println(session.getId());
			return "redirect:main";

		}
	}
}
