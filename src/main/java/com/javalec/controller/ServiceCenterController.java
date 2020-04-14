package com.javalec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.service.serviceCenter.ServiceCenterBoardImpl;
import com.javalec.service.serviceCenter.ServiceCenterInsertImpl;
import com.javalec.service.serviceCenter.ServiceCenterService;
import com.javalec.service.serviceCenter.ServiceCenterWriteServiceImpl;
import com.javalec.service.serviceCenter.ServiceDeleteImpl;
import com.javalec.service.serviceCenter.ServiceDetailImpl;
import com.javalec.service.serviceCenter.ServiceSuspension;



@Controller
public class ServiceCenterController {
	@Autowired
	ApplicationContext ctx;
	
	ServiceCenterService service;
	
	//고객센터 게시판
	@RequestMapping("/serviceCenter")
	public String serviceCenter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service = ctx.getBean(ServiceCenterBoardImpl.class);
		return service.execute(request, response);
	}
	//고객신고 내용 전송 
	@RequestMapping("/serviceApply")
	@ResponseBody
	public String serviceCenterInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service = ctx.getBean(ServiceCenterInsertImpl.class);
		return service.execute(request, response);
	}
	
	//고객 센터 신고내용 확인
	@RequestMapping("/serviceDetail")
	public void serviceDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service = ctx.getBean(ServiceDetailImpl.class);
		service.execute(request, response);
	}
	@RequestMapping("/serviceDelete")
	public void serviceDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service = ctx.getBean(ServiceDeleteImpl.class);
		service.execute(request, response);
	}
	@RequestMapping("/serviceSuspension")
	public void serviceSuspension(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service = ctx.getBean(ServiceSuspension.class);
		service.execute(request, response);
	}
}
