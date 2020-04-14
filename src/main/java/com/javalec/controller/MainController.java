package com.javalec.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.service.mainService.MainDiscServiceImpl;
import com.javalec.service.mainService.MainDuoServiceImpl;
import com.javalec.service.mainService.MainRankingServiceImpl;
import com.javalec.service.mainService.MainService;
import com.javalec.service.notice.NoticeService;
import com.javalec.service.notice.NoticeServiceImpl;



/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@Autowired
	ApplicationContext ctx;
	
	private NoticeService service;
	private MainService mainService; 
	
	@RequestMapping("/")
	public String main2(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return main(request, response);
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request,HttpServletResponse response) throws Exception{
		service = ctx.getBean(NoticeServiceImpl.class);
		service.execute(request, response);
		return "main";
	}
	@RequestMapping("/getNotice")
	public void getNotice(HttpServletRequest request,HttpServletResponse response) throws Exception{
		service = ctx.getBean(NoticeServiceImpl.class);
		service.execute(request, response);
	}
	@RequestMapping("/emailValidation")
	public String emailVaildation() {
		return "emailValidation";
	}
	@RequestMapping("/signup")
	public String signUp() {
		return "signup";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/report")
	public String report(HttpServletRequest request) throws ServletException{
		String nickname = request.getParameter("nickname");
		request.setAttribute("nickname", nickname);
		System.out.println(nickname);
		return "report";
	}
	@RequestMapping("/reportList")
	public String reportList() {
		return "reportList";
	}
	@RequestMapping("/information")
	public String information() {
		return "information";
	}
	@RequestMapping("/mainRanking")
	public void mainRanking(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		mainService =  ctx.getBean(MainRankingServiceImpl.class);
		mainService.execute(request, response);
	}
	@RequestMapping("/mainDisc")
	public void mainDisc(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		mainService =  ctx.getBean(MainDiscServiceImpl.class);
		mainService.execute(request, response);
	}
	@RequestMapping("/mainDuo")
	public void mainDuo(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		mainService = ctx.getBean(MainDuoServiceImpl.class);
		mainService.execute(request, response);
	}
}