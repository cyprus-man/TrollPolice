package com.javalec.service.troller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.TrollerDao;
import com.javalec.vo.Tier;
import com.javalec.vo.TrollerVO;

@Service
public class GetTrollRankServiceImpl {
	
	@Autowired
	SqlSession sqlSession;
	
	public String execute(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		TrollerDao dao = sqlSession.getMapper(TrollerDao.class);
		String tier = request.getParameter("tier");
		if(tier == null)
			return "ranking";
		
		List<TrollerVO> trollers = dao.getTrollRank(Tier.valueOf(tier));
		
		for(TrollerVO troller : trollers ) {
			List<Map<String,Integer>> trollValue = dao.getTrollValue(troller.getNickname());
			System.out.println(trollValue.toString());
			for(int i=0;i<trollValue.size();i++)
			{
				if(trollValue.get(i).get("case")==1) {
					troller.setTroll(trollValue.get(i).get("troll"));
				}else if(trollValue.get(i).get("case")==0) {
					troller.setTie(trollValue.get(i).get("troll"));
				}else if(trollValue.get(i).get("case")==-1) {
					troller.setNotTroll(trollValue.get(i).get("troll"));
				}
				
			}
		}
		
		for(TrollerVO troller : trollers ) {
			System.out.println(troller.toString());
		}
		
		request.setAttribute("trollers", trollers);
		
		return "ranking";
	}
}
