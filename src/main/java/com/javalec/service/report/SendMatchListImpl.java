package com.javalec.service.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.rest.APIConnection;
import com.javalec.vo.MatchVO;

@Service
public class SendMatchListImpl implements AjaxService {

	@Override
	public void send(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		// TODO Auto-generated method stub
		long nowTime = new Date().getTime();
		String summonerName = request.getParameter("name");
		System.out.println(summonerName);
		ArrayList<MatchVO> matchVOList= APIConnection.getMatchListByName(summonerName);
		
		Gson gson = new Gson();
		String json = gson.toJson(matchVOList);//gson객체가 어떤 객체든지 ... 받아서 json으로 만든다 의존성 주입된경우 -> {{},{}} 이런 비정상적인 구조도 다 만들어줌 ....
		PrintWriter pw = response.getWriter(); // writer객체를 만들어야 서버로 보낼수 있음 근데 writer는 서버에서 응답해주는거니까 response를 통해 만듬 이해하셈 repuest에서 writer
		JsonWriter jw = gson.newJsonWriter(pw);
		jw.jsonValue(json);
		jw.close();
		pw.close(); 
		
		System.out.println("LastTime"+(new Date().getTime()-nowTime));
	}

	
}
