package com.javalec.service.multiSearch;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.javalec.rest.APIConnection;
import com.javalec.vo.Tier;
@Service
public class MultiSearchActionServiceImpl {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		long nowTime = new Date().getTime();
		
		System.out.println("MultiSearchActionServiceImpl");
		String content=request.getParameter("content");
		System.out.println(content);
		String[] temp=content.split(" 님이 방에 참가했습니다.");
		
		ArrayList<String> nicknameArray=new ArrayList<String>();		
		
		for(int i=0 ;i<(temp.length)-1; i++) {
			temp[i]=temp[i].trim();
			nicknameArray.add(temp[i]);
		}
//		for(int i=0; i<nicknameArray.size(); i++) {
//			System.out.print(nicknameArray.get(i));
//		}
		ArrayList<Map<String, Object>> multiSearchMaps = new ArrayList<Map<String, Object>>();
		
		for(int i=0; i<nicknameArray.size(); i++) {
			System.out.println( nicknameArray.get(i));
			Map<String, String> memberIdMap=APIConnection.getMemberIdByName(nicknameArray.get(i));
			String nameId=memberIdMap.get("nameId");
			String eId=memberIdMap.get("eId");
			//TODO 수정 
			Tier tier=APIConnection.getTierByName(nicknameArray.get(i));
			Map<String, Object> summonerInfo=APIConnection.getMostChampByName(nameId, eId);
			summonerInfo.put("nickname", nicknameArray.get(i));		
			summonerInfo.put("tier",tier.toString());
			
			multiSearchMaps.add(summonerInfo);
		}
		for(int i=0; i<multiSearchMaps.size(); i++) {
			System.out.println(multiSearchMaps.get(i));			
		}
		
		request.setAttribute("summonerInfos", multiSearchMaps);
		System.out.println("LastTime"+(new Date().getTime()-nowTime));
		
		return "multiSearchDetail";
	}

}
