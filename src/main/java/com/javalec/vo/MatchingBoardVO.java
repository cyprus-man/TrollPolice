package com.javalec.vo;



public class MatchingBoardVO {
	private int matchingBoardId;
	private int mostChamp;
	private String email;
	private String writeDate;
	private String content;
	private String nickname;
	private String title;
	private int readcount;
	private long expired;
	private Tier tier;
	private int participants;
	private String partner;
	private Lane lane;
	
	
	public int getMostChamp() {
		return mostChamp;
	}
	public void setMostChamp(int mostChamp) {
		this.mostChamp = mostChamp;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
	}	
	public Tier getTier() {
		return tier;
	}
	public void setTier(Tier tier) {
		this.tier = tier;
	}
	public Lane getLane() {
		return lane;
	}
	public void setLane(Lane lane) {
		this.lane = lane;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMatchingBoardId() {
		return matchingBoardId;
	}
	public void setMatchingBoardId(int matchingBoardId) {
		this.matchingBoardId = matchingBoardId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public long getExpired() {
		return expired;
	}
	public void setExpired(long expired) {
		this.expired = expired;
	}
	
	public int getParticipants() {
		return participants;
	}
	public void setParticipants(int participants) {
		this.participants = participants;
	}
	
	@Override
	public String toString() {
		return "MatchingBoardVO [matchingBoardId=" + matchingBoardId + ", email=" + email + ", writeDate=" + writeDate
				+ ", content=" + content + ", nickname=" + nickname + ", readcount=" + readcount + ", expired="
				+ expired + ", tier=" + tier + ", participants=" + participants + ", partner=" + partner + ", title="
				+ ", lane=" + lane + "]";
	}
	
}
