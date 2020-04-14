package com.javalec.vo;

public class TrollerVO {
	private String nickname;
	private int trollCount;
	private Tier tier;
	private int trollChamp;
	private int troll;
	private int tie;
	private int notTroll;
	private String encrypedID;
	private String nameId;
	//eid nameid 추가
	
	
	public TrollerVO() {
		super();
		this.troll = 0;
		this.tie = 0;
		this.notTroll = 0;
	}
	
	public String getEncrypedID() {
		return encrypedID;
	}

	public void setEncrypedID(String encrypedID) {
		this.encrypedID = encrypedID;
	}

	public String getNameId() {
		return nameId;
	}

	public void setNameId(String nameId) {
		this.nameId = nameId;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getTrollCount() {
		return trollCount;
	}
	public void setTrollCount(int trollCount) {
		this.trollCount = trollCount;
	}
	public Tier getTier() {
		return tier;
	}
	public void setTier(Tier tier) {
		this.tier = tier;
	}
	public int getTrollChamp() {
		return trollChamp;
	}
	public void setTrollChamp(int trollChamp) {
		this.trollChamp = trollChamp;
	}
	public int getTroll() {
		return troll;
	}
	public void setTroll(int troll) {
		this.troll = troll;
	}
	public int getTie() {
		return tie;
	}
	public void setTie(int tie) {
		this.tie = tie;
	}
	public int getNotTroll() {
		return notTroll;
	}
	public void setNotTroll(int notTroll) {
		this.notTroll = notTroll;
	}
	@Override
	public String toString() {
		return "TrollerVO [nickname=" + nickname + ", trollCount=" + trollCount + ", tier=" + tier + ", trollChamp="
				+ trollChamp + ", troll=" + troll + ", tie=" + tie + ", notTroll=" + notTroll + "]";
	}
	
}
