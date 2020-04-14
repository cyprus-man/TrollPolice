package com.javalec.service.serviceCenter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.vo.MemberVO;

@Service
public class ServiceCenterWriteServiceImpl implements ServiceCenterService {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		if(loginUser==null) return "login";
		String email = loginUser.getEmail();
		String type =request.getParameter("type");
		int targetId = Integer.parseInt(request.getParameter("targetId"));
		
		System.out.println(type+":"+targetId);
		
		request.setAttribute("type", type);
		request.setAttribute("targetId", targetId);
		request.setAttribute("email", email);
		return "serviceCenterWrite";
	}

}
