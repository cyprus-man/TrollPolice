package com.javalec.service.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MemberDao;
import com.javalec.rest.APIConnection;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@Service
public class NicknameRenewServiceImpl implements MemberService{

	@Autowired 
	MemberDao dao;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//TODO  닉네임 갱신
		HttpSession session = request.getSession();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			System.out.println("로그인이 되지 않았습니다.");
			return null;
		}
		
		Map<String,String> map = APIConnection.getRenewedInfoByEid(loginUser.getEncrypedID());
		System.out.println(map);
		
		String nickname = map.get("nickname");
		String tier = map.get("tier");
		
		loginUser.setNickname(nickname);
		loginUser.setTier(Tier.valueOf(tier));
		
		System.out.println("-------- 갱신될 정보 ---------");
		System.out.println(loginUser.toString());
		System.out.println("-------- 갱신될 정보 ---------");
		dao.updateMember(loginUser);
		
		return null;
	}
	
}
