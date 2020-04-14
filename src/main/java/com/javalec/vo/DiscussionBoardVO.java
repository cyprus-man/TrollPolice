package com.javalec.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author kim dae yeol
 *
 */
public class DiscussionBoardVO {
	private String email;
	private Date writeDate; 
	private String content;
	private int discBoardId;
	private String nickname;
	private String troller;
	private int readcount;
	private MatchVO matchVO;
	private int up;
	private int down;
	private long expired; 
	private String writeDateString;
	private int replyCount;
	private int isVote;
	private Tier tier;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTroller() {
		return troller;
	}
	public void setTroller(String troller) {
		this.troller = troller;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");		
		setWriteDateString(sdf.format(writeDate));
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDiscBoardId() {
		return discBoardId;
	}
	public void setDiscBoardId(int discBoardId) {
		this.discBoardId = discBoardId;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public MatchVO getMatchVO() {
		return matchVO;
	}
	public void setMatchVO(MatchVO matchVO) {
		this.matchVO = matchVO;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public long getExpired() {
		return expired;
	}
	public void setExpired(long expired) {
		this.expired = expired;
	}
	
	@Override
	public String toString() {
		return "DiscussionBoardVO [email=" + email + ", writeDate=" + writeDate + ", content=" + content
				+ ", discBoardId=" + discBoardId + ", nickname=" + nickname + ", troller=" + troller + ", readCount="
				+ readcount + ", matchVO=" + matchVO + ", up=" + up + ", down=" + down + ", expired=" + expired + "]";
	}
	/**
	 * @return the writeDateString
	 */
	public String getWriteDateString() {
		return writeDateString;
	}
	/**
	 * @param writeDateString the writeDateString to set
	 */
	public void setWriteDateString(String writeDateString) {
		this.writeDateString = writeDateString;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	/**
	 * @return the isVoted
	 */
	public int getIsVote() {
		return isVote;
	}
	/**
	 * @param isVoted the isVoted to set
	 */
	public void setIsVote(int isVote) {
		this.isVote = isVote;
	}
	/**
	 * @return the tier
	 */
	public Tier getTier() {
		return tier;
	}
	/**
	 * @param tier the tier to set
	 */
	public void setTier(Tier tier) {
		this.tier = tier;
	}

}
