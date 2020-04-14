package com.javalec.vo;

public class TeamStatsVO {
	//teamstats 
	private long matchId;
	private int statsId;
	private String win; // 1:'red" 2:"blue"
	private int inhibitorKills;
	private int dragonKills;
	private int towerKills;
	private int baronKills;

	public long getMatchId() {
		return matchId;
	}
	public void setMatchId(long matchId) {
		this.matchId = matchId;
	}
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	public int getInhibitorKills() {
		return inhibitorKills;
	}
	public void setInhibitorKills(int inhibitorKills) {
		this.inhibitorKills = inhibitorKills;
	}
	public int getDragonKills() {
		return dragonKills;
	}
	public void setDragonKills(int dragonKills) {
		this.dragonKills = dragonKills;
	}
	public int getTowerKills() {
		return towerKills;
	}
	public void setTowerKills(int towerKills) {
		this.towerKills = towerKills;
	}
	public int getBaronKills() {
		return baronKills;
	}
	public void setBaronKills(int baronKills) {
		this.baronKills = baronKills;
	}
	/**
	 * @return the statsId
	 */
	public int getStatsId() {
		return statsId;
	}
	/**
	 * @param statsId the statsId to set
	 */
	public void setStatsId(int statsId) {
		this.statsId = statsId;
	}
	
	@Override
	public String toString() {
		return "TeamStatsVO [matchId=" + matchId + ", statsId=" + statsId + ", win=" + win + ", inhibitorKills="
				+ inhibitorKills + ", dragonKills=" + dragonKills + ", towerKills=" + towerKills + ", baronKills="
				+ baronKills + "]";
	}
	
	
}
