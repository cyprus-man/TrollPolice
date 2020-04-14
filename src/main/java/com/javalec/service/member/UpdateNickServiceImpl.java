package com.javalec.service.member;

import java.io.IOException;
import java.io.PrintWriter;
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
public class UpdateNickServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			pw.write("ERROR");
			return null;
		}
		
		String nickname = request.getParameter("nickName");

		Map <String,String> jsonMap = APIConnection.getMemberIdByName(nickname);
		Tier tier = APIConnection.getTierByNameId(jsonMap.get("nameId"));
		
		System.out.println("--------닉네임 변경--------");
		System.out.println("nickName :" + nickname);
		System.out.println("tier :" + tier);
		System.out.println("------------------------");
		
		loginUser.setNickname(nickname);
		loginUser.setTier(tier);
		loginUser.setEncrypedID(jsonMap.get("eId"));
		
		//
		System.out.println(loginUser.toString());
		//
		dao.updateMember(loginUser);
		pw.write("pass");
		
		return null;
	}

}
