package com.javalec.service.matchingBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MatchingBoardService {
	
	public String execute(HttpServletRequest request,HttpServletResponse response )throws ServletException, IOException;

}
