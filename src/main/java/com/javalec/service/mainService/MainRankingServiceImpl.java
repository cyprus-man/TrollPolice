package com.javalec.service.mainService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.javalec.dao.TrollerDao;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;
import com.javalec.vo.TrollerVO;

@Service
public class MainRankingServiceImpl implements MainService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//ranking 불러오기 .
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		TrollerDao dao = sqlSession.getMapper(TrollerDao.class);
		
		Tier tier = null;
		if(loginUser==null) 
			tier=Tier.BRONZE;
		else 
			tier = loginUser.getTier();
		List<TrollerVO> trollers = dao.getTrollRank(tier);
		
		//SET TROLL VALUE -> win draw lose
		for(TrollerVO troller : trollers) {
			List<Map<String,Integer>> trollValue = dao.getTrollValue(troller.getNickname());
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
		
		Gson gson = new Gson();
		PrintWriter pw = response.getWriter();
		JsonWriter jw = gson.newJsonWriter(pw);
		String jsonValue = gson.toJson(trollers);
		jw.jsonValue(jsonValue);
		if(pw!=null) pw.close();
		if(jw!=null) jw.close();
		
	}

}
