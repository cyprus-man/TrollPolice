package com.javalec.service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberAjaxService {
	public void send(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException;
}	
