package com.javalec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.service.multiSearch.MultiSearchActionServiceImpl;
@Controller
public class MultiSearchController {
	
	@Autowired
	ApplicationContext context;
	
	@RequestMapping("/multiSearch")
	public String multiSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		return "multiSearch";
	}
	
	@RequestMapping("/multiSearchAction")
	public String multiSearchAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MultiSearchActionServiceImpl service = context.getBean(MultiSearchActionServiceImpl.class);
		return service.execute(request, response);
	}

}
