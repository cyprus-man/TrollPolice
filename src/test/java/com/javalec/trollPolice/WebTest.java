package com.javalec.trollPolice;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.javalec.dao.DiscussionReplyDao;
import com.javalec.dao.DiscussionReplyDaoImpl;
import com.javalec.dao.MemberDao;
import com.javalec.dao.MemberDaoImpl;
import com.javalec.dao.TrollerDao;
import com.javalec.rest.APIConnection;
import com.javalec.rest.HttpRequestManager;
import com.javalec.service.discussionBoard.DiscDetailServiceImpl;
import com.javalec.service.discussionBoard.DiscussionBoardService;
import com.javalec.service.discussionBoard.InsertDiscImpl;
import com.javalec.service.discussionBoard.ListServiceImpl;
import com.javalec.service.discussionBoard.SearchMyTrollImpl;
import com.javalec.service.discussionReply.DiscReplyListServiceImpl;
import com.javalec.service.discussionReply.DiscReplyService;
import com.javalec.service.discussionReply.ReplyInsertServiceImpl;
import com.javalec.service.member.LoginServiceImpl;
import com.javalec.service.member.MemberService;
import com.javalec.service.member.RandomizedChar;
import com.javalec.service.member.ResendValidationImpl;
import com.javalec.service.member.SearchPwdServiceImpl;
import com.javalec.service.member.ValidMemberServiceImpl;
import com.javalec.service.member.ValidationNicknameService;
import com.javalec.service.notice.NoticeServiceImpl;
import com.javalec.service.replyVote.ReplyVoteService;
import com.javalec.service.replyVote.UpVoteImpl;
import com.javalec.service.troller.GetTrollRankServiceImpl;
import com.javalec.vo.DiscussionReplyVO;
import com.javalec.vo.MatchVO;
import com.javalec.vo.MemberVO;
import com.javalec.vo.Tier;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class WebTest {
	@Autowired
	ApplicationContext context;
	@Autowired
	ValidationNicknameService service;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	SqlSession sqlSession;
	// services
	DiscussionBoardService discService;
	DiscReplyService repService;

	@Test
	@Ignore
	public void test() {
		System.out.println(context);
		for (String name : context.getBeanDefinitionNames())
			System.out.println("beanName" + name);
	}

	@Test
	@Ignore
	public void jsonSendTest() {

		try {
			service.send(request, response);
			// 존재하지 않는 소환사 일시 nullPointer가 뜬다.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void getDiscVOTest() {
//		DiscBoardDaoImpl dao = context.getBean(DiscBoardDaoImpl.class);
//		System.out.println("dao" + dao);
//		DiscussionBoardVO discBoard = dao.getBoardById(1);
//		System.out.println(discBoard.getContent() + discBoard.getMatchVO().getMatchId());
	}

	@Test
	@Ignore
	public void randomMessageTest() {
		String random = RandomizedChar.excuteGenerate();
		System.out.println(random);
	}

	@Test
	@Ignore
	public void insertMemberTest() {
		String random = RandomizedChar.excuteGenerate();
		MemberVO member = new MemberVO();
		String email = "elm1234@naver.com";

		member.setEmail(email);
		member.setEncrypedID("asdfasdfasdf1234");
		member.setNickname("김대열");
		member.setPwd("1234");
		member.setTier(Tier.UNRANKED);
		member.setValidation(random);

		// 이메이 ㄹ날리부분... - > method 로 작성

		MemberDao dao = context.getBean(MemberDaoImpl.class);

		dao.insertMember(member);
	}

	@Test
	@Ignore
	public void loginTest() {
		String email = "elmo@naver.com";
		String pwd = "12341234a";
		LoginServiceImpl service;
		request.setAttribute("email", email);
		request.setAttribute("pwd", pwd);
		service = context.getBean(LoginServiceImpl.class);

		try {
			service.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	@Ignore
	public void searchPwByEmailTest() {
		request.setAttribute("email", "elmo7180@naver.com");
		System.out.println(request.getAttribute("email"));
		MemberService service = context.getBean(SearchPwdServiceImpl.class);
		try {
			service.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void emailValidTest() throws Exception {
		ValidMemberServiceImpl service = context.getBean(ValidMemberServiceImpl.class);
		request.setAttribute("validKey", "1234");
		MemberVO member = new MemberVO();
		String email = "elmo7180@naver.com";

		member.setEmail(email);
		member.setEncrypedID("asdfasdfasdf1234");
		member.setNickname("김대열");
		member.setPwd("1234");
		member.setTier(Tier.UNRANKED);
		member.setValidation("1234");
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", member);

		service.execute(request, response);
		System.out.println("무사종료");
	}

	@Test
	@Ignore
	public void insertDiscTest() {
		discService = (DiscussionBoardService) context.getBean(InsertDiscImpl.class);
		try {
			discService.execute(request, response);
		} catch (Exception e) {
			// unsupportedOperationException
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void detailDiscTest() {
		discService = (DiscussionBoardService) context.getBean(DiscDetailServiceImpl.class);

		try {
			discService.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	@Ignore
	public void discListTest() {
		discService = (DiscussionBoardService) context.getBean(ListServiceImpl.class);
		try {
			discService.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void discDetailTest() {
		discService = (DiscussionBoardService) context.getBean(DiscDetailServiceImpl.class);
		try {
			discService.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void replyListTest() {
		repService = context.getBean(DiscReplyListServiceImpl.class);
		Date start = new Date();

		DiscussionReplyVO reply = null;
		try {
			repService.execute(request, response, reply);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("경과 시간(ms): " + (new Date().getTime() - start.getTime()));
	}

	@Test
	@Ignore
	public void insertReplyTest() {
		repService = context.getBean(ReplyInsertServiceImpl.class);
		DiscussionReplyVO reply = new DiscussionReplyVO();
		try {
			repService.execute(request, response, reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void insertVote() {
		ReplyVoteService service = context.getBean(UpVoteImpl.class);
		try {
			service.execute(request, response, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void updateUp() {
		ReplyVoteService service = context.getBean(UpVoteImpl.class);
		try {
			service.execute(request, response, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void noticeTest() {
		HttpSession session = request.getSession();
		MemberVO loginUser = new MemberVO();
		loginUser.setNickname("송대호");
		session.setAttribute("loginUser", loginUser);
		try {
			context.getBean(NoticeServiceImpl.class).execute(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Test
	@Ignore
	public void trollRankTest() throws Exception {
		GetTrollRankServiceImpl service = context.getBean(GetTrollRankServiceImpl.class);
		service.execute(request, response);
	}

	@Test
	@Ignore
	public void getTrollValueTest() throws Exception {
		TrollerDao dao = sqlSession.getMapper(TrollerDao.class);
		List<Map<String, Integer>> trollValues = dao.getTrollValue("송대호");
		for (Map<String, Integer> tValue : trollValues) {
			System.out.println(tValue.toString());
		}
	}

	@Test
	@Ignore
	public void deleteReplyTest() throws Exception {
		DiscussionReplyDao dao = context.getBean(DiscussionReplyDaoImpl.class);

		DiscussionReplyVO reply = new DiscussionReplyVO();
		reply.setReplyId(38);
		// dao.deleteReply(reply);
	}

	@Test
	@Ignore
	public void getMostChamp() throws Exception {

		System.out.println(
				"mostChamp : " + APIConnection.getMostChampByName("nPYMCMLeGQbxtk1MtdTPUKxNRFDVxcDUdUdN8RVUQ9zk0w",
						"oEZXnyodfrNRHPC7dNd57kHguAa8wlj-e4wm_UFG8lK5").get("mostChamp"));
	}

	@Test
	@Ignore
	public void SearchMyTrollImplTest() throws Exception {
		System.out.println("SearchMyTrollTest");
		MemberVO loginUser = new MemberVO();
		loginUser.setNickname("송대호");
		request.setAttribute("nickname", "짱병기마스터");
		request.getSession().setAttribute("loginUser", loginUser);
		context.getBean(SearchMyTrollImpl.class).execute(request, response);

	}

	@Test
	@Ignore
	public void getMatchListTest() {
		ArrayList<MatchVO> matchList = APIConnection.getMatchListByName("서현진여신");
		for (MatchVO match : matchList) {

			System.out.println("---------");
			for (int i = 0; i < match.getParticipantsVOList().size(); i++) {
				// System.out.println(p.getLane().toString());
				// System.out.println(p.toString());
				System.out.println(match.getParticipantsVOList().get(i).toString());
			}

			System.out.println("----------");
		}

	}

	@Test @Ignore
	public void getJson() {
		HttpURLConnection conn = null;
		InputStreamReader inputStreamReader = null;
		try {
			URL url = new URL("http://ddragon.leagueoflegends.com/cdn/10.6.1/data/en_US/summoner.json");
			conn = (HttpURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			// TODO 존재하지 않는 id의 경우 알아서 리턴 ...
			JsonObject jsonObject = (JsonObject) JsonParser.parseReader(inputStreamReader);
			JsonObject data = jsonObject.get("data").getAsJsonObject();
			System.out.println(jsonObject.toString());
			System.out.println(data.toString());
			Set<String> keySet = data.keySet();
			Iterator<String> iter = keySet.iterator();
			
			while(iter.hasNext()) {
				String key = iter.next();
				System.out.println("-----");
				System.out.print(key+": ");
				System.out.println(data.get(key).getAsJsonObject().get("key").getAsString());
				System.out.println("-----");
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			HttpRequestManager.close(conn, inputStreamReader);
		}

	}
	@Test@Ignore
	public void resendTest() throws Exception{
		HttpSession session = request.getSession();
		MemberVO loginUser = new MemberVO();
		
		session.setAttribute("loginUser", loginUser);
		context.getBean(ResendValidationImpl.class).execute(request, response);
	}
}