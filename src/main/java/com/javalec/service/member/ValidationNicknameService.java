package com.javalec.service.member;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.MemberDao;
import com.javalec.rest.APIConnection;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@Service
public class ValidationNicknameService implements MemberAjaxService {

	@Autowired
	MemberDao dao;
	
	public void send(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String nickname = request.getParameter("nickname");
		request.setCharacterEncoding("UTF-8");
		
		
		MemberVO member = null;
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		JsonWriter jw = gson.newJsonWriter(out);
		
		Map <String,String> jsonMap = APIConnection.getMemberIdByName(nickname);
		
		if (jsonMap==null) return ;
		
		member = dao.getMemberByNickname(jsonMap.get("name"));
		
		if (member == null) {
			
			if (jsonMap.get("eId").equals("failed")) {
				//날릴것 eid tier valid
				jsonMap.put("valid","notExists");
				String json = gson.toJson(jsonMap);
				System.out.println(json);
				jw.jsonValue(json);
				
			} else {
				System.out.println("등록할 수 있는 소환사" + nickname);
				jsonMap.put("valid","pass");
				System.out.println("eId" + jsonMap.get("eId"));
				
				Tier tier = APIConnection.getTierByNameId(jsonMap.get("nameId")); 
				jsonMap.put("tier",tier.toString());
				String json = gson.toJson(jsonMap);
				jw.jsonValue(json);
			}
		} else {
			System.out.println("[email : " + member.getEmail() + " ]");
			jsonMap.put("valid", "overlap");
			String json = gson.toJson(jsonMap);
			jw.jsonValue(json);
		}
	}
}
