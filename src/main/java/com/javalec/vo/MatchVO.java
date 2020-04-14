package com.javalec.vo;

import java.util.ArrayList;

public class MatchVO {

	private long matchId;
	private ArrayList<TeamStatsVO> teamStatsVOList;
	private ArrayList<ParticipantVO> participantVOList;
	private long gameDuration;

	public long getMatchId() {
		return matchId;
	}

	public void setMatchId(long matchId) {
		this.matchId = matchId;
	}

	public ArrayList<TeamStatsVO> getTeamStatsVOList() {
		return teamStatsVOList;
	}

	public void setTeamStatsVOList(ArrayList<TeamStatsVO> teamStatsVOList) {
		this.teamStatsVOList = teamStatsVOList;
	}

	public ArrayList<ParticipantVO> getParticipantsVOList() {
		return participantVOList;
	}

	public void setParticipantsVOList(ArrayList<ParticipantVO> participantVOList) {
		this.participantVOList = participantVOList;
	}

	public long getGameDuration() {
		return gameDuration;
	}

	public void setGameDuration(long gameDuration) {
		this.gameDuration = gameDuration;
	}

	@Override
	public String toString() {
		return "MatchVO [matchId=" + matchId + ", teamStatsVOList=" + teamStatsVOList.toString()
				+ ", participantVOList=" + participantVOList.toString() + ", gameDuration=" + gameDuration + "]";
	}

	public void sortByLane() {
		//TODO sort by lane 라인 순서대로 보여주기 위해서 정렬 
		int partiSize = this.participantVOList.size(); // 10
		ParticipantVO tempPart;

		for (int i = 0; i < 5; i++) {

		}

	}

}
