package com.javalec.rest;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.javalec.vo.Lane;
import com.javalec.vo.MatchVO;
import com.javalec.vo.ParticipantVO;
import com.javalec.vo.TeamStatsVO;
import com.javalec.vo.Tier;

public class APIConnection {
	// 요구사항 : 너무 오래걸리니까 좀더 시간 단축할 방법을 생각해보자...
	private static final String GET_EID_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private static final String GET_MATCH_ID_BY_EID = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";
	private static final String QUEUE_ID = "?queue=420"; // 2020-02-19 : Rank : 420
	private static final String BEGIN_INDEX = "&beginIndex=";
	private static final String END_INDEX_PURE = "&endIndex=";
	
	
	private static final String END_INDEX = "&endIndex=10";
	
	
	private static final String GET_MATCHVO_BY_MATCHID = "https://kr.api.riotgames.com/lol/match/v4/matches/";
	private static final String GET_TIER_BY_NAMEID = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";
	private static final String GET_NAMEID_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private static final String GET_NAME_BY_EID = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-account/";
	private static final String GET_MATCH_COUNT_BY_NAME_ID = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";
	
	private static InputStreamReader inputStreamReader;

	public static ArrayList<MatchVO> getMatchListByName(String name) {
		ArrayList<MatchVO> matchVOList = new ArrayList<MatchVO>();

		String eId = getEncryptedIdByName(name);
		ArrayList<Long> gameList = getGameIdListByEid(eId);
		matchVOList = getMatchVOListByGameId(gameList);
		
		for(MatchVO match : matchVOList) {
			ParticipantVO.sortByLane(match.getParticipantsVOList());
		}
		
		return matchVOList;
	}

	public static String getEncryptedIdByName(String name) {
		String encryptedId = null;
		HttpURLConnection conn = null;

		try {
			name = URLEncoder.encode(name, "UTF-8");
			name = name.replaceAll("\\+", "%20");

			URL url = new URL(GET_EID_BY_NAME + name);
			conn = (HttpURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			// TODO 존재하지 않는 id의 경우 알아서 리턴 ...
			JsonObject jsonObject = (JsonObject) JsonParser.parseReader(inputStreamReader);
			encryptedId = jsonObject.get("accountId").getAsString();
			System.out.println("in method : " + name);
		} catch (IOException e) {
			e.printStackTrace();
			encryptedId = "failed";
		} finally {
			HttpRequestManager.close(conn, inputStreamReader);
		}

		return encryptedId;
	}

	public static ArrayList<Long> getGameIdListByEid(String eId) {
		ArrayList<Long> gameIdList = new ArrayList<Long>();
		HttpURLConnection conn = null;

		try {
			eId = URLEncoder.encode(eId, "UTF-8");
			URL url = new URL(GET_MATCH_ID_BY_EID + eId + QUEUE_ID + END_INDEX);

			conn = (HttpURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			JsonObject jsonObject = (JsonObject) JsonParser.parseReader(inputStreamReader);
			JsonArray jsonArray = jsonObject.get("matches").getAsJsonArray();

			int size = jsonArray.size();

			for (int i = 0; i < size; i++) {
				long gameId = jsonArray.get(i).getAsJsonObject().get("gameId").getAsLong();
				gameIdList.add(gameId);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			HttpRequestManager.close(conn, inputStreamReader);
		}

		return gameIdList;
	}

	public static ArrayList<MatchVO> getMatchVOListByGameId(ArrayList<Long> gameIdList) {
		ArrayList<MatchVO> matchVOList = new ArrayList<MatchVO>();

		HttpURLConnection conn = null;
		try {
			for (int i = 0; i < gameIdList.size(); i++) {
				MatchVO matchVO = new MatchVO();
				URL url = new URL(GET_MATCHVO_BY_MATCHID + gameIdList.get(i));
				conn = (HttpURLConnection) url.openConnection();
				HttpRequestManager.addHeaders(conn);
				inputStreamReader = new InputStreamReader(conn.getInputStream());
				JsonObject jsonObject = (JsonObject) JsonParser.parseReader(inputStreamReader);
				long matchId = jsonObject.get("gameId").getAsLong();
				matchVO.setMatchId(matchId);
				matchVO.setGameDuration(jsonObject.get("gameDuration").getAsLong());
				// gameId 와 gameDuration 을 long타입으로 다시 변환

				JsonArray teamJsonList = jsonObject.get("teams").getAsJsonArray();
				ArrayList<TeamStatsVO> teamStatsVOList = getTSVOListByJson(teamJsonList);
				matchVO.setTeamStatsVOList(teamStatsVOList);

				for (TeamStatsVO teamStats : teamStatsVOList) {
					// 여기서 저장을 해도 위에서 저장한 값에 변경이 됨
					teamStats.setMatchId(matchId);
				}

				// summonerName, summonerEid is exists in pidentList...
				JsonArray pIdentArr = jsonObject.get("participantIdentities").getAsJsonArray();
				ArrayList<String> summonerNameList = getSummonerNameList(pIdentArr);
				
				JsonArray partyJsonList = jsonObject.get("participants").getAsJsonArray();
				ArrayList<ParticipantVO> participantVOList = getParticipantsByJson(partyJsonList, summonerNameList,
						gameIdList.get(i));

				matchVO.setParticipantsVOList(participantVOList);
				matchVOList.add(matchVO);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			HttpRequestManager.close(conn, inputStreamReader);
		}
		
		return matchVOList;
	}

	private static ArrayList<String> getSummonerNameList(JsonArray pIdentArr) {
		ArrayList<String> summonerNameList = new ArrayList<String>();

		for (int i = 0; i < pIdentArr.size(); i++) {
			JsonObject pIdent = pIdentArr.get(i).getAsJsonObject();
			JsonObject playerJson = pIdent.get("player").getAsJsonObject();
			String summonerName = playerJson.get("summonerName").getAsString();
			summonerNameList.add(summonerName);
		}

		return summonerNameList;
	}

	private static ArrayList<TeamStatsVO> getTSVOListByJson(JsonArray jsonArray) {
		// 팀 스탯을 하나로 합쳐야함...
		ArrayList<TeamStatsVO> teamStatsVOList = new ArrayList<TeamStatsVO>();

		for (int i = 0; i < jsonArray.size(); i++) {

			JsonObject teamStatsObj = jsonArray.get(i).getAsJsonObject();
			TeamStatsVO teamStatsVO = new TeamStatsVO();
			teamStatsVO.setWin(teamStatsObj.get("win").getAsString());
			teamStatsVO.setStatsId(teamStatsObj.get("teamId").getAsInt());
			teamStatsVO.setDragonKills(teamStatsObj.get("dragonKills").getAsInt());
			teamStatsVO.setBaronKills(teamStatsObj.get("baronKills").getAsInt());
			teamStatsVO.setTowerKills(teamStatsObj.get("towerKills").getAsInt());
			teamStatsVO.setInhibitorKills(teamStatsObj.get("inhibitorKills").getAsInt());
			teamStatsVOList.add(teamStatsVO);
		}

		return teamStatsVOList;
	}

	private static ArrayList<ParticipantVO> getParticipantsByJson(JsonArray partyJsonList,
			ArrayList<String> summonerNameList, long matchId) {
		ArrayList<ParticipantVO> participantVOList = new ArrayList<ParticipantVO>();
		
		for (int i = 0; i < partyJsonList.size(); i++) {
			JsonObject participantJson = partyJsonList.get(i).getAsJsonObject();
			
			JsonObject statsJson = participantJson.get("stats").getAsJsonObject();
			ParticipantVO participantVO = new ParticipantVO();
			participantVO.setSpell1(partyJsonList.get(i).getAsJsonObject().get("spell1Id").getAsInt());
			participantVO.setSpell2(partyJsonList.get(i).getAsJsonObject().get("spell2Id").getAsInt());
			
			
			participantVO.setMatchId(matchId);
			participantVO.setParticipantId(statsJson.get("participantId").getAsInt());
			participantVO.setSummonerName(summonerNameList.get(i)); // encoding
			participantVO.setAssists(statsJson.get("assists").getAsInt());
			participantVO.setChampionId(participantJson.get("championId").getAsInt());
			participantVO.setDeaths(statsJson.get("deaths").getAsInt());
			participantVO.setItem0(statsJson.get("item0").getAsInt());
			participantVO.setItem1(statsJson.get("item1").getAsInt());
			participantVO.setItem2(statsJson.get("item2").getAsInt());
			participantVO.setItem3(statsJson.get("item3").getAsInt());
			participantVO.setItem4(statsJson.get("item4").getAsInt());
			participantVO.setItem5(statsJson.get("item5").getAsInt());
			participantVO.setItem6(statsJson.get("item6").getAsInt());
			participantVO.setKills(statsJson.get("kills").getAsInt());
			participantVO.setPrimaryRune(statsJson.get("perkPrimaryStyle").getAsInt());
			participantVO.setSecondaryRune(statsJson.get("perkSubStyle").getAsInt());
			participantVO.setTotalHeal(statsJson.get("totalHeal").getAsInt());
			participantVO.setTotalDamageDealtToChampions(statsJson.get("totalDamageDealtToChampions").getAsInt());
			participantVO.setTotalDamageTaken(statsJson.get("totalDamageTaken").getAsInt());
			//participantVO.setLane();
			//TODO Lane has to be more precise
			Lane lane = Lane.MIDDLE;
			
			JsonObject timelineJson = participantJson.get("timeline").getAsJsonObject();
			if("BOTTOM".equals(timelineJson.get("lane").getAsString())) {
				if("DUO_CARRY".equals(timelineJson.get("role").getAsString())) {
					lane = Lane.BOTTOM;
				}else if("DUO_SUPPORT".equals(timelineJson.get("role").getAsString())) {
					lane = Lane.UTILITY;
				}
			}else if("TOP".equals(timelineJson.get("lane").getAsString())) {
				lane = Lane.TOP;
			}else if("JUNGLE".equals(timelineJson.get("lane").getAsString())) {
				lane = Lane.JUNGLE;
			}else if("MIDDLE".equals(timelineJson.get("lane").getAsString())) {
				lane = Lane.MIDDLE;
			}
			participantVO.setLane(lane);
			participantVOList.add(participantVO);
		}
		return participantVOList;
	}

	/*
	 * <String,String> type map for tier checking because tier needs summonerid and
	 * memberVO needs encrypedId this method is useful to signup
	 * 
	 * !!!NOT SEARCH MATCH!!!!
	 * 
	 * to append matchList to tier... you need create method....
	 */

	public static Map<String, String> getMemberIdByName(String name) {
		Map<String, String> memberIdMap = new HashMap<String, String>();

		String nameId = null;
		String eId = null;
		URL url = null;
		HttpURLConnection conn = null;

		try {
			System.out.println("---------" + name + "-------");
			// encoding to 'utf-8'
			name = URLEncoder.encode(name, "UTF-8");
			name = name.replaceAll("\\+", "%20");

			url = new URL(GET_NAMEID_BY_NAME + name);
			conn = (HttpURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			
			JsonObject jsonObject = (JsonObject) JsonParser.parseReader(inputStreamReader);
			nameId = jsonObject.get("id").getAsString();
			name = jsonObject.get("name").getAsString();
			eId = jsonObject.get("accountId").getAsString();

			// json success
			// DTO info -> https://developer.riotgames.com/apis#summoner-v4
		} catch (IOException e) {
			e.printStackTrace();
			memberIdMap.put("name", name);
			memberIdMap.put("eId", "failed");
			System.out.println(memberIdMap.toString());
			return memberIdMap;
		} finally {
			HttpRequestManager.close(conn, inputStreamReader);
		}
		
		memberIdMap.put("name", name);
		memberIdMap.put("eId", eId);
		memberIdMap.put("nameId", nameId);
		return memberIdMap;
	}

	public static Tier getTierByNameId(String nameId) {
		HttpURLConnection conn = null;
		String tier = "UNRANKED";

		try {
			URL url = new URL(GET_TIER_BY_NAMEID + nameId);
			conn = (HttpURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			JsonArray jsonArray = (JsonArray) JsonParser.parseReader(inputStreamReader);
			System.out.println(jsonArray.size());
			JsonObject jsonObject = null;

			for (int i = 0; i < jsonArray.size(); i++) {
				jsonObject = jsonArray.get(i).getAsJsonObject();
				if (jsonObject.get("queueType").getAsString().equals("RANKED_SOLO_5x5")) {
					if (jsonObject != null)
						tier = jsonObject.get("tier").getAsString();
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			HttpRequestManager.close(conn, inputStreamReader);
		}
		return Tier.valueOf(tier);
	}

	public static Map<String, String> getRenewedInfoByEid(String eId) {

		URL url = null;
		HttpURLConnection conn = null;
		String nickname = null;
		Tier tier = null;
		Map<String, String> renewMap = new HashMap<String, String>();

		try {
			url = new URL(GET_NAME_BY_EID + eId);
			conn = (HttpsURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			JsonObject jsonObject = JsonParser.parseReader(inputStreamReader).getAsJsonObject();
			nickname = jsonObject.get("name").getAsString();
			renewMap.put("nickname", nickname);

			tier = getTierByNameId(jsonObject.get("id").getAsString());
			renewMap.put("tier", tier.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpRequestManager.close(conn, inputStreamReader);
		return renewMap;
	}

	public static Map<String, Object> getMostChampByName(String nameId, String eId) {
		URL url = null;
		HttpURLConnection conn = null;
		Map<String, Object> summonerInfo = new HashMap<String, Object>();
		int wins = 0;
		int losses = 0;
		int matchCount = 0;
		int mostChamp = 0;

		int beginIndex = 0;
		int endIndex = 0;
		// champCount 구할때...
		Map<Integer, Integer> champCount = new HashMap<Integer, Integer>();

		try {
			url = new URL(GET_MATCH_COUNT_BY_NAME_ID + nameId);
			conn = (HttpURLConnection) url.openConnection();
			HttpRequestManager.addHeaders(conn);
			inputStreamReader = new InputStreamReader(conn.getInputStream());
			JsonArray league = JsonParser.parseReader(inputStreamReader).getAsJsonArray();

			for (int i = 0; i < league.size(); i++) {
				if (league.get(i).getAsJsonObject().get("queueType").getAsString().equals("RANKED_SOLO_5x5")) {
					wins = league.get(i).getAsJsonObject().get("wins").getAsInt();
					losses = league.get(i).getAsJsonObject().get("losses").getAsInt();
					matchCount = wins + losses;
					System.out.println("matchCount:" + matchCount);
					break;
				}
			}

			if (matchCount < 0) {
				// TODO 집계된 경기가 없음
				System.out.println("집계된 경기가 없습니다.");
				return null;
			} else {
				summonerInfo.put("wins", wins);
				summonerInfo.put("losses", losses);
			}

			HttpRequestManager.close(conn, inputStreamReader);

			
			// https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/D1JkYxzcJc7ATEfbM3QXY3TQiMH4MLK1wC7H49_2f4TBgrg?queue=420
			// 1번에 100개씩
			
			while (matchCount > 0) {
				if (matchCount < 100) {
					endIndex+=matchCount;
					System.out.println(endIndex);
					url = new URL(
							
							GET_MATCH_ID_BY_EID + eId + QUEUE_ID + END_INDEX_PURE + endIndex + BEGIN_INDEX + beginIndex);
				} else {
					url = new URL(GET_MATCH_ID_BY_EID + eId + QUEUE_ID + BEGIN_INDEX + beginIndex);
				}
				
				conn = (HttpURLConnection) url.openConnection();
				HttpRequestManager.addHeaders(conn);
				inputStreamReader = new InputStreamReader(conn.getInputStream());
				JsonArray matchList = JsonParser.parseReader(inputStreamReader).getAsJsonObject().get("matches")
						.getAsJsonArray();

				// jsonParse
				for (int i = 0; i < matchList.size(); i++) {
					int champion = matchList.get(i).getAsJsonObject().get("champion").getAsInt();

					if (champCount.get(champion) != null) {
						champCount.replace(champion, champCount.get(champion) + 1);
					} else {
						champCount.put(champion, 1);
					}
				}
				endIndex += 100;
				beginIndex += 100;
				
				matchCount -= 100;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		Set<Integer> keys = champCount.keySet();
		Iterator<Integer> iter = keys.iterator();
		int max = 0;
		
		while (iter.hasNext()) {
			int champ = iter.next();
			System.out.println(champ+":"+champCount.get(champ));
			if (max < champCount.get(champ)) {
				max = champCount.get(champ);
				mostChamp = champ;
			}
		}
		
		summonerInfo.put("mostChamp", mostChamp);
		//TODO 무효경기가 포함되는데 제외시킴
		return summonerInfo;
	}

	@Deprecated
	public static Tier getTierByName(String name) {
		Map<String, String> memberId = getMemberIdByName(name);
		return getTierByNameId(memberId.get("nameId"));
	}
}