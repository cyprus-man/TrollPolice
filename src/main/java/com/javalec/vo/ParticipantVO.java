package com.javalec.vo;

import java.util.List;

public class ParticipantVO {
	private long matchId;
	private int participantId; // 0~9..
	private String summonerName;
	private Lane lane;
	private int item0;
	private int item1;
	private int item2;
	private int item3;
	private int item4;
	private int item5;
	private int item6; // 
	private int kills;
	private int deaths;
	private int assists;
	private int totalHeal;
	private int totalDamageDealtToChampions;
	private int totalDamageTaken;
	private int champId;
	private int spell1;
	private int spell2;
	private int primaryRune;
	private int secondaryRune;
	
	
	public int getPrimaryRune() {
		return primaryRune;
	}
	public void setPrimaryRune(int primaryRune) {
		this.primaryRune = primaryRune;
	}
	public int getSecondaryRune() {
		return secondaryRune;
	}
	public void setSecondaryRune(int secondaryRune) {
		this.secondaryRune = secondaryRune;
	}
	public int getSpell1() {
		return spell1;
	}
	public void setSpell1(int spell1) {
		this.spell1 = spell1;
	}
	public int getSpell2() {
		return spell2;
	}
	public void setSpell2(int sepll2) {
		this.spell2 = sepll2;
	}
	//Tier
	public long getMatchId() {
		return matchId;
	}
	public void setMatchId(long matchId) {
		this.matchId = matchId;
	}
	public String getSummonerName() {
		return summonerName;
	}
	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}
	public Lane getLane() {
		return lane;
	}
	public void setLane(Lane lane) {
		this.lane = lane;
	}
	public int getItem0() {
		return item0;
	}
	public void setItem0(int item0) {
		this.item0 = item0;
	}
	public int getItem1() {
		return item1;
	}
	public void setItem1(int item1) {
		this.item1 = item1;
	}
	public int getItem2() {
		return item2;
	}
	public void setItem2(int item2) {
		this.item2 = item2;
	}
	public int getItem3() {
		return item3;
	}
	public void setItem3(int item3) {
		this.item3 = item3;
	}
	public int getItem4() {
		return item4;
	}
	public void setItem4(int item4) {
		this.item4 = item4;
	}
	public int getItem5() {
		return item5;
	}
	public void setItem5(int item5) {
		this.item5 = item5;
	}
	public int getItem6() {
		return item6;
	}
	public void setItem6(int item6) {
		this.item6 = item6;
	}
	public int getKills() {
		return kills;
	}
	public void setKills(int kills) {
		this.kills = kills;
	}
	public int getDeaths() {
		return deaths;
	}
	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}
	public int getAssists() {
		return assists;
	}
	public void setAssists(int assists) {
		this.assists = assists;
	}
	public int getTotalHeal() {
		return totalHeal;
	}
	public void setTotalHeal(int totalHeal) {
		this.totalHeal = totalHeal;
	}
	public int getTotalDamageDealtToChampions() {
		return totalDamageDealtToChampions;
	}
	public void setTotalDamageDealtToChampions(int totalDamageDealtToChampions) {
		this.totalDamageDealtToChampions = totalDamageDealtToChampions;
	}
	public int getTotalDamageTaken() {
		return totalDamageTaken;
	}
	public void setTotalDamageTaken(int totalDamageTaken) {
		this.totalDamageTaken = totalDamageTaken;
	}
	public int getChampId() {
		return champId;
	}
	public void setChampionId(int champId) {
		this.champId = champId;
	}
	/**
	 * @return the participantId
	 */
	public int getParticipantId() {
		return participantId;
	}
	/**
	 * @param participantId the participantId to set
	 */
	public void setParticipantId(int participantId) {
		this.participantId = participantId;
	}
	
	
	
	@Override
	public String toString() {
		return "ParticipantVO [matchId=" + matchId + ", participantId=" + participantId + ", summonerName="
				+ summonerName + ", lane=" + lane + ", item0=" + item0 + ", item1=" + item1 + ", item2=" + item2
				+ ", item3=" + item3 + ", item4=" + item4 + ", item5=" + item5 + ", item6=" + item6 + ", kills=" + kills
				+ ", deaths=" + deaths + ", assists=" + assists + ", totalHeal=" + totalHeal
				+ ", totalDamageDealtToChampions=" + totalDamageDealtToChampions + ", totalDamageTaken="
				+ totalDamageTaken + ", champId=" + champId + ", spell1=" + spell1 + ", spell2=" + spell2
				+ ", primaryRune=" + primaryRune + ", secondaryRune=" + secondaryRune + "]";
	}
	//TODO bubble switch to quick
	public static void sortByLane(List<ParticipantVO> participantVOList) {
		//1. 자원을 하나 더 쓸것인가?
		
		for(int i=0;i<participantVOList.size()/2;i++) {
			
				for(int j=i;j<participantVOList.size()/2;j++) {
					ParticipantVO tmp = null;
					
					if(participantVOList.get(j).getLane().ordinal() 
							< participantVOList.get(i).getLane().ordinal()) {
						tmp = participantVOList.get(j);
						participantVOList.set(j, participantVOList.get(i));
						participantVOList.set(i, tmp);
					}
				}
		}
		
		for(int i=participantVOList.size()/2;i<participantVOList.size();i++) {
				for(int j=i;j<participantVOList.size();j++) {
					ParticipantVO tmp = null;
					
					if(participantVOList.get(j).getLane().ordinal() 
							< participantVOList.get(i).getLane().ordinal()) {
						tmp = participantVOList.get(j);
						participantVOList.set(j, participantVOList.get(i));
						participantVOList.set(i, tmp);
					}
				}
			}

			
			
		}
	
}
