package com.javalec.vo;

public class MemberVO {
	private String encrypedID; //pk
	private String email;
	private String pwd;
	private String nickname;
	private Tier tier;
	private String validation;
	private String admin_;
	private String suspensionType;
	private String nameId;
	private long suspensionExpired;
	
	
	
	public MemberVO() {
		super();
		this.admin_ = "N";
		this.suspensionType = "NONE";
		this.suspensionExpired = 0;
	}
	
	public String getNameId() {
		return nameId;
	}
	public void setNameId(String nameId) {
		this.nameId = nameId;
	}
	public String getSuspensionType() {
		return suspensionType;
	}
	public void setSuspensionType(String suspensionType) {
		this.suspensionType = suspensionType;
	}
	public long getSuspensionExpired() {
		return suspensionExpired;
	}
	public void setSuspensionExpired(long suspensionExpired) {
		this.suspensionExpired = suspensionExpired;
	}
	public String getAdmin_() {
		return admin_;
	}
	public void setAdmin_(String admin_) {
		this.admin_ = admin_;
	}
	public String getValidation() {
		return validation;
	}
	public void setValidation(String validation) {
		this.validation = validation;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEncrypedID() {
		return encrypedID;
	}
	public void setEncrypedID(String encrypedID) {
		this.encrypedID = encrypedID;
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
	@Override
	public String toString() {
		return "MemberVO [encrypedID=" + encrypedID + ", email=" + email + ", pwd=" + pwd + ", nickname=" + nickname
				+ ", tier=" + tier + ", validation=" + validation + ", admin_=" + admin_ + ", suspensionType="
				+ suspensionType + ", suspensionExpired=" + suspensionExpired + "]";
	}
	
}
