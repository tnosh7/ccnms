package com.application.ccnms.user.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class UserDTO {

	private String userId;
	private String userNm;
	private String birthDT;
	private String passwd;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private String sex;
	private String hp;
	private String email;
	private String emailYN;
	private Date joinDT;
	private String profile;
	private int likePoint;
	private String emailCheck;
	private String emailAuthentication;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getBirthDT() {
		return birthDT;
	}
	public void setBirthDT(String birthDT) {
		this.birthDT = birthDT;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailYN() {
		return emailYN;
	}
	public void setEmailYN(String emailYN) {
		this.emailYN = emailYN;
	}
	public Date getJoinDT() {
		return joinDT;
	}
	public void setJoinDT(Date joinDT) {
		this.joinDT = joinDT;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getLikePoint() {
		return likePoint;
	}
	public void setLikePoint(int likePoint) {
		this.likePoint = likePoint;
	}
	public String getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}
	public String getEmailAuthentication() {
		return emailAuthentication;
	}
	public void setEmailAuthentication(String emailAuthentication) {
		this.emailAuthentication = emailAuthentication;
	}
	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userNm=" + userNm + ", birthDT=" + birthDT + ", passwd=" + passwd
				+ ", zipcode=" + zipcode + ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress
				+ ", namujiAddress=" + namujiAddress + ", sex=" + sex + ", hp=" + hp + ", email=" + email + ", emailYN="
				+ emailYN + ", joinDT=" + joinDT + ", profile=" + profile + ", likePoint=" + likePoint + ", emailCheck="
				+ emailCheck + ", emailAuthentication=" + emailAuthentication + "]";
	}
	
	

	
}
