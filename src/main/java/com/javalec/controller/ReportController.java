package com.javalec.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.Sender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.service.report.AjaxService;
import com.javalec.service.report.SendMatchListImpl;
@Controller
public class ReportController {
	
	AjaxService service;
	
	@Autowired
	ApplicationContext ctx;
	
	@RequestMapping(value ="/getList", method = RequestMethod.POST)
	@ResponseBody
	public void searchList(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		service = (AjaxService) ctx.getBean(SendMatchListImpl.class);
		service.send(request, response);
	}
	
	
}
